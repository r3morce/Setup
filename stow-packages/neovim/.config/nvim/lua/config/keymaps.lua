-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", ";", ":", { noremap = true })
-- vim.keymap.set("n", "<leader>r", "<cmd>registers<CR>", { desc = "Show registers" })

-- lua/config/keymaps.lua
-- Persistent registers picker using a floating window (no external plugins)
-- <leader>r opens the picker and stays open until selection or <Esc>.
-- Works in Normal/Visual/Insert. Navigate with j/k, <CR> to paste, or press register key directly.

local function build_register_lines()
	local regs = {
		'"',
		"0",
		"1",
		"2",
		"3",
		"4",
		"5",
		"6",
		"7",
		"8",
		"9",
		"-",
		"=",
		"_",
		"/",
		".",
		":",
		"%",
		"#",
		"*",
		"+",
		"a",
		"b",
		"c",
		"d",
		"e",
		"f",
		"g",
		"h",
		"i",
		"j",
		"k",
		"l",
		"m",
		"n",
		"o",
		"p",
		"q",
		"r",
		"s",
		"t",
		"u",
		"v",
		"w",
		"x",
		"y",
		"z",
	}

	local lines = {}
	local meta = {}

	for _, r in ipairs(regs) do
		local ok, val = pcall(vim.fn.getreg, r)
		local type_ok, typ = pcall(vim.fn.getregtype, r)
		if not ok then
			val = ""
		end
		if not type_ok then
			typ = ""
		end
		local oneline = val:gsub("\n", "⏎ "):gsub("\t", "⇥ ")
		local preview = (#oneline > 120) and (oneline:sub(1, 117) .. "…") or oneline
		local display = string.format(" %2s  │ %s", r, preview)
		table.insert(lines, display)
		meta[#lines] = { reg = r, value = val, rtype = typ }
	end

	return lines, meta
end

local function open_register_picker()
	local ori_mode = vim.api.nvim_get_mode().mode
	local ori_win = vim.api.nvim_get_current_win()
	local ori_buf = vim.api.nvim_get_current_buf()

	-- buffer with content
	local buf = vim.api.nvim_create_buf(false, true)
	local lines, meta = build_register_lines()
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
	vim.bo[buf].buftype = "nofile"
	vim.bo[buf].bufhidden = "wipe"
	vim.bo[buf].swapfile = false
	vim.bo[buf].modifiable = false
	vim.bo[buf].filetype = "RegistersPicker"

	-- size/position
	local width = math.max(60, math.floor(vim.o.columns * 0.6))
	local height = math.min(#lines, math.floor(vim.o.lines * 0.5))
	local row = math.floor((vim.o.lines - height) / 2 - 1)
	local col = math.floor((vim.o.columns - width) / 2)

	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		style = "minimal",
		border = "rounded",
		row = row,
		col = col,
		width = width,
		height = height,
		noautocmd = true,
	})

	local function close_picker()
		if vim.api.nvim_win_is_valid(win) then
			pcall(vim.api.nvim_win_close, win, true)
		end
	end

	local function feed(keys)
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(keys, true, false, true), "n", false)
	end

	local function paste_from_register(reg)
		close_picker()
		if not vim.api.nvim_win_is_valid(ori_win) or not vim.api.nvim_buf_is_valid(ori_buf) then
			return
		end
		vim.api.nvim_set_current_win(ori_win)
		vim.api.nvim_set_current_buf(ori_buf)

		if ori_mode:match("[vV\22]") then
			-- Visual/line/block: replace selection with register contents using p
			feed('"' .. reg .. "p")
		elseif ori_mode == "i" or ori_mode == "ic" or ori_mode == "ix" then
			-- Insert: leave insert, paste, return to insert (append)
			feed('<Esc>"' .. reg .. "pa")
		else
			-- Normal
			feed('"' .. reg .. "p")
		end
	end

	-- keymaps inside picker buffer
	vim.keymap.set("n", "<Esc>", close_picker, { buffer = buf, nowait = true, silent = true })

	-- Navigate
	vim.keymap.set("n", "j", function()
		local l = vim.api.nvim_win_get_cursor(win)[1]
		if l < #lines then
			vim.api.nvim_win_set_cursor(win, { l + 1, 0 })
		end
	end, { buffer = buf, nowait = true, silent = true })

	vim.keymap.set("n", "k", function()
		local l = vim.api.nvim_win_get_cursor(win)[1]
		if l > 1 then
			vim.api.nvim_win_set_cursor(win, { l - 1, 0 })
		end
	end, { buffer = buf, nowait = true, silent = true })

	-- Enter to paste selected line's register
	vim.keymap.set("n", "<CR>", function()
		local l = vim.api.nvim_win_get_cursor(win)[1]
		local m = meta[l]
		if m and m.reg then
			paste_from_register(m.reg)
		end
	end, { buffer = buf, nowait = true, silent = true })

	-- Direct register key: type a register char to paste immediately
	local reg_chars = [[0123456789abcdefghijklmnopqrstuvwxyz"=_/.:#%*+ -]]
	for i = 1, #reg_chars do
		local ch = reg_chars:sub(i, i)
		vim.keymap.set("n", ch, function()
			paste_from_register(ch)
		end, { buffer = buf, nowait = true, silent = true })
	end

	-- start at top
	vim.api.nvim_win_set_cursor(win, { 1, 0 })
end

-- Make sure leader is set very early in your config
vim.g.mapleader = vim.g.mapleader or " "

-- Keymap across modes: Normal/Visual/Insert
vim.keymap.set({ "n", "v", "i" }, "<leader>r", open_register_picker, { desc = "Registers (floating picker)" })

-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
local harpoon = require("harpoon")
harpoon:setup()

local function harpoon_map(lhs, fn, desc)
	vim.keymap.set("n", lhs, fn, { desc = desc })
end

harpoon_map("<leader>a", function()
	harpoon:list():add()
end, "Harpoon add file")

harpoon_map("<C-e>", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, "Harpoon quick menu")

harpoon_map("<C-h>", function()
	harpoon:list():select(1)
end, "Harpoon go to slot 1")
harpoon_map("<C-t>", function()
	harpoon:list():select(2)
end, "Harpoon go to slot 2")
harpoon_map("<C-n>", function()
	harpoon:list():select(3)
end, "Harpoon go to slot 3")
harpoon_map("<C-s>", function()
	harpoon:list():select(4)
end, "Harpoon go to slot 4")

-- Toggle previous & next buffers stored within Harpoon list
harpoon_map("<C-S-P>", function()
	harpoon:list():prev()
end, "Harpoon previous file")
harpoon_map("<C-S-N>", function()
	harpoon:list():next()
end, "Harpoon next file")

-- Leader mappings surfaced to which-key
for _, map in ipairs({
	{ "<leader>ha", function()
		harpoon:list():add()
	end, "Harpoon add file" },
	{ "<leader>hh", function()
		harpoon.ui:toggle_quick_menu(harpoon:list())
	end, "Harpoon quick menu" },
	{ "<leader>h1", function()
		harpoon:list():select(1)
	end, "Harpoon go to slot 1" },
	{ "<leader>h2", function()
		harpoon:list():select(2)
	end, "Harpoon go to slot 2" },
	{ "<leader>h3", function()
		harpoon:list():select(3)
	end, "Harpoon go to slot 3" },
	{ "<leader>h4", function()
		harpoon:list():select(4)
	end, "Harpoon go to slot 4" },
	{ "<leader>hp", function()
		harpoon:list():prev()
	end, "Harpoon previous file" },
	{ "<leader>hn", function()
		harpoon:list():next()
	end, "Harpoon next file" },
}) do
	harpoon_map(map[1], map[2], map[3])
end

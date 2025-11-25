return {
	"folke/snacks.nvim",
	opts = function(_, opts)
		opts = opts or {}
		opts.dashboard = vim.tbl_deep_extend("force", opts.dashboard or {}, {
			enabled = false,
		})
		opts.explorer = vim.tbl_deep_extend("force", opts.explorer or {}, {
			enabled = false,
		})
		return opts
	end,
}


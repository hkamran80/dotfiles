return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		vim.opt.smartindent = false

		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = {
				"lua",
				"python",
				"javascript",
				"typescript",
				"json",
				"latex",
				"markdown",
				"markdown_inline",
				"json",
				"jsdoc",
				"html",
				"tsx",
				"yaml",
				"dart",
				"vimdoc",
				"luadoc",
				"vim",
				"cpp",
				"prisma",
			},
			sync_install = false,
			highlight = {
				enable = true,
				disable = { "latex" },
			},
			indent = { enable = true },
		})

		-- Fold configuration
		vim.opt.foldmethod = "expr"
		vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

		vim.opt.foldlevel = 99
		vim.opt.foldlevelstart = 3
		vim.opt.foldnestmax = 4
		vim.opt.foldminlines = 5
	end,
}

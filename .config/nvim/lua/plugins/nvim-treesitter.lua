return {
	"nvim-treesitter/nvim-treesitter",
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
			},
			sync_install = false,
			highlight = {
				enable = true,
				disable = { "latex" },
			},
			indent = { enable = true },
		})
	end,
}

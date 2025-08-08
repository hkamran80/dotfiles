return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		ft = "markdown",
	},
	{
		"jghauser/auto-pandoc.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		ft = "markdown",
		config = function()
			vim.api.nvim_create_autocmd("BufEnter", {
				pattern = "*.md",
				callback = function()
					vim.keymap.set("n", "go", function()
						require("auto-pandoc").run_pandoc()
					end, { silent = true, buffer = 0 })
				end,
				group = vim.api.nvim_create_augroup("setAutoPandocKeymap", {}),
				desc = "Set keymap for auto-pandoc",
			})
		end,
	},
}

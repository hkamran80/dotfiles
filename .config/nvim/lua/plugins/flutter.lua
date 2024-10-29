return {
	{
		"akinsho/flutter-tools.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim",
		},
		lazy = false,
		config = function()
			require("flutter-tools").setup({
				ui = {
					notification_style = "plugin",
				},
				lsp = {
					color = {
						enabled = true,
					},
					settings = {
						showTodos = true,
						completeFunctionCalls = true,
						renameFilesWithClasses = "prompt",
						enable_snippets = true,
						updateImportsOnRename = true,
					},
				},
			})
			require("telescope").load_extension("flutter")
		end,
	},
	{ "reisub0/hot-reload.vim", ft = "dart" },
}

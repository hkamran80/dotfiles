return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	lazy = false,
	config = function()
		require("refactoring").setup()

		-- Telescope
		require("telescope").load_extension("refactoring")
		vim.keymap.set({ "n", "x" }, "<leader>rr", function()
			require("telescope").extensions.refactoring.refactors()
		end)
	end,
}

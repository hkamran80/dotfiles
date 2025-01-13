return {
	"danymat/neogen",
	config = function()
		local opts = { noremap = true, silent = true }
		vim.keymap.set("n", "<leader>nf", ":lua require('neogen').generate()<CR>", opts)

		require("neogen").setup({ snippet_engine = "luasnip" })
	end,
}

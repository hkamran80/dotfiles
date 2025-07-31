return {
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		opts = {
			ensure_installed = {
				"lua_ls",
				"marksman",
				"ts_ls",
				"texlab",
				"clangd",
				"jsonls",
				"pylsp",
				"eslint",
				"yamlls",
				"prismals",
				"vale_ls",
				"ruff",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "LspInfo", "LspInstall", "LspUninstall" },
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.lsp.config("*", { capabilities = capabilities })

			vim.lsp.config("lua_ls", {
				on_init = function(client)
					if client.workspace_folders then
						local path = client.workspace_folders[1].name
						if vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc") then
							return
						end
					end

					client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
						runtime = {
							-- Tell the language server which version of Lua you're using
							-- (most likely LuaJIT in the case of Neovim)
							version = "LuaJIT",
						},
						-- Make the server aware of Neovim runtime files
						workspace = {
							checkThirdParty = false,
							library = {
								vim.env.VIMRUNTIME,
								-- Depending on the usage, you might want to add additional paths here.
								-- "${3rd}/luv/library"
								-- "${3rd}/busted/library",
							},
							-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
							-- library = vim.api.nvim_get_runtime_file("", true)
						},
					})
				end,
			})

			vim.lsp.config("pylsp", {
				settings = {
					pylsp = {
						plugins = {
							pylsp_rope = { rename = true },
							rope_rename = { enabled = false },
							jedi_rename = { enabled = false },
						},
					},
				},
			})
			vim.lsp.config("ruff", {
				init_options = {
					settings = {
						configurationPreference = "filesystemFirst",
						lineLength = 80,
						lint = {
							select = { "E4", "E7", "E9", "F", "UP", "SIM", "I", "N", "Q" },
						},
					},
				},
			})

			vim.lsp.config("config_lsp", {
				cmd = { "config-lsp" },
				filetypes = {
					"sshconfig",
					"sshdconfig",
					"fstab",
					"aliases",
					-- Matches wireguard configs and /etc/hosts
					"conf",
				},
				root_dir = vim.loop.cwd,
			})
			vim.lsp.enable("config_lsp")

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {},
	},
}

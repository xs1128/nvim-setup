return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		config = function()
			require("mason-lspconfig").setup({
				-- Languages installed
				ensure_installed = { "lua_ls", "pylsp" },
			})
		end,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			-- Setup the languages
            local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.pylsp.setup({
				settings = {
					pylsp = {
						pylsp = {
							plugins = {
								pycodestyle = {
									ignore = { "W391" },
									maxLineLength = 100,
								},
								-- black = { enabled = true },
								-- pylint = { enabled = true, executable, "pylint" },
								-- pylsp_mypy = { enabled = true },
								-- jedi_completion = { fuzzy = true },
								-- pyls_isort = { enabled = true },
							},
						},
					},
				},
				capabilities = capabilities,
			})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}

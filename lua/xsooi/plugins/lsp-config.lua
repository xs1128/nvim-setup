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
				ensure_installed = { "lua_ls", "pylsp", "clangd" },
				auto_install = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			-- Setup the languages
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			capabilities.textDocument.foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			}

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "gf", vim.lsp.buf.format, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})

			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.pylsp.setup({
				filetypes = { "python" },
				capabilities = capabilities,
			})

			lspconfig.clangd.setup({
				capabilities = capabilities,
				cmd = { "clangd", "--background-index" },
				init_options = {
					--fallbackFlags = { "-std=c++20" },
				},
			})

			lspconfig.bashls.setup({
				filetypes = { "sh", "zsh" },
				cmd = { vim.fn.expand("/opt/homebrew/bin/bash-language-server"), "start" },
				capabilities = capabitlities,
			})
		end,
	},
}

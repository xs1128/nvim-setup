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
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			-- Setup the languages
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			capabilities.textDocument.foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			}

			lspconfig.ruby_lsp.setup({ capabilities = capabilities })

			lspconfig.lua_ls.setup({ capabilities = capabilities })

			lspconfig.pylsp.setup({ capabilities = capabilities })

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
				capabilities = capabilities,
			})

			lspconfig.denols.setup({ capabilities = capabilities })

			-- lspconfig.twiggy_language_server.setup({ capabilities = capabilities })

			lspconfig.cssls.setup({ capabilities = capabilities })

			lspconfig.verible.setup({
				cmd = { "verible-verilog-ls" },
				filetypes = { "systemverilog", "verilog" },
				root_dir = function()
					return vim.uv.cwd()
				end,
				capabilities = capabilities,
			})

			lspconfig.fortls.setup({
				capabilities = capabilities,
				root_dir = function()
					return vim.fn.getcwd()
				end,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "gf", vim.lsp.buf.format, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
		end,
	},
}

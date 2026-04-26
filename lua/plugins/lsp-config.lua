local servers = { "lua_ls", "pyright", "ts_ls", "rust_analyzer", "clangd" }

return {
	{
		"mason-org/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonUpdate", "MasonLog", "MasonUninstall" },
		opts = {},
	},

	{
		"mason-org/mason-lspconfig.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "mason-org/mason.nvim" },
		opts = { ensure_installed = servers },
	},

	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "saghen/blink.cmp" },
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			capabilities.textDocument.foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			}
			vim.lsp.config("*", { capabilities = capabilities })

			vim.keymap.set("n", "<leader>dv", function()
				vim.diagnostic.config({ virtual_text = not vim.diagnostic.config().virtual_text })
			end, { desc = "Toggle diagnostics virtual text" })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Details" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to def" })
			vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to ref" })
			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Auto Styling" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
		end,
	},

	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },
		version = "1.*",

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = {
				preset = "default",
				["<CR>"] = { "accept", "fallback" },
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
}

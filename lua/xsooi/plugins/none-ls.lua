return {
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
		},
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.clang_format.with({
						filetypes = { "c", "cpp", "objc", "objcpp" },
						args = { "-style", "{BreakBeforeBraces: Stroustrup, IndentWidth: 4}" },
					}),
					null_ls.builtins.formatting.stylua.with({
						filetypes = { "lua" },
					}),
					--null_ls.builtins.formatting.prettier,
					null_ls.builtins.formatting.black.with({
						filetypes = { "python" },
					}),
					null_ls.builtins.formatting.isort.with({
						filetypes = { "python" },
					}),
					null_ls.builtins.diagnostics.pylint,
					--null_ls.builtins.completion.spell,
					-- require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
				},
			})

			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
		end,
	},
}

return {
    {
        "mason-org/mason-lspconfig.nvim",
        -- event = "BufReadPost",
        opts = {
            ensure_installed = {
                "lua_ls",
                "pylsp",
                "ruby_lsp",
            },
            automatic_installation = true
        },
        dependencies = {
            {
                -- setup mason
                "mason-org/mason.nvim",
                build = ":MasonUpdate",
                opts = {},
            },
            {
                "neovim/nvim-lspconfig",
                config = function()
                    local capabilities = vim.lsp.protocol.make_client_capabilities()
                    capabilities.textDocument.foldingRange = {
                        dynamicRegistration = false,
                        lineFoldingOnly = true
                    }
                    local language_servers = vim.lsp.get_clients()
                    for _, ls in ipairs(language_servers) do
                        require('lspconfig')[ls].setup({
                            capabilities = capabilities
                        })
                    end
                end,

                vim.keymap.set("n", "<leader>dv", function()
                    vim.diagnostic.config({
                        virtual_text = not vim.diagnostic.config().virtual_text
                    })
                end, { desc = "Toggle diagnostics virtual text" }),

                vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Details" }),
                vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Auto Styling" }),
                -- originally <leader>gra
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
            },
        }
    },

}

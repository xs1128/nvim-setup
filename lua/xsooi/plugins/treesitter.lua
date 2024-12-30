return {
    {
        {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
            build = ":TSUpdate",
            config = function()
                local configs = require("nvim-treesitter.configs")

                configs.setup({
                    ensure_installed = {
                        "c",
                        "lua",
                        "vim",
                        "vimdoc",
                        "query",
                        "elixir",
                        "heex",
                        "javascript",
                        "html",
                        "python",
                    },
                    sync_install = false,
                    auto_install = true,
                    highlight = { enable = true },
                    indent = { enable = true },
                })
            end,
        },
    },
}

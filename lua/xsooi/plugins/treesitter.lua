return {
    {
        {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
            build = ":TSUpdate",
            config = function(_, _)
                local configs = require("nvim-treesitter.configs")

                configs.setup({
                    ensure_installed = {
                        "c",
                        "cpp",
                        "cmake",
                        "make",
                        "lua",
                        "vim",
                        "vimdoc",
                        "query",
                        "python",
                        "ninja",
                        "rst",
                        "ruby"
                    },
                    sync_install = true,
                    auto_install = true,
                    highlight = { enable = true },
                    -- indent = { enable = true },
                })
            end,
        },
    },
}

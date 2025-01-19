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
                    },
                    sync_install = false,
                    auto_install = true,
                    highlight = { enable = true },
                    indent = { enable = false },
                })
            end,
        },
    },
}

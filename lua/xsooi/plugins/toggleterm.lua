return {
    -- amongst your other plugins
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("toggleterm").setup({
                size = 10,
                hide_numbers = true, -- hide the number column in toggleterm buffers
                start_in_insert = false,
                insert_mappings = true, -- whether or not the open mapping applies in insert mode
                persist_size = true,
                direction = "horizontal",
                close_on_exit = true, -- close the terminal window when the process exits
            })
        end,
        vim.keymap.set("n", "<leader>tt", ":ToggleTerm<CR>")
    },
}

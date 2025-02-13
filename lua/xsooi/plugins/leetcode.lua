return {
	{
		"kawre/leetcode.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			-- "ibhagwan/fzf-lua",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
		build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
		opts = {
			-- configuration goes here
		},
	},
}

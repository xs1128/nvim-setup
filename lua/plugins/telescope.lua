return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	cmd = "Telescope",
	keys = {
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files({ hidden = true })
			end,
			desc = "Find Files",
		},
		{ "<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Live Grep" },
		{ "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Buffers" },
		{ "<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "Help" },
		{
			"<leader>fw",
			function()
				require("telescope").extensions.file_browser.file_browser({ path = "%:p:h", hidden = true })
			end,
			desc = "File Browser (Current Dir)",
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-tree/nvim-web-devicons", opts = {} },
		"nvim-telescope/telescope-file-browser.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},

	config = function()
		local telescope = require("telescope")
		telescope.setup({
			defaults = {},
			extensions = {
				file_browser = { hijack_netrw = true },
			},
		})

		telescope.load_extension("file_browser")
		telescope.load_extension("fzf")
	end,
}

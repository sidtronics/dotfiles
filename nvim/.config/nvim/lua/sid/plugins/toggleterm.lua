return {

	"akinsho/toggleterm.nvim",
	version = "*",
	lazy = true,
	keys = [[<C-\>]],

	opts = {

		open_mapping = [[<C-\>]],
		direction = "float",
		auto_scroll = true,
        start_in_insert = true,
        persist_mode = false,
		float_opts = {

			border = "rounded",
		},
	},
}

return {

	"akinsho/toggleterm.nvim",
	version = "*",
	lazy = true,
	keys = { [[<C-\>]], "<C-'>", "<C-@>"},

	opts = {

		open_mapping = [[<C-\>]],
		direction = "float",
		auto_scroll = true,
		float_opts = {

			border = "rounded",
		},
	},
}

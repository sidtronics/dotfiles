return {

	"akinsho/toggleterm.nvim",
	version = "*",
	lazy = true,
	keys = { [[<C-\>]], "<C-g>" },

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

    config = function (_,opts)

        require("toggleterm").setup(opts)
        local Terminal = require("toggleterm.terminal").Terminal
        local lg = Terminal:new({cmd = "lazygit", hidden = true})
        function _Lazygit_toggle() lg:toggle() end
        vim.keymap.set({"n", "t"}, "<C-g>", _Lazygit_toggle, {noremap = true, silent = true})
    end
}

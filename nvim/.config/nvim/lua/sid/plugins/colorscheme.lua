return {

    {

        "folke/tokyonight.nvim",
		lazy = true,
		priority = 1000,
		opts = {

            style = "night",
            transparent = true
		}
	},

	{
        'iruzo/matrix-nvim',
		lazy = false,
		priority = 1000,
        config = function()
            vim.g.matrix_disable_background = true
            require('matrix').set()
            vim.cmd("colorscheme matrix")
        end
	}
}

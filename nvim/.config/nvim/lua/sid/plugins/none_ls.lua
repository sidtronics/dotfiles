return {

	"nvimtools/none-ls.nvim",
	lazy = true,
    ft = {"lua", "python"},

	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({

			sources = {

				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.stylua,
			},
		})
	end,
}

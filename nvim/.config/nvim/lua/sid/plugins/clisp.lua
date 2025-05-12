return {

    "monkoose/nvlime",
    ft = "lisp",

    dependencies = {

        {
            "monkoose/parsley",
            lazy = true,
        },

        {
            "gpanders/nvim-parinfer",
            lazy = true,
        },
    },

    init = function()
        vim.g.nvlime_config = {
            cmp = { enabled = true },
            main_window = {
                position = "right",
                size = 53,
            },
            floating_window = {
                border = "rounded",
            }
        }
    end,
}

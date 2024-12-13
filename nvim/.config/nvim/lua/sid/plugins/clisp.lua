return {

    "monkoose/nvlime",
    ft = "lisp",

    dependencies = {

        {
            "monkoose/parsley",
            lazy = true
        },

        {
            "gpanders/nvim-parinfer",
            lazy = true,
        }
    },

    init = function()
        vim.g.nvlime_config = {
            cmp = { enabled = true },
        }
    end,
}

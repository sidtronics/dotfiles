return {

    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {
            disable_filetype = { "lisp" , "markdown" }
        },
    },


    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = true
    }
}

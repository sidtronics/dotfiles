return {

    "nvim-treesitter/nvim-treesitter",
    lazy = vim.fn.argc(-1) == 0,
    event = { "VeryLazy" },
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",
    opts = {

        ensure_installed = {

            "lua",
            "c",
            "cpp",
            "python",
            "go"
        },

        highlight = {

            enable = "true"
        }
    }
}

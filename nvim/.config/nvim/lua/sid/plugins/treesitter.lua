return {

   "nvim-treesitter/nvim-treesitter",
   main = "nvim-treesitter.configs",
   lazy = false,
   build = ":TSUpdate",
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

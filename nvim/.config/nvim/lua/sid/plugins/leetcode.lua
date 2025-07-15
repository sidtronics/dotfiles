local leet_arg = "leetcode.nvim"

return {

    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = {

        "nvim-lua/plenary.nvim", -- required by telescope
        "MunifTanjim/nui.nvim",

        -- optional
        "nvim-treesitter/nvim-treesitter",
        "rcarriga/nvim-notify",
        "nvim-tree/nvim-web-devicons",
    },

    lazy = leet_arg ~= vim.fn.argv()[1],

    opts = {
        arg = leet_arg,

        injector = {
            ["cpp"] = {
                before = {
                    "#include <bits/stdc++.h>",
                    "using namespace std;"
                }
            }
        }
    },

    cmd = "Leet",
}

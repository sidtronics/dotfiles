return {

    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Current buffer",
        },
    },

    opts = {

        spec = {
            { [[<C-\>]], desc = "Toggle terminal" },
            { "<leader>f", group = "Fzf" },
            { "<leader>t", group = "Toggle" },
            { "<leader>l", group = "LSP", icon = "" },
            { "<leader>m", icon = "" },
            { "<leader>z", icon = "󰒲" },
        },

        win = {
            border = "rounded"
        }
    }
}

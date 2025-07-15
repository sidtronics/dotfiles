return {

    "monkoose/nvlime",
    ft = "lisp",

    dependencies = {

        {
            "monkoose/parsley",
            lazy = true,
        },

        {
            "kovisoft/paredit",
            lazy = true,
            config = function()
                local wk = require("which-key")
                wk.add({
                    mode = "n",
                    icon = "󰅲",
                    { "<leader><",      desc = "Slurp/Barf" },
                    { "<leader>>",      desc = "Slurp/Barf" },
                    { "<leader>J",      desc = "Join" },
                    { "<leader>O",      desc = "Split" },
                    { "<leader>S",      desc = "Splice" },
                    { "<leader>I",      desc = "Raise" },
                    { "<leader>(",      desc = "Toggle" },
                    { "<leader><Up>",   desc = "Splice Next" },
                    { "<leader><Down>", desc = "Splice Prev" },
                    { "<leader>W",      desc = "Wrap",       mode = { "n", "v" } },
                })
            end
        }
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

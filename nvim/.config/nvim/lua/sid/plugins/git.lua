return {

    {
        "echasnovski/mini.diff",
        lazy = true,
        keys = {
            { "<leader>gd", "<cmd>lua MiniDiff.toggle_overlay()<cr>", desc = "Toggle Diff", noremap = true }
        },

        opts = {

            view = {

                style = 'number'
            },

            mappings = {

                apply = 'ha',
                reset = 'hr',
                textobject = 'gh',

                goto_first = '[H',
                goto_prev = '[h',
                goto_next = ']h',
                goto_last = ']H',
            },

            options = {

                wrap_goto = true
            }
        },

        config = function(_, opts)
            local minidiff = require("mini.diff")
            minidiff.setup(opts)
            minidiff.enable()
        end
    },

    {
        "FabijanZulj/blame.nvim",
        lazy = true,
        keys = {
            { "<leader>gb", "<cmd>BlameToggle<cr>", desc = "Toggle Blame", noremap = true }
        },
        config = true
    }
}

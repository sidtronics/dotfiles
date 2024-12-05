return {

    {
        "echasnovski/mini.diff",
        lazy = true,
        keys = {
            { "td", "<cmd>lua MiniDiff.toggle_overlay()<cr>", { desc = "Toggle mini.diff", noremap = true } }
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
            { "tb", "<cmd>BlameToggle<cr>", { Desc = "Toggle Blame", noremap = true } }
        },
        config = true
    }
}

return {

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
    },

    config = function(_, opts)
        local MiniDiff = require("mini.diff")
        MiniDiff.setup(opts)
        MiniDiff.enable()
    end
}

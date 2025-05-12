return {

    "rcarriga/nvim-notify",

    opts = {
        background_colour = "NotifyBackground",
        fps = 60,
        icons = {
            DEBUG = "",
            ERROR = "",
            INFO = "",
            TRACE = "✎",
            WARN = "",
        },
        level = 2,
        minimum_width = 50,
        render = "default",
        stages = "fade",
        time_formats = {
            notification = "%T",
            notification_history = "%FT%T",
        },
        timeout = 3000,
        top_down = true,
    },

    init = function()
        vim.notify = require("notify")
    end,
}

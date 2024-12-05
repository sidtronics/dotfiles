return {

    "akinsho/toggleterm.nvim",
    version = "*",
    lazy = true,
    keys = {
        [[<C-\>]],
        { "<C-g>", "<cmd>lua _Lazygit_toggle()<cr>", mode = {"n", "t"}, desc = "Lazygit", noremap = true },
        { "<leader>m", "<cmd>lua _Vimpc_toggle()<cr>", desc = "Vimpc" }
    },

    opts = {

        open_mapping = [[<C-\>]],
        direction = "float",
        auto_scroll = true,
        start_in_insert = true,
        persist_mode = false,
        shade_terminals = false,
        highlights = {
            NormalFloat = {
                guibg = "#16161e"
            },
            FloatBorder = {
                guifg = "#27a1b9",
                guibg = "#16161e"
            }
        },

        float_opts = {
            border = "rounded",
        },
    },

    config = function(_, opts)
        require("toggleterm").setup(opts)
        local Terminal = require("toggleterm.terminal").Terminal

        -- custom terminals:
        local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, count = 100, float_opts = { width = 120, height = 30 } })
        function _Lazygit_toggle() lazygit:toggle() end

        local vimpc = Terminal:new({ cmd = "vimpc", hidden = false})
        function _Vimpc_toggle() vimpc:toggle() end
    end
}

return {

    "akinsho/toggleterm.nvim",
    version = "*",
    lazy = false,
    priority = 2000,
    keys = { [[<C-\>]], "<C-g>", "<leader>vm" },

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
        vim.keymap.set({ "n", "t" }, "<C-g>", _Lazygit_toggle, { noremap = true, silent = true })

        local vimpc = Terminal:new({ cmd = "vimpc", hidden = false})
        function _Vimpc_toggle() vimpc:toggle() end
        vim.keymap.set("n", "<leader>vm", _Vimpc_toggle, { noremap = true, silent = true })
    end
}

return {

    "akinsho/toggleterm.nvim",
    version = "*",
    lazy = true,
    keys = { [[<C-\>]], "<C-g>", "<leader>vp" },

    opts = {

        open_mapping = [[<C-\>]],
        direction = "float",
        auto_scroll = true,
        start_in_insert = true,
        persist_mode = false,
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

        local vimpc = Terminal:new({ cmd = "vimpc", hidden = false, count = 1 })
        function _Vimpc_toggle() vimpc:toggle() end
        vim.keymap.set("n", "<leader>vp", _Vimpc_toggle, { noremap = true, silent = true })
    end
}

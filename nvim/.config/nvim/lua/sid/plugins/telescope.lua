return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {

        "nvim-lua/plenary.nvim",
    },

    config = function()
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>tf", builtin.find_files, {desc = "Find Files"})
        vim.keymap.set("n", "<leader>tg", builtin.live_grep, {desc = "Live Grep"})
        vim.keymap.set("n", "<leader>tb", builtin.buffers, {desc = "Find Buffer"})
        vim.keymap.set("n", "<leader>th", builtin.help_tags, {desc = "Help Tags"})
    end,
}

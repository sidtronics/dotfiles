return {

    "nvim-telescope/telescope.nvim",
    lazy = true,
    cmd = "Telescope",
    keys = {

        { "<leader>tf", "<cmd>Telescope find_files<cr>", { desc = "Find Files" } },
        { "<leader>tg", "<cmd>Telescope live_grep<cr>",  { desc = "Live Grep" } },
        { "<leader>tb", "<cmd>Telescope buffers<cr>",    { desc = "Find Buffers" } },
        { "<leader>th", "<cmd>Telescope help_tags<cr>",  { desc = "Help Tags" } },
    },
    tag = "0.1.5",
    dependencies = {

        "nvim-lua/plenary.nvim",
    },

    config = true,
}

return {

    "ibhagwan/fzf-lua",
    enabled = true,
    cmd = "FzfLua",
    keys = {
        { "<leader>fb", "<cmd>FzfLua buffers<cr>",          desc = "Buffers" },
        { "<leader>ff", "<cmd>FzfLua files<cr>",            desc = "Find Files" },
        { "<leader>fr", "<cmd>FzfLua oldfiles<cr>",         desc = "Recent Files" },
        { "<leader>fg", "<cmd>FzfLua live_grep_native<cr>", desc = "Live Grep" },
        { "<leader>fh", "<cmd>FzfLua helptags<cr>",         desc = "Help Tags" },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },

    ---@diagnostic disable-next-line: unused-local
    opts = function(_, opts)
        local actions = require("fzf-lua.actions")

        return {
            fzf_colors = true,
            fzf_opts = {
                ["--no-scrollbar"] = true,
            },

            files = {
                winopts = {
                    preview = { hidden = 'hidden' },
                },
                actions = {
                    ["default"] = actions.file_edit,
                }
            },

            oldfiles = {
                include_current_session = true,
                winopts = {
                    preview = { hidden = 'hidden' },
                },
                actions = {
                    ["default"] = actions.file_edit,
                }

            },
        }
    end,
}

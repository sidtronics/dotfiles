return {

    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {

            options = {

                component_separators = { left = "|", right = "|" },
                section_separators = { left = "", right = "" },
            },

            sections = {

                lualine_b = { "branch", "diff", { "diagnostics", update_in_insert = true } },
                lualine_c = { "filename" },
            },
        },

        init = function()
            vim.o.showmode = false
        end,
    },

    {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        dependencies = { { "nvim-tree/nvim-web-devicons" } },
        opts = {
            theme = "doom",
            config = {
                header = {

                    [[                                                                       ]],
                    [[                                                                     ]],
                    [[       ████ ██████           █████      ██                     ]],
                    [[      ███████████             █████                             ]],
                    [[      █████████ ███████████████████ ███   ███████████   ]],
                    [[     █████████  ███    █████████████ █████ ██████████████   ]],
                    [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
                    [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
                    [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
                    [[                                                                       ]],
                    [[                                                                       ]],
                    [[                                                                       ]],
                    [[                                                                       ]],
                    [[                                                                       ]],
                },

                center = {

                    {
                        icon = " ",
                        desc = "New File",
                        key = "n",
                        action = ":ene",
                    },

                    {
                        icon = " ",
                        desc = "Recent Files",
                        key = "r",
                        action = ":FzfLua oldfiles",
                    },

                    {
                        icon = " ",
                        desc = "Find Files",
                        key = "f",
                        action = ":FzfLua files",
                    },

                    {
                        icon = "󰈸 ",
                        desc = "LeetCode",
                        key = "l",
                        action = ":Leet",
                    },

                    {
                        icon = " ",
                        desc = "Config",
                        key = "c",
                        action = ":cd ~/.config/nvim/lua/sid | FzfLua files",
                    },

                    {
                        icon = "󰈆 ",
                        desc = "Quit",
                        key = "q",
                        action = ":qa",
                    },
                },
            },

            hide = {

                statusline = false,
            },
        },
    },
}

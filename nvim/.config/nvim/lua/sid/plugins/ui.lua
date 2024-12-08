return {

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {

            sections = {

                lualine_b = { "branch", "diff", { "diagnostics", update_in_insert = true } },
                lualine_c = {
                    {
                        "buffers",
                        symbols = {
                            alternate_file = ''
                        }
                    }
                }
            }
        },

        init = function()
            vim.o.showmode = false
        end
    },

    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        dependencies = { { 'nvim-tree/nvim-web-devicons' } },
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

                },

                center = {

                    {
                        icon = ' ',
                        desc = 'New File',
                        key = 'n',
                        action = ':ene'
                    },

                    {
                        icon = ' ',
                        desc = 'Recent Files',
                        key = 'r',
                        action = ':Telescope oldfiles'
                    },

                    {
                        icon = ' ',
                        desc = 'Find Files',
                        key = 'f',
                        action = ':Telescope find_files'
                    },

                    {
                        icon = '󰈸 ',
                        desc = 'LeetCode',
                        key = 'l',
                        action = ':Leet'
                    },

                    {
                        icon = ' ',
                        desc = 'Config',
                        key = 'c',
                        action = ':cd ~/.config/nvim/lua/sid | Telescope find_files'
                    },

                    {
                        icon = '󰈆 ',
                        desc = 'Quit',
                        key = 'q',
                        action = ':qa'
                    }
                },
            },

            {
                hide = {

                    statusline = false
                }
            }
        }
    }
}

return {

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
}

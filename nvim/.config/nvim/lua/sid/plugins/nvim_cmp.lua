return {

    "hrsh7th/nvim-cmp",
    lazy = false,
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "L3MON4D3/LuaSnip"
    },

    config = function()

        local cmp = require("cmp")

        cmp.setup {

            snippet = {

                expand = function(args)

                    require("luasnip").lsp_expand(args.body)
                end
            },

            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered()
            },

            mapping = cmp.mapping.preset.insert {

                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm { select = true }

            },

            sources = cmp.config.sources({

                { name = "nvim_lsp" },
                { name = "nvim_lua" },
            },

            {

                { name = "path" },
                { name = "buffer" }
            }),

            formatting = {

                fields = { "kind", "abbr", "menu" },

                format = function(entry, vim_item)

                    local kind_icons = {

                        Text = "",
                        Method = "󰆧",
                        Function = "󰊕",
                        Constructor = "",
                        Field = "󰇽",
                        Variable = "󰀫",
                        Class = "󰠱",
                        Interface = "",
                        Module = "",
                        Property = "󰜢",
                        Unit = "",
                        Value = "󰎠",
                        Enum = "",
                        Keyword = "󰌋",
                        Snippet = "",
                        Color = "󰏘",
                        File = "󰈙",
                        Reference = "",
                        Folder = "󰉋",
                        EnumMember = "",
                        Constant = "󰏿",
                        Struct = "",
                        Event = "",
                        Operator = "󰆕",
                        TypeParameter = "󰅲",
                    }

                    vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)

                    vim_item.menu = ({

                        buffer = "[Buffer]",
                        path = "[Path]",
                        nvim_lsp = "[LSP]",
                        luasnip = "[LuaSnip]",
                        nvim_lua = "[Lua]",

                    })[entry.source.name]

                    return vim_item
                end

            }
        }


        cmp.setup.cmdline(

            ':',

            {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({

                    { name = "path" },
                },

                {
                    { name = "cmdline" }
                })
            }
        )

        cmp.setup.cmdline(

            {'/', '?'},

            {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({

		            { name = "buffer" }
		        })
            }
        )
    end
}

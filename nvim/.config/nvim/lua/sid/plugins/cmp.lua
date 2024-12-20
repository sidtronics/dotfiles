return {

    {
        "Saghen/blink.compat",
        version = "*",
        lazy = true,
        config = true
    },

    {

        "Saghen/blink.cmp",
        dependencies = "rafamadriz/friendly-snippets",
        version = "v0.*",

        ----@module 'blink.cmp'
        ----@type blink.cmp.Config
        opts = {

            sources = {

                completion = {

                    enabled_providers = { 'lsp', 'path', 'snippets', 'buffer', 'nvlime' }
                },

                providers = {

                    nvlime = {

                        name = "nvlime",
                        module = "blink.compat.source",
                        score_offset = 0,
                    }
                }
            },

            completion = {

                menu = {

                    border = "rounded",
                    draw = {

                        columns = {

                            { "kind_icon",  "kind", gap = 1 },
                            { "label" },
                            { "source_name" }
                        },

                        components = {

                            source_name = {
                                text = function(ctx)
                                    return string.format("[%s]", ctx.source_name:gsub("^%l", string.upper))
                                end
                            }
                        }
                    }
                },

                documentation = {

                    auto_show = true,
                    window = {
                        border = "rounded"
                    }
                }
            },


        },

        opts_extend = { "sources.completion.enabled_providers" }
    } }

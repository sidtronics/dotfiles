return {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = {
        ".luarc.json",
        ".luarc.jsonc",
        ".luacheckrc",
        ".stylua.toml",
        "stylua.toml",
        "selene.toml",
        "selene.yml",
        ".git",
    },
    settings = {
        Lua = {
            format = {
                enable        = true,
                defaultConfig = {
                    indent_style = "space",
                    indent_size = "4",
                    quote_style = "double",
                }
            },
            diagnostics = {
                globals = {
                    "vim",
                },
            },
            workspace = {
                library = {
                    vim.fn.expand("$VIMRUNTIME/lua"),
                    vim.fn.stdpath("config") .. "/lua",
                    "${3rd}/luv/library",
                },
            },
        },
    },
}

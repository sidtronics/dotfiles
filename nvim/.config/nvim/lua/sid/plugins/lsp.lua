return {

    "neovim/nvim-lspconfig",
    lazy = false,

    dependencies = {

        {

            "williamboman/mason.nvim",
            opts = {

                ui = {

                    border = "rounded"
                }
            }
        },

        {
            "williamboman/mason-lspconfig.nvim",
            opts = {

                ensure_installed = {

                    "lua_ls",
                    "clangd",
                }
            }
        }
    }
}

require("sid.lsp.diagnostics")

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = "rounded"})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {border = "rounded"})

local lspconfig = require("lspconfig")

local servers = {

	"lua_ls",
	"clangd",
	"bashls",
	"pylsp",
    "arduino_language_server",
    "jdtls",
    "jsonls"
}

local opts = {

    capabilities = require('blink.cmp').get_lsp_capabilities(),
    on_attach = require("sid.lsp.keymaps").on_attach
}

for _, server in ipairs(servers) do

	local conf_ok , conf = pcall(require, "sid.lsp.servers." .. server)
    if not conf_ok then
        conf = {}
    end

	lspconfig[server].setup(vim.tbl_deep_extend("force", conf, opts))
end

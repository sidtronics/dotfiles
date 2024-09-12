require("sid.lsp.diagnostics")

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

    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    on_attach = require("sid.lsp.keymaps").on_attach
}

for _, server in ipairs(servers) do

	local conf_ok , conf = pcall(require, "sid.lsp.servers." .. server)
    if not conf_ok then
        conf = {}
    end

	lspconfig[server].setup(vim.tbl_deep_extend("force", conf, opts))
end

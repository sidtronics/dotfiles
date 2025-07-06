-- Configure diagnostics:
vim.diagnostic.config({
    virtual_text = false,
    update_in_insert = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "",
            [vim.diagnostic.severity.INFO] = "",
        },
    },
    float = {
        border = "rounded",
    },
})

-- Set up LSP keymaps:
local function on_attach(client, bufnr)
    local function map(lhs, rhs, desc, mode)
        mode = mode or "n"
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
    end

    map("[d", function()
        vim.diagnostic.jump({ count = -1, float = true })
    end, "Previous diagnostic")

    map("]d", function()
        vim.diagnostic.jump({ count = 1, float = true })
    end, "Next diagnostic")

    map("[e", function()
        vim.diagnostic.jump({ count = -1, float = true, severity = vim.diagnostic.severity.ERROR })
    end, "Previous error")

    map("]e", function()
        vim.diagnostic.jump({ count = 1, float = true, severity = vim.diagnostic.severity.ERROR })
    end, "Next error")

    map("gl", vim.diagnostic.open_float, "Line diagnostics")

    map("grr", "<cmd>FzfLua lsp_references<cr>", "References")

    map("gy", "<cmd>FzfLua lsp_typedefs<cr>", "Type definition")

    map("<leader>fs", "<cmd>FzfLua lsp_document_symbols<cr>", "Document symbols")

    if client:supports_method("textDocument/definition") then
        map("gd", vim.lsp.buf.definition, "Definition")
    end

    if client:supports_method("textDocument/declaration") then
        map("gD", vim.lsp.buf.declaration, "Declaration")
    end

    if client:supports_method("textDocument/implementation") then
        map("gI", vim.lsp.buf.implementation, "Implementation")
    end

    if client:supports_method("textDocument/hover") then
        map("K", function()
            vim.lsp.buf.hover({ border = "rounded" })
        end, "Hover")
    end

    if client:supports_method("textDocument/rename") then
        map("<leader>lr", vim.lsp.buf.rename, "Rename")
    end

    if client:supports_method("textDocument/formatting") then
        map("<leader>lf", function()
            vim.lsp.buf.format({ async = true })
        end, "Format")
    end

    if client:supports_method("textDocument/signatureHelp") then
        map("<leader>ls", function()
            vim.lsp.buf.signature_help({ border = "rounded" })
        end, "Signature")
    end

    if client:supports_method("textDocument/codeAction") then
        map("<leader>la", vim.lsp.buf.code_action, "Action")
    end
end

local register_capability = vim.lsp.handlers["client/registerCapability"]
---@diagnostic disable-next-line: duplicate-set-field
vim.lsp.handlers["client/registerCapability"] = function(err, res, ctx)
    local client = vim.lsp.get_client_by_id(ctx.client_id)
    if not client then
        return
    end
    on_attach(client, vim.api.nvim_get_current_buf())
    return register_capability(err, res, ctx)
end

vim.api.nvim_create_autocmd("LspAttach", {
    desc = "Configure LSP keymaps",
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then
            return
        end
        on_attach(client, args.buf)
    end,
})


-- Enable LSPs lazily
vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
    once = true,
    callback = function()
        local server_configs = vim.iter(vim.api.nvim_get_runtime_file("lsp/*.lua", true))
            :map(function(file)
                return vim.fn.fnamemodify(file, ":t:r")
            end)
            :totable()
        vim.lsp.enable(server_configs)
    end,
})

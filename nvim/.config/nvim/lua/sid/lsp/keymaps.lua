local M = {}

M.on_attach = function(_, bufnr)
    local map = function(lhs, rhs, desc)
        vim.api.nvim_buf_set_keymap(bufnr, "n", lhs, rhs, {desc=desc, noremap=true, silent=true})
    end
    map("gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", "Declaration")
    map("gd", "<cmd>lua vim.lsp.buf.definition()<cr>", "Definition")
    map("K", "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover")
    map("gI", "<cmd>lua vim.lsp.buf.implementation()<cr>", "Implementation")
    map("gr", "<cmd>lua vim.lsp.buf.references()<cr>", "References")
    map("gl", "<cmd>lua vim.diagnostic.open_float()<cr>", "Line Diagnostics")
    map("g]", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", "Next Diagnostic")
    map("g[", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", "Prev Diagnostic")
    map("<leader>lf", "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format")
    map("<leader>li", "<cmd>LspInfo<cr>", "LSP Info")
    map("<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action")
    map("<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename")
    map("<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature")
    map("<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", "Diagnostics")
end

return M

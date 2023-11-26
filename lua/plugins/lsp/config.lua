local lsp_zero = require('lsp-zero')
local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            },
        },
    },
})

lsp_zero.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = ''
})

vim.diagnostic.config({
  virtual_text = true,
  severity_sort = true,
  float = {
    style = 'minimal',
    border = 'none',
    source = 'always',
    header = '',
    prefix = '',
  },
})

lsp_zero.on_attach(function(_, bufnr)
    local opts = { buffer = bufnr, remap = false }
    lsp_zero.default_keymaps({buffer = bufnr})

    vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = { '*.tsx', '*.ts', '*.jsx', '*.js', '*.vue', '*.cjs', '*.mjs', '*.json', '*.css', '*.scss', '*.less', '*.yml', '*.svelte' },
        command = 'silent! EslintFixAll',
        group = vim.api.nvim_create_augroup('EslintAutocmdsFormatting', {}),
    })

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "<leader>ls", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "<leader>D", function() vim.lsp.buf.type_definition() end, opts)
end)

require('mason-lspconfig').setup({
    handlers = {
        lsp_zero.default_setup,
    },
    ensure_installed = {
        'lua_ls',
        'html',
        'eslint',
        'gopls',
        'rust_analyzer',
        'zls',
    },
})

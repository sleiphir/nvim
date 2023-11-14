local lsp = require("lsp-zero")
local lspconfig = require('lspconfig')
local home = vim.fn.expand('$HOME')

-- Activate intelephense
lspconfig.intelephense.setup {
    cmd = { "intelephense", "--stdio" },
    settings = {
        intelephense = {
            licenceKeyPath = home .. '/intelephense/license.txt'
        }
    }
}

lsp.preset("recommended")

lsp.ensure_installed({
    'tsserver',
    'rust_analyzer',
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()


local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = true,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    -- Format on save
    -- vim.api.nvim_create_autocmd("BufWritePost", {
    --     callback = function()
    --         vim.lsp.buf.format()
    --     end
    -- })

    -- Eslint auto fix on save
    vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = { '*.tsx', '*.ts', '*.jsx', '*.js', '*.vue', '*.cjs', '*.mjs', '*.json', '*.css', '*.scss', '*.less', '*.yml' },
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

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

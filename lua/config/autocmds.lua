vim.api.nvim_create_autocmd({"BufWritePre"}, {
    group = vim.api.nvim_create_augroup("Default", {}),
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

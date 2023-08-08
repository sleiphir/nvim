local builtin = require('telescope.builtin')

-- Function to check if the current directory is a git directory
local function is_git_directory()
    return vim.fn.system('git rev-parse --is-inside-work-tree') == 1
end

-- Custom function that calls git_files if in a git directory, otherwise find_files
local function custom_git_files()
    if is_git_directory() then
        builtin.git_files()
    else
        builtin.find_files()
    end
end

-- Keybindings
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', custom_git_files, {}) -- Use the custom function here
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

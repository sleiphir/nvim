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
vim.keymap.set('n', '<leader>pf', function()
    builtin.find_files({ no_ignore = true, hidden = true })
end)
vim.keymap.set('n', '<C-p>', custom_git_files, {})
vim.keymap.set('n', '<leader>ps', function() builtin.live_grep() end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fa', function() builtin.find_files({ follow = true, no_ignore = true, hidden = true }) end)
vim.keymap.set('n', '<leader>fb', function() builtin.buffers() end)
vim.keymap.set('n', '<leader>cm', function() builtin.git_commits() end)
vim.keymap.set('n', '<leader>gt', function() builtin.git_status() end)


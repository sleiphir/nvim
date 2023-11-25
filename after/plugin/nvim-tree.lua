require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = { width = 40, },
    filters = {
        git_ignored = false,
        dotfiles = false,
    },
    actions = {
        open_file = {
            quit_on_open = true,
        },
    },
    renderer = {
        group_empty = true,
        icons = {
            web_devicons = {
                file = {
                    enable = true,
                    color = true,
                },
                folder = {
                    enable = false,
                    color = true,
                },
            },
            git_placement = "before",
            modified_placement = "after",
            diagnostics_placement = "signcolumn",
            bookmarks_placement = "signcolumn",
            padding = " ",
            symlink_arrow = " ➛ ",
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
                modified = true,
                diagnostics = true,
                bookmarks = true,
            },
            glyphs = {
                default = "",
                symlink = "",
                bookmark = "󰆤",
                modified = "●",
                folder = {
                    arrow_closed = "",
                    arrow_open = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "★",
                    deleted = "",
                    ignored = "◌",
                },
            },
        },
    },
})

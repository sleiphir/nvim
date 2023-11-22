require "ibl".setup {
    scope = {
        enabled = true,
        highlight = { "Ignore", "Label" },
        show_start = false,
        show_end = false,
        include = {
            node_type = {
                lua = { "table_constructor" },
            },
        },
    },
    whitespace = {
        highlight = "Ignore",
    },
    indent = {
        char = "▏",
        highlight = { "Ignore", "Comment" },
    },
    exclude = {
        buftypes = { "terminal", "nofile" },
    },
}

require "ibl".setup {
    scope = {
        enabled = true,
        char = "▏",
        show_start = false,
        show_end = false,
        include = {
            node_type = {
                lua = { "table_constructor" },
            },
        },
    },
    indent = {
        char = "▏",
    },
    exclude = {
        buftypes = { "terminal", "nofile" },
    },
}

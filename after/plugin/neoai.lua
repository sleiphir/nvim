require("neoai").setup({
    models = {
        {
            name = "openai",
            model = "gpt-4",
            params = nil,
        },
    },
    open_ai = {
        api_key = {
            env = "OPENAI_API_KEY",
            value = nil,
            get = function()
                local key = vim.fn.system("pass show openai/api_key")
                key = string.gsub(key, "\n", "")
                return key
            end,
        },
    },
    shortcuts = {
        {
            name = "textify",
            key = "<leader>as",
            desc = "fix text with AI",
            use_context = true,
            prompt = [[
                Please rewrite the text to make it more readable, clear,
                concise, and fix any grammatical, punctuation, or spelling
                errors
            ]],
            modes = { "v" },
            strip_function = nil,
        },
        {
            name = "gitcommit",
            key = "<leader>ag",
            desc = "generate git commit message",
            use_context = false,
            prompt = function()
                return [[
                    With specifications from conventionalcommits.org,
                    the commit message should be formatted as follows:
                    <type>[optional scope]: <description>

                    [optional body]

                    [optional footer(s)]
                    Using the following git diff generate a consise and
                    clear git commit message, with a short title summary
                    that is 75 characters or less.
                    ]] .. vim.fn.system("git diff --cached")
            end,
            modes = { "n" },
            strip_function = nil,
        },
    },
})

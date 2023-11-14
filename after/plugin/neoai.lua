require("neoai").setup({
    models = {
        {
            name = "openai",
            model = "gpt-4-1106-preview",
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
                    Here are some examples of commit messages:
                    =========================================
                    feat: holiday-themed devcard

                    Our DevCard now features a holiday theme for both Halloween and Christmas!
                    This also includes a link pointing to Chris' article on how to embed it on your GitHub Profile.

                    DD-267 #done
                    =========================================
                    build(extension): version 3.8.0
                    =========================================
                    chore!: drop Node 6 from testing matrix

                    BREAKING CHANGE: dropping Node 6 which hits end of life in April
                    =========================================
                    ci: use pulumi common new kubernetes helpers
                    =========================================
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

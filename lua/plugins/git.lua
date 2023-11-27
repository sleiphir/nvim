return {
    -- Fugitive
    {
        "tpope/vim-fugitive",
        event = { "BufReadPost", "BufNewFile", "BufWritePre", "VeryLazy" },
        config = function()
            local function map(mode, l, r, desc)
                vim.keymap.set(mode, l, r, { silent = true, noremap = true, desc = desc })
            end

            map("n", "<leader>gs", "<cmd>Git<CR>", "Git Status")
            map("n", "<leader>gd", "<cmd>Gvdiffsplit!<CR>", "Git Diff")
            map("n", "<leader>gbl", "<cmd>Git blame<CR>", "Git Blame")
            map("n", "<leader>gc", "<cmd>Git commit<CR>", "Git Commit")
            map("n", "<leader>gC", "<cmd>Git commit --amend<CR>", "Git Commit Amend")
            map("n", "<leader>gp", "<cmd>Git push<CR>", "Git Push")
            map("n", "<leader>gS", "<cmd>Git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)<CR>", "Git Push Set Upstream")
            map("n", "<leader>gbs", "<cmd>Git bisect start<CR>", "Git Bisect Start")
            map("n", "<leader>gbg", "<cmd>Git bisect good<CR>", "Git Bisect Good")
            map("n", "<leader>gbb", "<cmd>Git bisect bad<CR>", "Git Bisect Bad")
            map("n", "<leader>gbr", "<cmd>Git bisect reset<CR>", "Git Bisect Reset")
        end
    },
    -- Gitsigns
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPost", "BufNewFile", "BufWritePre", "VeryLazy" },
        opts = {
            signs = {
                add = { text = "▎" },
                change = { text = "▎" },
                delete = { text = "" },
                topdelete = { text = "" },
                changedelete = { text = "▎" },
                untracked = { text = "▎" },
            },
            on_attach = function(buffer)
                local gs = package.loaded.gitsigns

                local function map(mode, l, r, desc)
                    vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
                end

                map("n", "]h", gs.next_hunk, "Next Hunk")
                map("n", "[h", gs.prev_hunk, "Prev Hunk")
                map({ "n", "v" }, "<leader>ghs", "<cmd>Gitsigns stage_hunk<CR>", "Stage Hunk")
                map({ "n", "v" }, "<leader>ghr", "<cmd>Gitsigns reset_hunk<CR>", "Reset Hunk")
                map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
                map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
                map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
                map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
                map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
                map("n", "<leader>ghd", gs.diffthis, "Diff This")
                map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
                map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
            end,
        },
    },
}

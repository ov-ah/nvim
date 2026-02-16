return {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    config = function()
        require("gitsigns").setup({
            on_attach = function(bufnr)
                local gs = require("gitsigns")
                local map = function(mode, keys, func, desc)
                    vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc })
                end

                map("n", "]h", gs.next_hunk, "next hunk")
                map("n", "[h", gs.prev_hunk, "prev hunk")
                map("n", "<leader>hs", gs.stage_hunk, "stage hunk")
                map("n", "<leader>hr", gs.reset_hunk, "reset hunk")
                map("n", "<leader>hp", gs.preview_hunk, "preview hunk")
                map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, "blame line")
                map("n", "<leader>hd", gs.diffthis, "diff this")
            end,
        })
    end,
}

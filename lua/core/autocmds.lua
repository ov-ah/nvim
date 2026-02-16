local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
autocmd("TextYankPost", {
    desc = "Highlight when yanking text",
    callback = function()
        vim.highlight.on_yank({ timeout = 200 })
    end,
})

-- Remove trailing whitespace on save
autocmd("BufWritePre", {
    desc = "Remove trailing whitespace on save",
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- Return to last edit position when opening files
autocmd("BufReadPost", {
    desc = "Return to last edit position",
    callback = function(args)
        local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
        local lcount = vim.api.nvim_buf_line_count(args.buf)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

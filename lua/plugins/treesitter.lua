return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPost",
    config = function()
        require("nvim-treesitter").setup({})

        -- Auto-install parsers on first encounter
        local parsers = { "lua", "python", "c", "cpp", "bash", "markdown", "vim", "vimdoc" }

        vim.api.nvim_create_autocmd("FileType", {
            callback = function()
                local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
                if lang and vim.tbl_contains(parsers, lang) then
                    pcall(vim.treesitter.start)
                end
            end,
        })

        -- Install missing parsers
        local installed = require("nvim-treesitter").get_installed()
        local to_install = vim.tbl_filter(function(p)
            return not vim.tbl_contains(installed, p)
        end, parsers)

        if #to_install > 0 then
            vim.cmd("TSInstall " .. table.concat(to_install, " "))
        end
    end,
}

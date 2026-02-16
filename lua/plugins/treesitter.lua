return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPost",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "lua",
                "python",
                "c",
                "cpp",
                "bash",
                "markdown",
                "vim",
                "vimdoc",
            },
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}

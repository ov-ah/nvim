return {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("gruvbox").setup({
            contrast = "hard",
            italic = {
                strings = false,
                emphasis = false,
                comments = true,
                operators = false,
            },
        })
        vim.cmd.colorscheme("gruvbox")
    end,
}

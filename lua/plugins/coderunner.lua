return {
    "CRAG666/code_runner.nvim",
    keys = {
        { "<leader>r", "<cmd>RunCode<CR>", desc = "Run file" },
        { "<leader>rc", "<cmd>RunClose<CR>", desc = "Close runner" },
    },
    config = function()
        require("code_runner").setup({
            mode = "term",
            focus = true,
            startinsert = true,
            filetype = {
                python = "python3 -u",
                lua = "lua",
                c = "cd $dir && gcc $fileName -o $fileNameWithoutExt -lm && ./$fileNameWithoutExt",
                cpp = "cd $dir && g++ $fileName -o $fileNameWithoutExt -std=c++17 && ./$fileNameWithoutExt",
                rust = "cd $dir && rustc $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt",
                bash = "bash",
                sh = "bash",
            },
        })
    end,
}

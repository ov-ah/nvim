return {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "pyright",
                "clangd",
            },
        })

        local lspconfig = require("lspconfig")
        local capabilities = vim.lsp.protocol.make_client_capabilities()

        -- Try to enhance capabilities with cmp if available
        local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
        if ok then
            capabilities = cmp_lsp.default_capabilities(capabilities)
        end

        -- Keymaps on LSP attach
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local map = function(keys, func, desc)
                    vim.keymap.set("n", keys, func, { buffer = args.buf, desc = desc })
                end

                map("gd", vim.lsp.buf.definition, "Go to definition")
                map("gD", vim.lsp.buf.declaration, "Go to declaration")
                map("gr", vim.lsp.buf.references, "Go to references")
                map("gi", vim.lsp.buf.implementation, "Go to implementation")
                map("K", vim.lsp.buf.hover, "Hover documentation")
                map("<leader>ca", vim.lsp.buf.code_action, "Code action")
                map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
                map("<leader>D", vim.lsp.buf.type_definition, "Type definition")
                map("[d", vim.diagnostic.goto_prev, "Previous diagnostic")
                map("]d", vim.diagnostic.goto_next, "Next diagnostic")
                map("<leader>d", vim.diagnostic.open_float, "Show diagnostic")
            end,
        })

        -- Server configs
        lspconfig.lua_ls.setup({
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = { globals = { "vim" } },
                    workspace = { checkThirdParty = false },
                },
            },
        })

        lspconfig.pyright.setup({ capabilities = capabilities })
        lspconfig.clangd.setup({ capabilities = capabilities })
    end,
}

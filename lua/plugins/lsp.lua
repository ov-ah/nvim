return {
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        event = "BufReadPre",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
            if ok then
                capabilities = cmp_lsp.default_capabilities(capabilities)
            end

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local map = function(keys, func, desc)
                        vim.keymap.set("n", keys, func, { buffer = args.buf, desc = desc })
                    end
                    map("gd", vim.lsp.buf.definition, "go to definition")
                    map("gD", vim.lsp.buf.declaration, "go to declaration")
                    map("gr", vim.lsp.buf.references, "go to references")
                    map("gi", vim.lsp.buf.implementation, "go to implementation")
                    map("K", vim.lsp.buf.hover, "hover docs")
                    map("<leader>ca", vim.lsp.buf.code_action, "code action")
                    map("<leader>rn", vim.lsp.buf.rename, "rename symbol")
                    map("<leader>D", vim.lsp.buf.type_definition, "type definition")
                    map("[d", vim.diagnostic.goto_prev, "prev diagnostic")
                    map("]d", vim.diagnostic.goto_next, "next diagnostic")
                    map("<leader>d", vim.diagnostic.open_float, "show diagnostic")
                end,
            })

            vim.lsp.config("lua_ls", {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                        workspace = { checkThirdParty = false },
                    },
                },
            })

            vim.lsp.config("clangd", {
                capabilities = capabilities,
                cmd = { "clangd" },
            })

            vim.lsp.config("pyright", { capabilities = capabilities })

            vim.lsp.config("rust_analyzer", {
                capabilities = capabilities,
                settings = {
                    ["rust-analyzer"] = {
                        check = { command = "clippy" },
                    },
                },
            })

            -- only start servers that are actually installed
            local bins = {
                lua_ls = { "lua-language-server" },
                clangd = { "clangd" },
                pyright = { "pyright-langserver" },
                rust_analyzer = { "rust-analyzer" },
            }

            local enabled = {}
            local mason_bin = vim.fn.stdpath("data") .. "/mason/bin/"
            for server, names in pairs(bins) do
                for _, name in ipairs(names) do
                    if vim.fn.executable(name) == 1 or vim.fn.executable(mason_bin .. name) == 1 then
                        table.insert(enabled, server)
                        break
                    end
                end
            end

            if #enabled > 0 then
                vim.lsp.enable(enabled)
            end
        end,
    },
}

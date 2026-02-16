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
                ensure_installed = {
                    "lua_ls",
                },
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
            -- Enhance capabilities with cmp if available
            local capabilities = vim.lsp.protocol.make_client_capabilities()
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

            -- lua_ls (installed via mason)
            vim.lsp.config("lua_ls", {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                        workspace = { checkThirdParty = false },
                    },
                },
            })

            -- clangd (system-installed via pacman clang package)
            vim.lsp.config("clangd", {
                capabilities = capabilities,
                cmd = { "clangd" },
            })

            -- pyright (requires npm — install via: sudo pacman -S npm, then :MasonInstall pyright)
            vim.lsp.config("pyright", { capabilities = capabilities })

            -- Only enable servers whose binaries are available
            local servers = { "lua_ls", "clangd", "pyright" }
            local enabled = {}
            for _, server in ipairs(servers) do
                if vim.fn.executable(server == "pyright" and "pyright-langserver" or server) == 1
                    or vim.fn.executable(vim.fn.stdpath("data") .. "/mason/bin/" .. server) == 1
                then
                    table.insert(enabled, server)
                end
            end

            if #enabled > 0 then
                vim.lsp.enable(enabled)
            end
        end,
    },
}

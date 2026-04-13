-- lsp config
return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                PATH = "prepend",
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "ts_ls",        --typescript
                    "eslint",
                    "basedpyright", --python
                    "tailwindcss",
                    "yamlls",
                    "jsonls",
                    "marksman",
                    "gopls",
                    "html",
                    "cssls",
                    "emmet_language_server",
                    "bashls"
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")
            local util = require("lspconfig.util")

            -- Define an `on_attach` function to set LSP-related keymaps
            local on_attach = function(client, bufnr)
                local bufopts = { noremap = true, silent = true, buffer = bufnr }
                -- Go to definition
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
                -- Go to declaration
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
                -- Open diagnostics
                vim.keymap.set("n", "gl", vim.diagnostic.open_float, bufopts)
            end

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        runtime = {
                            -- LuaJIT in the case of Neovim
                            version = "LuaJIT",
                            path = vim.split(package.path, ";"),
                        },
                        diagnostics = {
                            -- Get the language server to recognize the `vim` global
                            globals = { "vim" },
                        },
                        workspace = {
                            -- Make the server aware of Neovim runtime files
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            })

            lspconfig.ts_ls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
                root_dir = util.root_pattern("package.json", "tsconfig.json", ".git"),
                filetypes = {
                    "javascript",
                    "javascriptreact",
                    "typescript",
                    "typescriptreact",
                },
            })

            lspconfig.eslint.setup({
                capabilities = capabilities,
                root_dir = util.root_pattern(
                    ".eslintrc",
                    ".eslintrc.js",
                    ".eslintrc.cjs",
                    ".eslintrc.json",
                    "eslint.config.js",
                    "eslint.config.mjs",
                    "package.json",
                    ".git"
                ),
                settings = {
                    packageManager = "pnpm",
                    workingDirectory = { mode = "auto" }, --pick nearest package root
                    nodePath = vim.fn.getcwd() .. "/node_modules",
                    format = true,
                },
            })

            lspconfig.basedpyright.setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    basedpyright = {
                        analysis = {
                            typeCheckingMode = "basic", -- or "standard", "strict"
                            autoImportCompletions = true,
                            autoSearchPaths = true,
                            useLibraryCodeForTypes = true,
                            diagnosticMode = "workspace",
                        }
                    }
                }
            })

            lspconfig.tailwindcss.setup({
                capabilities = capabilities,
                filetypes = {
                    "templ",
                    "html",
                    "css",
                    "javascriptreact",
                    "typescriptreact",
                    "javascript",
                    "typescript",
                    "jsx",
                    "tsx",
                },
                root_dir = require("lspconfig").util.root_pattern(
                    "tailwind.config.js",
                    "tailwind.config.cjs",
                    "tailwind.config.mjs",
                    "tailwind.config.ts",
                    "postcss.config.js",
                    "postcss.config.cjs",
                    "postcss.config.mjs",
                    "postcss.config.ts",
                    "package.json",
                    "node_modules",
                    ".git"
                ),
            })

            lspconfig.yamlls.setup({
                capabilities = capabilities,
            })

            lspconfig.jsonls.setup({
                capabilities = capabilities,
            })

            lspconfig.marksman.setup({
                capabilities = capabilities,
            })

            lspconfig.gopls.setup({
                capabilities = capabilities,
            })

            lspconfig.html.setup({
                capabilities = capabilities,
                filetypes = {
                    "templ",
                    "html",
                    "css",
                    "javascriptreact",
                    "typescriptreact",
                    "javascript",
                    "typescript",
                    "jsx",
                    "tsx",
                },
            })

            lspconfig.cssls.setup({
                capabilities = capabilities,
            })

            lspconfig.emmet_language_server.setup({
                capabilities = capabilities,
                filetypes = {
                    "templ",
                    "html",
                    "css",
                    "javascriptreact",
                    "typescriptreact",
                    "javascript",
                    "typescript",
                    "jsx",
                    "tsx",
                    "markdown",
                },
            })

            lspconfig.bashls.setup({
                capabilities = capabilities,
            })
        end,
    },
}

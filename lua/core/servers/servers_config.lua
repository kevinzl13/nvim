local util = require("lspconfig.util")
local M = require("config.keymaps")

local on_attach = function(client, bufnr)
    -- Llamar a la función de keymaps personalizada
    M.lsp_keymaps(bufnr)
end

local servers = {
    lua_ls = {
        settings = {
            Lua = {
                telemetry = { enable = false },
                workspace = { checkThirdParty = false },
            },
        },
        filetypes = { "lua" },
        single_file_support = true,
        root_dir = function(fname)
            return util.root_pattern(
                ".luarc.json",
                ".luarc.jsonc",
                ".luacheckrc",
                ".stylua.toml",
                "stylua.toml",
                "selene.toml",
                "selene.yml",
                ".git"
            )(fname) or util.path.dirname(fname)
        end,
        on_attach = on_attach,
    },
    pyright = {
        settings = {
            python = {
                analysis = {
                    autoSearchPaths = true,
                    diagnosticMode = "openFilesOnly",
                    useLibraryCodeForTypes = true,
                },
            },
        },
        filetypes = { "python" },
        single_file_support = true,
        root_dir = function(fname)
            return util.root_pattern("requirements.txt", "pyproject.toml", "setup.py", ".git")(fname)
                or util.path.dirname(fname)
        end,
        on_attach = on_attach,
    },
    gopls = {
        settings = {
            gopls = {
                analyses = {
                    unusedparams = true,
                    unreachable = true,
                },
                staticcheck = true,
            },
        },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_dir = function(fname)
            return util.root_pattern("go.work", "go.mod", ".git")(fname) or util.path.dirname(fname)
        end,
        on_attach = on_attach,
    },
    clangd = {
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
        root_dir = function(fname)
            return util.root_pattern(
                ".clangd",
                ".clang-tidy",
                ".clang-format",
                "compile_commands.json",
                "compile_flags.txt",
                "configure.ac",
                ".git"
            )(fname) or util.path.dirname(fname)
        end,
        single_file_support = true,
        on_attach = on_attach,
    },
    ts_ls = {
        filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
        single_file_support = true,
        root_dir = function(fname)
            return util.root_pattern("tsconfig.json", "jsconfig.json", "package.json", ".git")(fname)
                or util.path.dirname(fname)
        end,
        on_attach = on_attach,
    },
    rust_analyzer = {
        settings = {
            ["rust-analyzer"] = {
                cargo = {
                    allFeatures = true,
                },
            },
        },
        filetypes = { "rust" },
        root_dir = function(fname)
            return util.root_pattern("Cargo.toml", "rust-project.json", ".git")(fname) or util.path.dirname(fname)
        end,
        single_file_support = true,
        on_attach = on_attach,
    },
}

return servers

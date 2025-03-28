local M = {}

local opts = { noremap = true, silent = true }

-- Set map leader
vim.g.mapleader = " "

M.general = {
    -- nvimtree
    {
        mode = "n",
        key = "<C-b>",
        action = ":NvimTreeToggle<CR>",
        opts = opts,
        desc = "Toggle file explorer",
    },

    -- buffers
    { mode = "n", key = "<Tab>", action = ":bnext<CR>", opts = opts },
    { mode = "n", key = "<S-Tab>", action = ":bprevious<CR>", opts = opts },
    { mode = "n", key = "<A-w>", action = ":Bdelete<CR>", opts = opts },

    -- Source
    { mode = "n", key = "<F12>", action = ":source %<CR>", opts = opts },

    -- copy - search
    { mode = "v", key = "y", action = '"+y', opts = opts },
    { mode = "n", key = "//", action = ":nohlsearch<esc>", opts = opts },

    -- insert mode
    { mode = "i", key = "<C-h>", action = "<Left>", opts = opts },
    { mode = "i", key = "<C-s>", action = "<Cmd>w<CR>", opts = opts },
    { mode = "i", key = "<C-j>", action = "<Down>", opts = opts },
    { mode = "i", key = "<C-k>", action = "<Up>", opts = opts },
    { mode = "i", key = "<C-l>", action = "<Right>", opts = opts },
    { mode = "i", key = "<C-q>", action = "<Esc>", opts = opts },

    -- Normal mode
    { mode = "n", key = "<C-q>", action = ":q<Esc>", opts = opts },
    { mode = "n", key = "<C-s>", action = ":w<CR>", opts = opts },

    -- Windows - splits
    { mode = "n", key = "<A-h>", action = "<C-w>h", opts = opts },
    { mode = "n", key = "<A-j>", action = "<C-w>j", opts = opts },
    { mode = "n", key = "<A-k>", action = "<C-w>k", opts = opts },
    { mode = "n", key = "<A-l>", action = "<C-w>l", opts = opts },

    -- Indentation
    { mode = "x", key = "K", action = ":move '<-2<CR>gv-gv", opts = opts },
    { mode = "x", key = "J", action = ":move '>+1<CR>gv-gv", opts = opts },
    { mode = "v", key = "<", action = "<gv", opts = opts },
    { mode = "v", key = ">", action = ">gv", opts = opts },
    { mode = "v", key = "<CR>", action = ":<C-u>normal! gv<CR><Esc>", opts = opts },

    -- Term
    { mode = "n", key = "<leader>tt", action = ":ToggleTerm direction=horizontal<CR>", opts = opts },
    { mode = "n", key = "<leader>tf", action = ":ToggleTerm direction=float<CR>", opts = opts },
    { mode = "n", key = "<leader>tv", action = ":ToggleTerm direction=vertical<CR>", opts = opts },

    { mode = "t", key = "<Esc>", action = [[<C-\><C-n>]], opts = opts },
    { mode = "t", key = "<C-q>", action = [[<C-\><C-n>]], opts = opts },
}

-- Telescope keymaps
M.telescope_keymaps = {
    normal = {
        { mode = "n", key = "<leader>ff", action = "find_files", opts = opts, desc = "Telescope find files" },
        { mode = "n", key = "<leader>fg", action = "live_grep", opts = opts, desc = "Telescope live grep" },
        { mode = "n", key = "<leader>fb", action = "buffers", opts = opts, desc = "Telescope buffers" },
        { mode = "n", key = "<leader>fh", action = "help_tags", opts = opts, desc = "Telescope help tags" },
    },
    insert_key = function(actions)
        return {
            ["<C-k>"] = actions.move_selection_next, -- Mover a la siguiente opción
            ["<C-j>"] = actions.move_selection_previous, -- Mover a la opción anterior
            ["<C-q>"] = actions.close, -- Cerrar Telescope
        }
    end,
}

-- Tree-sitter textobjects
M.treesitter_keymaps = {
    select = {
        enable = true,
        lookahead = true,
        keymaps = {
            ["af"] = "@function.outer", -- Seleccionar función completa
            ["if"] = "@function.inner", -- Seleccionar cuerpo de la función
            ["ac"] = "@class.outer", -- Seleccionar clase completa
            ["ic"] = "@class.inner", -- Seleccionar cuerpo de la clase
            ["ca"] = "@conditional.outer", -- Seleccionar condicional completa
            ["ci"] = "@conditional.inner", -- Seleccionar cuerpo del condicional
            ["al"] = "@loop.outer", -- Seleccionar loop completo
            ["il"] = "@loop.inner", -- Seleccionar cuerpo del loop
        },
    },
}

-- Lsp keymaps
M.lsp_keymaps = function(bufnr)
    -- Muestra información sobre símbolo debajo del cursor
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    -- Saltar a declaración
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    -- Saltar a definición
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    -- Mostrar implementaciones
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    -- Mostrar argumentos de función
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

    vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    -- Saltar a definición de tipo
    vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
    -- Renombrar símbolo
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    -- Listar "code actions" disponibles en la posición del cursor
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
    -- Listar referencias
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    -- formatear documento
    vim.keymap.set({ "n", "i" }, "<A-S-f>", function()
        vim.lsp.buf.format({ async = true })
    end, opts)

    -- Navegación dentro de snippets de luasnip
    vim.keymap.set({ "i", "s" }, "<C-A-k>", function()
        local luasnip = require("luasnip")
        if luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
        end
    end, opts)

    vim.keymap.set({ "i", "s" }, "<C-A-j>", function()
        local luasnip = require("luasnip")
        if luasnip.jumpable(-1) then
            luasnip.jump(-1)
        end
    end, opts)

    -- Toggle de inlay hints (NUEVO)
    vim.keymap.set("n", "<A-k>", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }))
    end, { buffer = bufnr, desc = "Toggle inlay hints" })
end

-- Comentarios
M.comment = {
    toggler = {
        line = "gcc", -- Line-comment toggle keymap
        block = "gbc", -- Block-comment toggle keymap
    },
    opleader = {
        line = "gc", -- Operator-pending mode keymap
        block = "gb", -- Operator-pending mode block keymap
    },
    extra = {
        above = "gcO", -- Add comment on the line above
        below = "gco", -- Add comment on the line below
        eol = "gcA", -- Add comment at the end of line
    },
}

-- Cmp keymaps
function M.cmp(cmp)
    return {
        ["<TAB>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif require("luasnip").choice_active() then
                require("luasnip").change_choice(1)
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-TAB>"] = cmp.mapping.select_prev_item(),
        ["<CR>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                if cmp.get_selected_entry() then
                    cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = false })
                else
                    fallback()
                end
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<C-a>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.abort() -- Si el menú está visible, lo cierra
            else
                cmp.complete() -- Si no está visible, lo abre
            end
        end, { "i", "s" }),
        ["<C-j>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item({ count = 4, behavior = cmp.SelectBehavior.Select })
            else
                fallback() -- Movimiento hacia abajo si no está visible
            end
        end, { "i", "s" }),
        ["<C-k>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item({ count = 4, behavior = cmp.SelectBehavior.Select })
            else
                fallback() -- Movimiento hacia arriba si no está visible
            end
        end),

        ["<C-t>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.scroll_docs(-4) -- Scrolling hacia arriba
            else
                fallback() -- Si no está visible, ejecuta el fallback
            end
        end, { "i", "s" }),
        ["<C-g>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.scroll_docs(4) -- Scrolling hacia abajo
            else
                fallback() -- Si no está visible, ejecuta el fallback
            end
        end, { "i", "s" }),
    }
end

return M

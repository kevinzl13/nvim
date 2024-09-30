---@diagnostic disable: missing-fields
local cmp = require('cmp')
local luasnip = require('luasnip')
local cmp_autopairs = require("nvim-autopairs.completion.cmp")


local M = {}

function M.setup()
    cmp.setup({
        window = {
            completion = {
                border = "rounded",
            },
            documentation = {
                border = "rounded",
            },
        },
        formatting = {
            format = function(entry, vim_item)
                local KIND_ICONS = {
                    Tailwind = '󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞',
                    Color = ' ',
                    Snippet = " ",
                }
                if vim_item.kind == 'Color' and entry.completion_item.documentation then
                    local _, _, r, g, b = string.find(entry.completion_item.documentation, '^rgb%((%d+), (%d+), (%d+)')
                    local color

                    -- The next conditional is for the new tailwindcss version.
                    if r and g and b then
                        color = string.format('%02x', r) .. string.format('%02x', g) .. string.format('%02x', b)
                    else
                        color = entry.completion_item.documentation:gsub('#', '')
                    end
                    local group = 'Tw_' .. color

                    if vim.api.nvim_call_function('hlID', { group }) < 1 then
                        vim.api.nvim_command('highlight' .. ' ' .. group .. ' ' .. 'guifg=#' .. color)
                    end

                    local highlight_format = require("nvim-highlight-colors").format
                    vim_item = highlight_format(entry, vim_item)

                    vim_item.kind = KIND_ICONS.Tailwind
                    vim_item.kind_hl_group = group

                    return vim_item
                end

                vim_item.kind = KIND_ICONS[vim_item.kind] or vim_item.kind

                return vim_item
            end,
        },
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },

        mapping = {
            -- ["<C-e>"] = cmp.mapping.abort(),
            ["<TAB>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.choice_active() then
                    luasnip.change_choice(1)
                else
                    fallback()
                end
            end, { "i", "s" }),
            ["<S-TAB>"] = cmp.mapping.select_prev_item(),
            ["<CR>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    if cmp.get_selected_entry() then
                        cmp.confirm { behavior = cmp.ConfirmBehavior.Insert, select = false }
                    else
                        fallback()
                    end
                else
                    fallback()
                end
            end, { "i", "s" }),
            ["<C-a>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.abort()    -- Si el menú está visible, lo cierra
                else
                    cmp.complete() -- Si no está visible, lo abre
                end
            end, { "i", "s" }),
            ["<C-j>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item({  count = 4, behavior = cmp.SelectBehavior.Select })
                else
                    fallback() -- Movimiento hacia abajo si no está visible
                end
            end, { "i", "s" }),

            -- Mapear <C-k> para hacer scroll en autocompletado y moverse hacia arriba cuando no esté visible
            ["<C-k>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item({ count = 4, behavior = cmp.SelectBehavior.Select })
                else
                    fallback() -- Movimiento hacia arriba si no está visible
                end
            end, { "i", "s" }),
        },
        sources = {
            { name = "nvim_lsp" },
            { name = "path" },
            { name = "luasnip" },
            { name = "buffer" },
        },
    })

    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })

    -- Set configuration for specific filetype.
    cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
            { name = 'git' }, -- You can specify the `git` source if you have installed it.
        }, {
            { name = 'buffer' },
        })
    })

    -- Use buffer source for `/` and `?`.
    cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = 'buffer' }
        }
    })

    -- Use cmdline & path source for ':'.
    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = 'path' }
        }, {
            { name = 'cmdline' }
        })
    })
end

return M

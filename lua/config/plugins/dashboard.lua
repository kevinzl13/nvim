local dashboard = require('dashboard')

--[[
         -- Dashboard header
     header = {},
     -- Format to display date in
     date_format = nil,
     -- List of directory paths
     directories = {},
     -- Sections to add at bottom, these can be string references to
     -- functions in sections.lua, custom strings, or custom functions
     footer = {},
     -- Gets called after directory is changed and is provided with the
     -- directory string as an argument
     on_load = function(dir)
         -- Do nothing
     end,
     -- Highlight groups to use for various components
     highlight_groups = {
         header = 'Constant',
         icon = 'Type',
         directory = 'Delimiter',
         hotkey = 'Statement',
     },
]]


dashboard.setup {
    header = require('ascii').get_random_global("Gaming"),
    date_format = '%Y-%m-%d %H:%M:%S',
    directories = {
        '~/AppData/Local/nvim',
        '~/Desktop/',
        '~/Desktop/code',
    },

    on_load = function(dir)
        -- Do nothing
    end,
    highlight_groups = {
        header = 'Constant',
        icon = 'Type',
        directory = 'Delimiter',
        hotkey = 'Statement',
    },
}
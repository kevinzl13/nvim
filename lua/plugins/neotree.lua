return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    lazy = false, 
    opts = {
        filesystem = {
            bind_to_cwd = true,
            follow_current_file = {
                enabled = false,
                leave_dirs_open = false,
            },
            use_libuv_file_watcher = true,

            filtered_items = {
                visible = true,   -- mostrar dotfiles
                show_hidden_count = true,
                hide_dotfiles = false,
                hide_gitignored = false,
            },
        },
        icon = {
            folder_closed = "▶",
            folder_open = "▼",
            folder_empty = "",
            default = "",
        },
        renderers = {
            directory = {
                { "indent" },
                { "icon" },
                { "current_filter" },
                { "name" },
            },
            file = {
                { "indent" },
                { "icon" },
                { "name" },
            },
        }
    }

}

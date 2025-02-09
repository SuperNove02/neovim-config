return {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        require("bufferline").setup {
            options = {
                numbers = "ordinal",  -- Show buffer numbers
                close_command = "bdelete! %d",  -- Close buffer command
                right_mouse_command = "bdelete! %d", 
                left_mouse_command = "buffer %d", 
                middle_mouse_command = nil, 
                diagnostics = "nvim_lsp",  -- Show LSP diagnostics in bufferline
                separator_style = "slant", -- Other options: "thin", "thick"
                offsets = {
                    {
                        filetype = "NvimTree", 
                        text = "File Explorer", 
                        highlight = "Directory",
                        separator = true
                    }
                },
                show_buffer_close_icons = true,
                show_close_icon = false,
                always_show_bufferline = true,
            }
        }

        -- Keybindings for buffer navigation
        vim.api.nvim_set_keymap('n', '<Tab>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<Leader>1', ':BufferLineGoToBuffer 1<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<Leader>2', ':BufferLineGoToBuffer 2<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<Leader>3', ':BufferLineGoToBuffer 3<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<Leader>4', ':BufferLineGoToBuffer 4<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<Leader>5', ':BufferLineGoToBuffer 5<CR>', { noremap = true, silent = true })
    end
}


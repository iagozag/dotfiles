vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
    auto_reload_on_write = true,
    git = {
        enable = true,
        ignore = false,
        timeout = 500,
    },
    view = {
        side = 'left',
        number = false,
        cursorline = true,
        relativenumber = false,
        signcolumn = 'no',
    },
    renderer = {
        highlight_opened_files = "all",
    }
})

vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')
vim.keymap.set('n', '<c-m>', ':NvimTreeFocus<CR>')

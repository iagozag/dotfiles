vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.vimtex_view_method = 'zathura'

vim.g.transparent_groups = vim.list_extend(vim.g.transparent_groups or {}, { "ExtraGroup" })

vim.g.lushwal_configuration = {
    addons = {
        bufferline_nvim = true,
        indent_blankline_nvim = true,
        gitsigns_nvim = true,
        lualine = true,
        nvim_cmp = true,
        nvim_tree_lua = true,
        telescope_nvim = true,
        treesitter = true,
    }
}

vim.opt.backspace = '2'
vim.opt.showcmd = true

vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

--use spaces for tabs and whatnot
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = true

--Line numbers
vim.wo.relativenumber = true
vim.wo.number = true

vim.opt.swapfile = false

vim.keymap.set('n', '<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>')

vim.keymap.set('i', '<c-z>', '<Esc>:undo<CR>i')
vim.keymap.set('n', '<s-k>', ':pyf /usr/share/clang/clang-format.py<CR>')
vim.keymap.set('n', '<leader>ac', ':%y+<CR>')
vim.keymap.set('n', '<leader>dc', ':%d<CR>')
vim.keymap.set('n', '<TAB>', '%')
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.keymap.set('n', '<c-s>', ':write<CR>')
vim.keymap.set('n', 'q', ':quit<CR>')
vim.keymap.set('n', '<leader>q', ':quitall!<CR>')

-- bufferline
vim.keymap.set('n', '<A-1>', '<Cmd>BufferLineGoToBuffer 1<CR>')
vim.keymap.set('n', '<A-2>', '<Cmd>BufferLineGoToBuffer 2<CR>')
vim.keymap.set('n', '<A-3>', '<Cmd>BufferLineGoToBuffer 3<CR>')
vim.keymap.set('n', '<A-4>', '<Cmd>BufferLineGoToBuffer 4<CR>')
vim.keymap.set('n', '<A-5>', '<Cmd>BufferLineGoToBuffer 5<CR>')
vim.keymap.set('n', '<A-6>', '<Cmd>BufferLineGoToBuffer 6<CR>')
vim.keymap.set('n', '<A-7>', '<Cmd>BufferLineGoToBuffer 7<CR>')
vim.keymap.set('n', '<A-8>', '<Cmd>BufferLineGoToBuffer 8<CR>')
vim.keymap.set('n', '<A-9>', '<Cmd>BufferLineGoToBuffer 9<CR>')
vim.keymap.set('n', '<A-j>', '<Cmd>BufferLinePick<CR>')
-- Close buffer
vim.keymap.set('n', '<A-c>', '<Cmd>BufferLinePickClose<CR>')

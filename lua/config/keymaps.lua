local opts = {
    noremap = true, -- 不递归展开
    silent = true, -- 不展示信息
}
local map = vim.keymap.set

map('n', '<leader>l', '<cmd>Lazy<cr>', opts)
-- -- map('n', '<C-h>', '<C-w>h', opts)
-- -- map('n', '<C-j>', '<C-w>j', opts)
-- -- map('n', '<C-k>', '<C-w>k', optsbb
-- -- map('n', '<C-l>', '<C-w>l', opts)

-- Visual Mode
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)

-- BufferLine keymap

-- NvimTree keymap
map("n", "<leader>m", ":NvimTreeToggle<CR>", opts)

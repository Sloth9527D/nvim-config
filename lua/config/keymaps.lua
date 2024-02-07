local opts = {
    noremap = true, -- 不递归展开
    silent = true, -- 不展示信息
}
local map = vim.api.nvim_set_keymap

map('n', '<leader>l', '<cmd>Lazy<cr>', opts)
map('n', 'zq', '<cmd>q!<cr>', opts)
map('n', 'zx', '<cmd>x<cr>', opts)

map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)
map("v", "<A-j>", ":m '>+1<CR>gv-gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv-gv", opts)
map("i", "<A-h>", "<ESC>I", opt)
map("i", "<A-l>", "<ESC>A", opt)

-- window
map('n', '<A-h>', '<C-w>h', opts)
map('n', '<A-j>', '<C-w>j', opts)
map('n', '<A-k>', '<C-w>k', opts)
map('n', '<A-l>', '<C-w>l', opts)

-- pair complete
map('i', '(', '()<LEFT>', opts)
map('i', '[', '[]<LEFT>', opts)
map('i', '{', '{}<LEFT>', opts)
map('i', '<', '<><LEFT>', opts)
map('i', '"', '""<LEFT>', opts)
map('i', '\'', '\'\'<LEFT>', opts)
map('i', '<C-l>', '<ESC>/}\\|)\\|]\\|>\\|\\"<cr>a' , opts)

-- local function get_match_pair(char)
-- 	local brackets = {
-- 		['('] = ')',
-- 		['{'] = '}',
-- 		['['] = ']',
-- 		['<'] = '>',
-- 		['"'] = '"',
-- 		['\''] = '\''
-- 	}
-- 	for left, right in pairs(brackets) do
-- 		if char == left then
-- 			return right
-- 		end
-- 	end
-- 	return nil
-- end

-- function _G.jump_out_of_brackets()
--     local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--     local buf = vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]
--     local buf_len = buf:len()
--     for cur_col = buf_len,1,-1 do
--         prefix = buf:sub(cur_col, cur_col)
--         suffix = get_match_pair(prefix) 
--         if suffix then
--             vim.fn.search(suffix, 'W')
--             break
--         end
--     end     
-- end
-- vim.api.nvim_set_keymap('i', '<C-j>', [[v:lua.jump_out_of_brackets()]], { expr = true, noremap = true, silent = true })
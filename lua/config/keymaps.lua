local opts = {
    noremap = true, -- 不递归展开
    silent = true, -- 不展示信息
}
local map = vim.keymap.set

map('n', '<leader>l', '<cmd>Lazy<cr>', opts)
map('n', '<leader>q', '<cmd>q<cr>', opts)
map('n', '<leader>qq', '<cmd>q!<cr>', opts)
map('n', '<leader>qx', '<cmd>x<cr>', opts)
-- -- map('n', '<C-h>', '<C-w>h', opts)
-- -- map('n', '<C-j>', '<C-w>j', opts)
-- -- map('n', '<C-k>', '<C-w>k', optsbb
-- -- map('n', '<C-l>', '<C-w>l', opts)


map('i', '(', '()<LEFT>', opts)
map('i', '[', '[]<LEFT>', opts)
map('i', '{', '{}<LEFT>', opts)
map('i', '<', '<><LEFT>', opts)
map('i', '"', '""<LEFT>', opts)
map('i', '\'', '\'\'<LEFT>', opts)

-- Visual Mode
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)


-- local has_words_before = function()
--     local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--     return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
--   end
local function get_match_pair(char)
	local brackets = {
		['('] = ')',
		['{'] = '}',
		['['] = ']',
		['<'] = '>',
		['"'] = '"',
		['\''] = '\''
	}
	for left, right in pairs(brackets) do
		if char == left then
			return right
		end
	end
	return nil
end

function _G.jump_out_of_brackets()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    local buf = vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]
    local buf_len = buf:len()
    for cur_col = buf_len,1,-1 do
        prefix = buf:sub(cur_col, cur_col)
        suffix = get_match_pair(prefix) 
        if suffix then
            vim.fn.search(suffix, 'W')
            break
        end
    end     
end
-- 在插入模式下按下 <C-j> 时执行跳出括号的操作
-- vim.api.nvim_set_keymap('i', '<C-j>', [[v:lua.jump_out_of_brackets()]], { expr = true, noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', [[:lua vim.fn.search('}')<LEFT>]], { noremap = true, silent = true })

-- 跳出括号的 Lua 函数
-- function _G.jump_out_of_brackets()
--     local line = vim.fn.getline('.')
--     local col = vim.fn.col('.')
--     local char = line:sub(col, col)
--     print(line)
--     -- 定义括号对
--     local brackets = { ['('] = ')', ['{'] = '}', ['['] = ']', ['<'] = '>' }

--     -- 如果光标处在一个括号内，并且该括号有匹配的右括号
--     if brackets[char] and line:find(brackets[char], col) then
--         vim.fn.feedkeys(string.format("\\<Right>%d\\<Left>", #brackets[char]))
--     else
--         vim.fn.feedkeys("\\<Right>")
--     end
-- end

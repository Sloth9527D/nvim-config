local nordpath = vim.fn.stdpath("data") .. "/lazy/nord.nvim"
vim.opt_local.rtp:prepend(nordpath)

return {
    "akinsho/nvim-bufferline.lua",
    event = "VeryLazy",
    keys = {
        { "<leader>p", "<Cmd>BufferLinePick<CR>" },
        { "<leader>j", "<Cmd>BufferLineCyclePrev<CR>" },
        { "<leader>k", "<Cmd>BufferLineCycleNext<CR>" },
        { "<A-d><A-c>", "<Cmd>bdelete %<CR>"},
        { "<A-d><A-p>", "<Cmd>BufferLinePickClose<CR>"},
        { "<A-d><A-o>", "<Cmd>BufferLineCloseOthers<CR>"}
    },
    opts = {
        options = {
            diagnostics = "nvim_lsp",
            separator_style = "thin",
        },
        highlights = require("nord.plugins.bufferline").akinsho(),
    },
}
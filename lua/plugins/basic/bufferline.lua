local nordpath = vim.fn.stdpath("data") .. "/lazy/nord.nvim"
vim.opt_local.rtp:prepend(nordpath)

return {
    "akinsho/nvim-bufferline.lua",
    event = "VeryLazy",
    keys = {
        { "<leader>p", "<cmd>BufferLinePick<CR>" },
        { "<leader>j", "<cmd>BufferLineCyclePrev<CR>" },
        { "<leader>k", "<cmd>BufferLineCycleNext<CR>" },
        { "zz", "<cmd>bdelete! %<CR>"},
        { "zo", "<cmd>BufferLineCloseOthers<CR>"}
    },
    opts = {
        options = {
            diagnostics = "nvim_lsp",
            separator_style = "thin",
        },
        highlights = require("nord.plugins.bufferline").akinsho(),
    },
}
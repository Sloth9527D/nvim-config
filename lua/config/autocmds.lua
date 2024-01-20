local autocmd = vim.api.nvim_create_autocmd

autocmd(
    {"BufReadPre", "BufNewFile", "BufEnter"},
    {pattern = "*.lua",
    callback = function()
      vim.bo.expandtab = true
      vim.bo.tabstop = 2
      vim.bo.shiftwidth = 2
      vim.bo.softtabstop = 2
    end}
)

autocmd("BufWritePre",
    {
        pattern = "*",
        callback = function()
            vim.cmd([[:%s/\s\+$//e:%s/\n\+\%$//e]])
        end
    }
)
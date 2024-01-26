local handlers = {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function (server_name) -- default handler (optional)
      local options ={
        lua_ls = require("plugins.lsp.config.lua"),
        pyright = require("plugins.lsp.config.pyright"),
        clangd = require("plugins.lsp.config.clangd"),
      }
      local opts = options[server_name]
      require("lspconfig")[server_name].setup({opts})
  end,
}

return {
  {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufEnter" },
    patterns = {"*.[(lua)|(cpp)|(c)|(h)|(py)]"},
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig"
    },
    opts = {
      ensure_installed = {
        "lua_ls",
        "clangd",
        "pyright",
        "cmake",
        "rust_analyzer"
      },
      handlers = handlers
    }
  },
  {
    "neovim/nvim-lspconfig",
    keys = {
      { 'rn', '<cmd>lua vim.lsp.buf.rename()<CR>' },
      { 'ca', '<cmd>lua vim.lsp.buf.code_action()<CR>' },
      { 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>' },
      { 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>' },
      { 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>' },
      { 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>' },
      { 'gr', '<cmd>lua vim.lsp.buf.references()<CR>' },
      { 'go', '<cmd>lua vim.diagnostic.open_float()<CR>' },
      { 'gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>' }, 
      { 'gn', '<cmd>lua vim.diagnostic.goto_next()<CR>' },
      { '<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>'}
    }
  },
  { 
    "williamboman/mason.nvim",
    keys = {
      { '<leader>m', '<cmd>Mason<CR>' }
    },
    opts = {
      ui = {
        icons ={
          package_installed ="✓",
          package_pending ="➜",
          package_uninstalled ="✗",
        },
      }
    }
  },
  -- { -- C++ LSP
  --   "p00f/clangd_extensions.nvim",
  --   event = "VeryLazy",
  --   -- config = function()
  --   --   require("")
  --   -- end
  -- }, 
}
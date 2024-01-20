local handlers = {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function (server_name) -- default handler (optional)
      local options ={
        lua_ls = require("plugins.lsp.config.lua"),
        pyright = require("plugins.lsp.config.pyright"),
      }
      local opts = options[server_name]
      require("lspconfig")[server_name].setup({opts})
  end,
  -- Next, you can provide a dedicated handler for specific servers.
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
        "pyright"
      },
      handlers = handlers
    }
  },
  { "neovim/nvim-lspconfig"},
  { 
    "williamboman/mason.nvim",
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
  {-- C++ LSP
    "p00f/clangd_extensions.nvim",
    event = "VeryLazy",
    config = function()
      require("plugins.lsp.config.clangd")
    end
  }, 
}
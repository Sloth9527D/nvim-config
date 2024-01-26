function configure_cmp()
  local cmp = require('cmp')

  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  cmp.setup({
      snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
          vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
          -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
          end,
      },
      window = {
          -- completion = cmp.config.window.bordered(),
          -- documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<Tab>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif has_words_before() then
                cmp.complete()
              else
                fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
              end
            end, { "i", "s", "c" }),
      }),
      sources = cmp.config.sources({
          { name = "copilot"},
          { name = 'nvim_lsp' },
          { name = 'vsnip' }, -- For vsnip users.
          -- { name = 'luasnip' }, -- For luasnip users.
          -- { name = 'ultisnips' }, -- For ultisnips users.
          -- { name = 'snippy' }, -- For snippy users.
      }, {
          { name = 'buffer', keyword_length = 5 },
      })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
      sources = cmp.config.sources({
          { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
      }, {
          { name = 'buffer' },
      })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
          { name = 'buffer' }
      }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
          { name = 'path' }
      }, {
          { name = 'cmdline' }
      })
  })

  -- -- Set up lspconfig.
  -- local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  -- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
  --     capabilities = capabilities
  -- }
end

return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/nvim-cmp",
      "zbirenbaum/copilot-cmp",
    },
    event = "InsertEnter",
    config = configure_cmp
  },
  {"hrsh7th/cmp-nvim-lsp"},
  {"hrsh7th/cmp-buffer"},
  {"hrsh7th/cmp-path"},
  {"hrsh7th/cmp-cmdline"},
  {"hrsh7th/nvim-cmp"},
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "InsertEnter",
    keys = {},
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      -- panel = {
      --   enabled = true,
      --   auto_refresh = true,
      -- },
      -- suggestion = {
      --   enabled = true,
      --   auto_trigger = true,
      --   keymap = {
      --     accept = "<C-j>",
      --   },
      -- },
      -- filetypes = {
      --   markdown = true,
      --   gitcommit = true,
      --   help = true,
      --   c = true
      -- },
    },
  },
  {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    opts = {
      after = "copilot.lua"
    }
  },
}
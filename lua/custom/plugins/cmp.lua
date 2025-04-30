return {
  {
    'hrsh7th/nvim-cmp',
    lazy = false,
    -- event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
    config = function()
      local cmp = require 'cmp'
      cmp.setup {
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ['<Tab>'] = cmp.mapping.select_next_item(),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),
          ['<CR>'] = cmp.mapping.confirm { select = false },
          ['<C-CR>'] = cmp.mapping.confirm { select = true },
          ['<Up>'] = cmp.mapping.abort(),
          ['<Down>'] = cmp.mapping.abort(),
        },
        sources = cmp.config.sources {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'path' },
        },
      }
    end,
  },
}

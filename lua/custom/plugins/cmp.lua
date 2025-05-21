return {
  {

    'hrsh7th/nvim-cmp',
    lazy = false,
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
    config = function()
      -- local lspkind = require 'lspkind'
      local cmp = require 'cmp'
      cmp.setup {
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-l>'] = cmp.mapping.select_next_item(),
          ['<C-k>'] = cmp.mapping.select_prev_item(),
          ['<CR>'] = cmp.mapping.confirm { select = false },
          ['<C-CR>'] = cmp.mapping.confirm { select = true },
          ['<Up>'] = cmp.mapping.abort(),
          ['<Down>'] = cmp.mapping.abort(),
        },
        sources = cmp.config.sources {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
          { name = 'render-markdown' },
        },
        -- formatting = {
        -- format = lspkind.cmp_format {
        -- mode = 'symbol', -- show only symbol annotations
        --with_text = false,
        --maxwidth = 25,
        --ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
        --show_labelDetails = true, -- show labelDetails in menu. Disabled by default

        -- The function below will be called before any actual modifications from lspkind
        -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
        --before = function(entry, vim_item)
        -- ...
        --return vim_item
        --end,
        --},
        --},
      }
    end,
  },
}

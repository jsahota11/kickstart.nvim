return {
  { 
    'hrsh7th/nvim-cmp',
    lazy = false,
    event = 'InsertEnter',
	    dependencies = {
				{'hrsh7th/cmp-nvim-lsp',lazy = true, optional = true},
				{'hrsh7th/cmp-path', lazy = true, optional = true},
				{'hrsh7th/cmp-cmdline',lazy = true, optional = true},
				{'L3MON4D3/LuaSnip', lazy = true, optional = true},
				{'saadparwaiz1/cmp_luasnip', lazy = true, optional = true},
	      {
		'rafamadriz/friendly-snippets',
		config = function()
		  require('luasnip.loaders.from_vscode').lazy_load()
		end,
		lazy = true,
		optional = true,
	      },
	    },
	    config = function()
	      -- local lspkind = require 'lspkind'
	      local cmp = require 'cmp'

	      local luasnip = require 'luasnip'
	      luasnip.config.setup {
		-- Load snippets from ~/.config/nvim/LuaSnip/
		require('luasnip.loaders.from_lua').lazy_load { paths = { '~/.config/nvim/LuaSnip/' } },
	      }

	      cmp.setup {
			completion = {
					autocomplete = false
					},
		snippet = {
		  expand = function(args)
		    require('luasnip').lsp_expand(args.body)
		  end,
		},
		mapping = cmp.mapping.preset.insert {
		  -- Select the [n]ext item
		  ['<C-j>'] = cmp.mapping.select_next_item(),
		  -- Select the [p]revious item
		  ['<C-k>'] = cmp.mapping.select_prev_item(),

		  -- Scroll the documentation window [b]ack / [f]orward
		  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
		  ['<C-f>'] = cmp.mapping.scroll_docs(4),

		  -- Accept ([y]es) the completion.
		  --  This will auto-import if your LSP supports it.
		  --  This will expand snippets if the LSP sent a snippet.
		  ['<CR>'] = cmp.mapping.confirm { select = true },

          ['<C-l>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { 'i', 's' }),
          ['<C-h>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { 'i', 's' }),
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

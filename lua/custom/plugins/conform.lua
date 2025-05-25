return {
  {
    'stevearc/conform.nvim',
    opts = {},
    config = function ()
      require("conform").setup({
	formatters_by_ft = {
	  lua = { "stylua" },
	  -- Conform will run multiple formatters sequentially
	  python = { "black" },
	  -- You can customize some of the format options for the filetype (:help conform.format)
	  -- Conform will run the first available formatter
	  javascript = { "prettier" },
	  latex = {'latexindent'},
	  bash = {'shfmt'},
	  markdown = {'markdownlint'},
	  c = {'clangd'}

	},
      })
    end
  }
}

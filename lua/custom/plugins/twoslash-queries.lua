return {
  {
    'marilari88/twoslash-queries.nvim',
    ft = { 'typescript', 'javascript' },
    config = function()
      require('twoslash-queries').setup()
    end,
    enabled = false,
  },
}

return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },

config = function()
      require('lualine').setup {
  options = {
    theme = 'auto',
    icons_enabled = true,  
    component_separators = ' ',
    section_separators = {left = '「', right = '」'},
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = { 'branch' },
    lualine_c = {
      '%=', 'fileformat'
    },
    lualine_x = {},
    lualine_y = { 'filename'},
    lualine_z = {'filetype'},
  },
  tabline = {},
  extensions = {},
} end
}
}



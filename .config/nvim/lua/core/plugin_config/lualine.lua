require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'lushwal',
  },
  sections = {
    lualine_a = {
      {
      	'filename',
	      path = 1,
      }
    }
  }
}

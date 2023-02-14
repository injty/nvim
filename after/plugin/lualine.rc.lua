local status, l = pcall(require, 'lualine')
if (not status) then return end

l.setup({
  options = {
    icons_enabled = true,
    theme = 'solarized',
    component_separators = { left = '|', right = '|'},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch' },
    lualine_c = { {
      'filename',
      file_status = true,
      path = 0
    } },
    lualine_x = {
      { 'diagnostics', sources = { 'nvim_diagnostic' }, symbols = { error = 'E', warn = 'W', info = 'I', hint = 'H' } },
      'encoding',
      'filetype'
    },
    lualine_y = {},
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { {
      'filename',
      file_status = true,
      path = 1
    } },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = { 'fugitive' }
})

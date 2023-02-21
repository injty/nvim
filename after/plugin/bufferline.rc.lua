local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup {
  options = {
    mode = "tabs",
    separator_style = 'slant',
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_tab_indicators = false,
    modified_icon = '📌',
    left_trunc_marker = "",
    right_trunc_marker = "",
    close_command = "ZZ",
    color_icons = true,
  },
  highlights = {
    separator = {
      fg = '#001b26',
      bg = '#001b26',
    },
    separator_selected = {
      fg = '#001b26',
      bg = '#001b26'
    },
    separator_visible = {
      fg = '#001b26',
      bg = '#001b26'
    },
    background = {
      fg = '#657b83',
      bg = '#001b26'
    },
    buffer_selected = {
      fg = '#ffffff',
      bg = '#001b26',
      italic = false,
    },
    fill = {
      bg = '#001b26',
      fg = '#001b26'
    },
    modified = {
      fg = '#c9c9c9',
      bg = '#001b26',
    },
    modified_visible = {
      fg = '#c9c9c9',
      bg = '#001b26',
    },
    modified_selected = {
      fg = '#c9c9c9',
      bg = '#001b26',
    },
    duplicate = {
      fg = '#657b83',
      bg = '#001b26',
      italic = false
    },
    duplicate_selected = {
      fg = '#657b83',
      bg = '#001b26',
      italic = false,
    },
    duplicate_visible = {
      fg = '#657b83',
      bg = '#001b26',
      italic = false
    },
  },
}

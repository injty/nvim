local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup {
  options = {
    mode = "tabs",
    -- separator_style = "thin",
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    left_trunc_marker = "",
    right_trunc_marker = "",
    close_command = "ZZ",
    color_icons = true,
  },
  highlights = {
    separator = {
      fg = "#073642",
      bg = "#32ae85",
    },
    buffer_selected = {
      italic = false,
      fg = "#073642",
      bg = "#32ae85",
    }
  }
}

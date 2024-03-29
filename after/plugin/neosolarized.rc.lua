local status, n = pcall(require, 'neosolarized')
if (not status) then return end

n.setup({
  comment_italics = false,
  background_set = true,
})

local cb = require('colorbuddy.init')
local Color = cb.Color
local colors = cb.colors
local Group = cb.Group
local styles = cb.styles

Color.new('white', '#ffffff')
Color.new('black', '#000000')
Color.new('darkblue', '#001b26')
Group.new('Normal', colors.base1, colors.NONE, styles.NONE)
Group.new('CursorLine', colors.none, colors.darkblue, styles.NONE, colors.base1)
Group.new('CursorLineNr', colors.yellow, colors.darkblue, styles.NONE, colors.base1)
Group.new('Visual', colors.none, colors.base03, styles.reverse)

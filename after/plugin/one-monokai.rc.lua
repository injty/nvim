local status, theme = pcall(require, "one_monokai")
if (not status) then return end

theme.setup({})
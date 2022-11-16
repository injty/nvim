local status, n = pcall(require, 'neosolarized')
if (not status) then return end

n.setup({})

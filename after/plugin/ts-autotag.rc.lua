local status, autotag = pcall(requare, 'nvim-ts-autotag')
if (not status) then return end

autotag.setup({})

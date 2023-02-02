local status, zenburn = pcall(require, 'zenburn')
if (not status) then return end

zenburn.setup()

local saga_status, saga = pcall(require, 'lspsaga')
if (not saga_status) then return end

saga.setup({
  move_in_saga = {
    prev = '<C-k>',
    next = '<C-j>'
  },
  finder_action_keys = {
    onen = '<CR>',
  },
  definition_action_keys = {
    edit = '<CR>',
  },
})

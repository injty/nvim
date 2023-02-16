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
  symbol_in_winbar = {
    -- hidden breadcrumbs.
    enable = false,
  },
  code_action = {
    num_shortcut = true,
    show_server_name = false,
    keys = {
      quit = "q", exec = "<CR>", },
  },
  lightbulb = {
    -- remove lightbulb icon
    enable = false,
  }
})

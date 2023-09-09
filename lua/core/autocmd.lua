-- Open help in a new buffer instead of a vsplit
vim.api.nvim_create_autocmd('BufWinEnter', {
  pattern = '*',
  callback = function(event)
    if vim.bo[event.buf].filetype == 'help' then
      vim.cmd.only()
      vim.bo.buflisted = true
    end
  end,
})

-- Hide lualine when in command mode
vim.api.nvim_create_autocmd('CmdlineEnter', {
  pattern = '*',
  callback = function()
    require('lualine').hide({})
  end,
})

-- Show lualine when command mode is exit
vim.api.nvim_create_autocmd('CmdlineLeave', {
  pattern = '*',
  callback = function()
    require('lualine').hide({ unhide = true })
  end,
})

vim.api.nvim_create_autocmd({'BufEnter', 'BufRead', 'BufNewFile'}, {
  pattern = {'*_repl','*_pref','*bpred'},
  callback = function()
    vim.o.filetype = 'cpp'
  end,
})
-- vim.api.nvim_create_autocmd('BufEnter', {
--   pattern = '*_repl',
--   callback = function()
--     vim.o.filetype = 'cpp'
--   end,
-- })

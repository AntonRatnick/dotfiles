function Map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

Map('i', '<C-c>', '<Esc>')
Map('n', '<C-s>', ':wa<cr>')
Map('i', '<C-s>', '<cmd>wa<cr>')

Map('n', '<C-k>', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
Map('n', '<C-j>', '<cmd>lua vim.diagnostic.goto_next()<CR>')
Map('n', '<C-w>d', ':bd<CR>')
Map('n', '<C-w>b', ':%bd|e#|bd#<CR>')

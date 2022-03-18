-- Colorscheme

-- Set color scheme if exists
vim.cmd([[
try
  let g:gruvbox_contrast_dark = 'hard'
  colorscheme gruvbox
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]])

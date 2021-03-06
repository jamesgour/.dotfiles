vim.cmd [[

  " Trigger automatic reload when files change on disk
    autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
  " Notification after file change
    autocmd FileChangedShellPost *
      \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

  " Show yank animation
    augroup highlight_yank
        autocmd!
        autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
    augroup END

  " augroup _general_settings
  "   autocmd!
  "   autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
  "   autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 
  "   autocmd BufWinEnter * :set formatoptions-=cro
  "   autocmd FileType qf set nobuflisted
  " augroup end
  " 
  " augroup _git
  "   autocmd!
  "   autocmd FileType gitcommit setlocal wrap
  "   autocmd FileType gitcommit setlocal spell
  " augroup end
  " 
  " augroup _markdown
  "   autocmd!
  "   autocmd FileType markdown setlocal wrap
  "   autocmd FileType markdown setlocal spell
  " augroup end
  "
  " augroup _auto_resize
  "   autocmd!
  "   autocmd VimResized * tabdo wincmd = 
  " augroup end
  "
  " augroup _alpha
  "   autocmd!
  "   autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  " augroup end
]]

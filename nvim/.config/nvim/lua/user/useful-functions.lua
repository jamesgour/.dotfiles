-- Commands can be called using :call FunctionName()
-- Alternatively you can set a command! to just run e.g. :TabMessage message
vim.cmd([[
  " Quickly change Neovim for better code editing experience
  function! CodeReview(active)
    if a:active == 1
      :colorscheme darkplus
      :set norelativenumber

    else
      :colorscheme gruvbox
      :set relativenumber
    endif
  endfunction

  " Send Neovim error message to a new buffer for easy viewing
  " Use ":TabMessage message"
  function! TabMessage(cmd)
    redir => message
    silent execute a:cmd
    redir END
    if empty(message)
      echoerr "no output"
    else
      tabnew
      setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted nomodified
      silent put=message
    endif
  endfunction

  command! -nargs=+ -complete=command TabMessage call TabMessage(<q-args>)
]])

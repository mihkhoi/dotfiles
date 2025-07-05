" vim:sw=2:
" ============================================================================
" FileName: floaterm.vim
" Author: voldikss <dyzplus@gmail.com>
" GitHub: https://github.com/voldikss
" ============================================================================

let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h:h:h')

function! s:check_common() abort
  echom 'Checking: common'
  echom 'Info: Platform: ' . s:get_platform_info()
  echom 'Info: Nvim: ' . s:get_nvim_info()
  echom 'Info: Plugin: ' . s:get_plugin_info()
endfunction

function! s:check_terminal() abort
  echom 'Checking: terminal'
  if exists(':terminal') > 0
    echom 'OK: Terminal emulator is available'
  else
    echom 'ERROR: Terminal emulator is missing'
    echom 'Hint: Install the latest version of Neovim'
  endif
endfunction

function! s:check_floating() abort
  echom 'Checking: floating'
  if exists('*nvim_win_set_config')
    echom 'OK: Floating window is available'
  else
    echom 'WARN: Floating window is missing, will fallback to normal window'
    echom 'Hint: Install the latest version of Neovim'
  endif
endfunction

function! health#floaterm#check() abort
  call s:check_common()
  call s:check_terminal()
  call s:check_floating()
endfunction

function! s:get_nvim_info() abort
  return split(execute('version'), "\n")[0]
endfunction

function! s:get_platform_info() abort
  if has('win32') || has('win64')
    return 'win'
  elseif has('mac') || has('macvim')
    return 'macos'
  endif
  return 'linux'
endfunction

function! s:get_plugin_info() abort
  let save_cwd = getcwd()
  silent! execute 'cd ' . s:home
  let result = system('git rev-parse --short HEAD')
  silent! execute 'cd ' . save_cwd
  return result
endfunction

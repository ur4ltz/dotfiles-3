augroup ale_load_aucommands
  au!
  au FileType sh,zsh,bash,c,cpp,cmake,html,markdown,racket,vim call s:load_ale()
augroup END

let s:ale_loaded = v:false
let g:ale_enabled = v:false

function! s:load_ale() abort
  let b:ale_enabled = v:true
  if s:ale_loaded
    finish
  endif

  let s:ale_loaded = v:true

  packadd ale
  nmap <silent> [e <Plug>(ale_previous_wrap)
  nmap <silent> ]e <Plug>(ale_next_wrap)

  let g:ale_sign_error = '🗙'
  let g:ale_sign_warning = '➤'
  let g:ale_lint_on_save = v:true
  let g:ale_lint_on_text_changed = 'never'
  let g:ale_lint_on_insert_leave = v:true
  let g:ale_lint_on_enter = v:true
  let g:ale_echo_msg_error_str = 'E'
  let g:ale_echo_msg_warning_str = 'W'
  let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
  let g:ale_linters = {
        \ 'haskell': ['hdevtools', 'hlint'],
        \ 'cpp': ['cppcheck', 'cpplint', 'flawfinder'],
        \ 'rust': ['rustfmt'],
        \ 'latex': ['lacheck', 'proselint', 'write-good', 'alex', 'vale'],
        \ 'tex': ['lacheck', 'proselint', 'write-good', 'alex', 'vale'],
        \ 'markdown': ['alex', 'markdownlint', 'proselint', 'write-good', 'vale']
        \}
        " \ 'cpp': ['clangtidy', 'cppcheck', 'cpplint', 'flawfinder'],
  let g:ale_warn_about_trailing_whitespace = 1
  let g:ale_set_highlights = v:true
  let g:ale_cpp_cpplint_options = '--linelength=100'
  let g:ale_cpp_clang_options = '-std=c++17 -Wall'
  let g:ale_linter_aliases = {'pandoc': ['markdown']}
  " let g:ale_cpp_clangtidy_checks = ['*', '-fuchsia-default-arguments']
  let g:ale_max_signs = -1
  let g:ale_set_signs = v:true
  let g:ale_set_balloons = v:true
  let g:ale_sign_column_always = v:true
  let g:ale_virtualtext_cursor = v:true
  let g:ale_textlint_use_global = v:true
  let g:ale_alex_executable = 'alexjs'
  let g:ale_alex_use_global = v:true
  autocmd! ale_load_aucommands
  augroup! ale_load_aucommands
  ALEEnableBuffer
augroup END
endfunction

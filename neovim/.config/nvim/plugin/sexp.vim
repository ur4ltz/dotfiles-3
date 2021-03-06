" Load vim-sexp and vim-sexp-mappings-for-regular-people
let g:sexp_enable_insert_mode_mappings = 0
let g:sexp_mappings = {'sexp_round_head_wrap_list': ''}
augroup sexp_loaders
  au!
  execute 'autocmd FileType ' . g:sexp_filetypes . '++once call s:load_sexps()'
augroup END

function! s:load_sexps() abort
  packadd vim-sexp
  packadd vim-sexp-mappings-for-regular-people
  doautoall sexp_filetypes Filetype
  doautoall sexp_mappings_for_regular_people Filetype
endfunction

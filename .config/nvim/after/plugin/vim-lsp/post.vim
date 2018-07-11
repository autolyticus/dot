if PlagCheck('vim-lsp')
    if executable('dart_language_server')
        " pip install python-language-server
        au User lsp_setup call lsp#register_server({
            \ 'name': 'dart_language_server',
            \ 'cmd': {server_info->['dart_language_server']},
            \ 'whitelist': ['dart'],
            \ })
    endif
    imap <c-space> <Plug>(asyncomplete_force_refresh)
    autocmd CursorHoldI execute "normal \<Plug>(asynccomplete_force_refresh)"
    " let g:lsp_log_verbose = 1
    " let g:lsp_log_file = expand('~/vim-lsp.log')

    " " for asyncomplete.vim log
    " let g:asyncomplete_log_file = expand('~/asyncomplete.log')
endif

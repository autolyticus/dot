if PlagCheck('deoplete')
    let g:deoplete#enable_at_startup = 1
    " let g:deoplete#auto_complete_delay = 25
    call deoplete#custom#source('neosnippet', 'rank', 1000)
    call deoplete#custom#source('omni', 'rank', 500)
    call deoplete#custom#source('lsp#complete', 'rank', 500)
    call deoplete#custom#source('omni', 'functions', {
                \ 'dart':  'lsp#complete',
                \})
    let g:deoplete#omni#input_patterns = {}
    inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
    autocmd CompleteDone * pclose " To close preview window of deoplete automagically
    " let g:deoplete#sources#clang#libclang_path='/usr/lib/libclang.so'
    " let g:deoplete#sources#clang#clang_header='/usr/lib/clang'
    inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function() abort
        return deoplete#close_popup() . "\<CR>"
    endfunction
endif

if PlagCheck('asyncomplete')
    call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
                \ 'name': 'buffer',
                \ 'whitelist': ['*'],
                \ 'blacklist': ['go'],
                \ 'completor': function('asyncomplete#sources#buffer#completor'),
                \ }))
    call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
                \ 'name': 'omni',
                \ 'whitelist': ['*'],
                \ 'blacklist': ['c', 'cpp', 'html'],
                \ 'completor': function('asyncomplete#sources#omni#completor')
                \  }))
    if has('python3')
        call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
                    \ 'name': 'ultisnips',
                    \ 'whitelist': ['*'],
                    \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
                    \ }))
    endif
    imap <c-space> <Plug>(asyncomplete_force_refresh)
endif

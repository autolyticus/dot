if PlagCheck('vim-gutentags')
    set statusline+=%{gutentags#statusline()}
    let g:gutentags_project_root = ['LICENSES', 'LICENSE']
    let g:gutentags_modules = ['ctags', 'gtags_cscope']
    let g:gutentags_cache_dir = '/var/tmp/gutentags'
endif

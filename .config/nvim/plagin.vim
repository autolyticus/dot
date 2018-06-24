" Check if plugin is loaded, The only reliable way to do it
function! PlagCheck(plg)
	let l:searchReg = 'v:val =~? "' . a:plg . '"'
	" echom l:searchReg
	let l:nMatches = len(filter(split(execute(':scriptnames'), "\n"), l:searchReg))
	" let l:nMatches = split(execute('echo &rtp'), "\n")
	" echom string(l:nMatches)
	if l:nMatches > 1
		" echo "SUCCESS"
		return 1
	else
		" echom "FAILED"
		return 0
	endif
endfunction


let g:go_metalinter_autosave = 0
let g:go_fmt_autosave = 0
let g:go_list_type = "quickfix"
" ale-specific
" if exists('g:loaded_ale')
	" let g:ale_c_gcc_options = '-std=gnu11 -Wall'
	let g:ale_linters = {
				\	'c': ['clang', 'flawfinder', 'clang-tidy'],
				\	'cpp': ['clang', 'flawfinder', 'clang-tidy'],
				\	'python': ['pyflakes', 'pyls'],
				\	'text': ['proselint', 'vale'],
				\	'vim': ['vint'],
				\	'go': ['go build', 'gosimple', 'go vet', 'staticcheck'],
				\	}
	" let airline#extensions#ale#error_symbol = '⨉ '
	" let airline#extensions#ale#warning_symbol = '⚠ '
	let g:ale_fixers = {
				\	'c': ['clang-format'],
				\	'cpp': ['clang-format'],
				\	'go': ['gofmt'],
				\	'python': ['autopep8'],
				\	'sh': ['shfmt'],
				\	'haskell': ['brittany'],
				\	}
	let g:ale_sign_column_always = 1
	let g:ale_lint_on_save = 1
	let g:ale_lint_on_text_changed = 'never'
	let g:ale_sign_error = '⨉ '
	let g:ale_sign_warning = '⚠ '
	let g:ale_fix_on_save = 1
	nmap <silent> <F4> <Plug>(ale_next_wrap)
	nmap <silent> <F12> :ALEToggle<CR>
" endif

" Expand region plugin.
" call expand_region#custom_text_objects()
" vmap v <Plug>(expand_region_expand)
" vmap <C-v> <Plug>(expand_region_shrink)
" Chromatica
" let g:chromatica#enable_at_startup=1
" let g:chromatica#highlight_feature_level=1
" let g:chromatica#responsive_mode=1

" if exists('g:loaded_neomake')
	map <F5> :w<CR>:execute<Space>"NeomakeSh!"<Space>g:mp<CR>
	autocmd BufWritePost * execute ':NeomakeSh!' g:mp
	" autocmd BufWritePost * call atags#generate()
	autocmd User NeomakeFinished echo "Compiled"
	let g:neomake_enabled_makers=[]
" endif

" Deoplete
if exists('g:loaded_deoplete')
	let g:deoplete#enable_at_startup = 1
	" let g:deoplete#auto_complete_delay = 25
	call deoplete#custom#set('neosnippet', 'rank', 1000)
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

" nvim-completion-manager
" if has_key(plugs, 'nvim-completion-manager')
	" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
	" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
	inoremap <silent> <c-k> <c-r>=cm#sources#neosnippet#trigger_or_popup("\<Plug>(neosnippet_expand_or_jump)")<cr>
	set shortmess+=c
	let g:cm_completeopt='menuone,noinsert,noselect,preview'
	autocmd CompleteDone * pclose " To close preview window of deoplete automagically
	let g:SuperTabClosePreviewOnPopupClose= 1
" endif

" Neosnippet
" if exists('g:loaded_neosnippet')
	" imap <C-k> <Plug>(neosnippet_expand_or_jump)
	" vmap <c-k> <Plug>(neosnippet_expand_or_jump)
	" smap <C-k> <Plug>(neosnippet_expand_or_jump)
	" inoremap <silent> <c-k> <c-r>=cm#sources#neosnippet#trigger_or_popup("\<Plug>(neosnippet_expand_or_jump)")<cr>
	xmap <C-k> <Plug>(neosnippet_expand_target)
	" let g:neosnippet#enable_completed_snippet=1
" endif

" if exists('g:loaded_EasyClip')
	nnoremap gm m
	let g:EasyClipUseSubstituteDefaults=0
	" let g:EasyClipUsePasteDefaults=0
	" nmap <c-n> <plug>EasyClipSwapPasteForward
	" nmap <c-p> <plug>EasyClipSwapPasteBackwards
	" let g:yankstack_yank_keys = ['y', 'd']
	" let g:yankstack_map_keys = 0
	" nmap <c-p> <Plug>yankstack_substitute_older_paste
	" nmap <c-n> <Plug>yankstack_substitute_newer_paste
" endif

" if exists('g:loaded_targets')
	let g:targets_jumpRanges = 'rr rb rB bb bB BB ll al Al aa Aa AA'
" endif

" LSP
" if has_key(plugs, 'LanguageClient-neovim')
" 	set hidden
" 	let g:LanguageClient_serverCommands = {
" 		\ 'python': ['pyls'],
" 		\ 'c': ['cquery'],
" 		\ 'cpp': ['cquery', '--log-file=/tmp/cq.log'],
" 		\ 'bash': ['bash-lanuguage-server'],
" 		\ 'sh': ['bash-lanuguage-server'],
" 		\ 'go': ['go-langserver'],
" 		\ }
" 		" \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
" 		" \ 'javascript': ['javascript-typescript-stdio'],
" 		" \ 'javascript.jsx': ['javascript-typescript-stdio'],
" 	let g:LanguageClient_loadSettings = 1

" 	let g:LanguageClient_selectionUI = 'fzf'
" 	let g:LanguageClient_settingsPath = '/home/g/.config/nvim/settings.json'
" 	nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
" 	nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
" 	nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
" 	" nnoremap <silent> * :call LanguageClient_textDocument_references()<CR>
" 	set formatexpr='LanguageClient_textDocument_rangeFormatting()'
" endif

" Neotags
" if exists('g:loaded_neotags')
" 	let g:neotags#cpp#order = 'ced'
" 	let g:neotags#c#order = 'ced'
" 	let g:neotags_file = 'tags'
" 	let g:neotags_ctags_args = ['--sort=yes', '--languages=C', '--languages=+C++', '--fields=+l', '--c-kinds=+p', '--c++-kinds=+p']
" 	let g:neotags_enabled = 1
" 	autocmd FileType c TagbarOpen
" 	autocmd FileType python TagbarOpen
" 	autocmd FileType cpp TagbarOpen
" 	let g:tagbar_width = 20
" 	nnoremap <silent> <F8> :TagbarToggle<CR>:NeotagsToggle<CR>
" endif

highlight link cTypeTag Special
highlight link cppTypeTag Special
highlight link cEnumTag Identifier
highlight link cppEnumTag Identifier
highlight link cPreProcTag PreProc
highlight link cppPreProcTag PreProc

" " FastFold Plugin
" let g:fastfold_savehook = 0
" let g:xml_syntax_folding = 1
" let g:c = 1
" let g:cpp = 1
" let g:fastfold_fold_command_suffixes = []

" Vim-Easy-Align
vmap <Space><Enter> <Plug>(EasyAlign)

" Split-term
if exists(':Term')
	map <Space>d :Term<CR>
endif

" " nvimux
" if has_key(plugs, 'nvimux')
" 	let g:nvimux_open_term_by_default = 'true'
" 	let g:nvimux_new_window_buffer = 'single'
" 	let g:nvimux_quickterm_provider = 'Term'
" 	let g:nvimux_quickterm_direction = 'botright'
" 	let g:nvimux_quickterm_orientation = 'vertical'
" 	let g:nvimux_quickterm_scope = 't'
" 	let g:nvimux_quickterm_size = '80'
" 	lua require('nvimux').bootstrap()
" endif

" Vim rest console
let g:vrc_output_buffer_name = '__VRC_OUTPUT.json'
" let g:vrc_response_default_content_type = 'json'
let g:vrc_show_command = 1
let g:vrc_set_default_mapping = 0
map <Space>r :call VrcQuery()<CR><C-w>l

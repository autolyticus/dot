if PlagCheck('neotags')
	let g:neotags#cpp#order = 'ced'
	let g:neotags#c#order = 'ced'
	let g:neotags_file = 'tags'
	let g:neotags_ctags_args = ['--sort=yes', '--languages=C', '--languages=+C++', '--fields=+l', '--c-kinds=+p', '--c++-kinds=+p']
	let g:neotags_enabled = 1
	autocmd FileType c TagbarOpen
	autocmd FileType python TagbarOpen
	autocmd FileType cpp TagbarOpen
	let g:tagbar_width = 20
	nnoremap <silent> <F8> :TagbarToggle<CR>:NeotagsToggle<CR>
endif

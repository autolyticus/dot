if PlagCheck('ale')
	" let g:ale_c_gcc_options = '-std=gnu11 -Wall'
	let g:ale_linters = {
				\	'c': ['clang', 'flawfinder', 'clang-tidy'],
				\	'cpp': ['clang', 'flawfinder', 'clang-tidy'],
				\	'python': ['pyflakes', 'pyls'],
				\	'text': ['proselint', 'vale'],
				\	'vim': ['vint'],
				\	'go': ['go build', 'gosimple', 'go vet', 'staticcheck'],
				\	'haskell': ['hdevtools', 'stack_build', 'stack-ghc'],
				\	}
    let g:ale_haskell_ghc_options = '-Wall -fno-code -v0 -dynamic'
	" let airline#extensions#ale#error_symbol = '⨉ '
	" let airline#extensions#ale#warning_symbol = '⚠ '
	" let g:ale_fixers = {
	" 			\	'c': ['clang-format'],
	" 			\	'cpp': ['clang-format'],
	" 			\	'go': ['gofmt'],
	" 			\	'python': ['autopep8'],
	" 			\	'sh': ['shfmt'],
	" 			\	'haskell': ['brittany'],
	" 			\	}
	" let g:ale_fix_on_save = 1
	let g:ale_sign_column_always = 1
	let g:ale_lint_on_save = 1
	let g:ale_lint_on_text_changed = 'never'
	let g:ale_sign_error = '⨉ '
	let g:ale_sign_warning = '⚠ '
	nmap <silent> <F4> <Plug>(ale_next_wrap)
	nmap <silent> <F12> :ALEToggle<CR>
    let g:ale_completion_enabled = 1
endif

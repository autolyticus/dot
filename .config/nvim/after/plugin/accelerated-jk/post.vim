augroup filetypedetect
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
	autocmd FileType spec set commentstring=#\ %s
	autocmd FileType cpp set keywordprg=:Term\ cppman
	autocmd FileType *.in setfiletype armasm | set commentstring=;\ %s
	autocmd FileType kivy set commentstring=#\ %s
augroup END
set completeopt="menuone,preview"

" Accelerated j/k
if PlagCheck('accelerated-jk')
	let g:accelerated_jk_acceleration_table=[30, 50]
	nmap j <Plug>(accelerated_jk_gj)
	nmap k <Plug>(accelerated_jk_gk)
endif

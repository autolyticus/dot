augroup filetypedetect
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
	autocmd FileType spec set commentstring=#\ %s
	autocmd FileType cpp set keywordprg=:Term\ cppman
	autocmd FileType *.in setfiletype armasm | set commentstring=;\ %s
	autocmd FileType kivy set commentstring=#\ %s
augroup END
set completeopt="menuone,preview"

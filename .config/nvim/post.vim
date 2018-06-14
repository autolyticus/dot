augroup filetypedetect
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
	autocmd FileType spec set commentstring=#\ %s
	autocmd FileType cpp set keywordprg=:Term\ cppman
	autocmd FileType *.in setfiletype armasm | set commentstring=;\ %s
	autocmd FileType kivy set commentstring=#\ %s
	autocmd FileType nim set commentstring=#\ %s
	autocmd FileType arduino set commentstring=//\ %s
augroup END
autocmd FileWritePost *.ino \%!clang-format
set completeopt="menuone,preview"

if PlagCheck('neomake')
	map <F5> :w<CR>:execute<Space>"NeomakeSh!"<Space>g:mp<CR>
	autocmd BufWritePost * execute ':NeomakeSh!' g:mp
	" autocmd BufWritePost * call atags#generate()
	autocmd User NeomakeFinished echo "Compiled"
	let g:neomake_enabled_makers=[]
endif

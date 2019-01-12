if PlagCheck('easymotion')
	let g:EasyMotion_do_mapping = 0
	let g:EasyMotion_smartcase = 1
	let g:EasyMotion_enter_jump_first = 1
	let g:EasyMotion_space_jump_first = 1
	" let g:EasyMotion_inc_highlight = 0
	map <Space>f <Plug>(easymotion-f)
	map <Space><Space> <Plug>(easymotion-s)
	map s <Plug>(easymotion-s)
	map <Space>s <Plug>(easymotion-s2)
	map <Space>t <Plug>(easymotion-t)
	map <Space>j <Plug>(easymotion-j)
	map <Space>k <Plug>(easymotion-k)
	" These `n` & `N` map[pings[ are options.] You] do not have to map `n` & `N` to EasyMotion.
	" Without these mappings, `n` & `N` works fine. (These mappings just provide
	" different highlight method and have some other features )
	map / <Plug>(easymotion-sn)
	map n <Plug>(easymotion-next)
	map N <Plug>(easymotion-prev)
endif

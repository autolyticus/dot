autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

autocmd User Ncm2PopupOpen set completeopt=noinsert,menuone,noselect,preview
autocmd User Ncm2PopupClose set completeopt=menuone
set shortmess+=c

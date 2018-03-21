" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=2

set noshowmode

if (has("termguicolors"))
	set termguicolors
endif
" augroup interface
" 	autocmd ColorScheme onedark highlight Normal guibg=#090909 ctermbg=232
" augroup END
" let base16colorspace=256
" set background=dark
" autocmd ColorScheme base16-gruvbox-hard highlight Normal guibg=#111111 ctermbg=242
" let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
" autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
" let g:onedark_termcolors=16
colorscheme PaperColor
let g:airline_powerline_fonts = 1
let g:airline_theme="challenger_deep"
" colorscheme base16-gruvbox-dark-hard
" colorscheme base16-paraiso
" colorscheme onedark
" highlight Normal guibg=#111111 ctermbg=232
" highlight Normal guibg=#090909 ctermbg=232
" set cursorline
" set background=dark
" highlight Normal ctermbg=0
" highlight Normal guibg=#111111 ctermbg=242
set signcolumn=yes

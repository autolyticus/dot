" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
"   \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
"   \,sm:block-blinkwait175-blinkoff150-blinkon175

set noshowmode
filetype plugin on
syntax on

if (has("termguicolors"))
    set termguicolors
endif

augroup interface
    autocmd ColorScheme onedark highlight Normal guibg=#101010 ctermbg=232
augroup END
" let base16colorspace=256
" set background=dark
" autocmd ColorScheme base16-gruvbox-hard highlight Normal guibg=#111111 ctermbg=242
" let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
autocmd ColorScheme onedark call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
" let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
" set t_Co=256
let g:onedark_terminal_italics = 1
set t_Co=256
let ayucolor="dark"
source ~/.config/nvim/colo.vim
" autocmd ColorScheme onedark call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
let g:onedark_termcolors=256
" set background=dark

let g:airline_powerline_fonts = 1
" let g:airline_theme="alduin"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
" let g:airline#extensions#tabline#buffer_nr_show = 1
" highlight Normal guibg=#111111 ctermbg=232
" highlight Normal guibg=#090909 ctermbg=232
" set cursorline
" set background=dark
" highlight Normal ctermbg=0
" highlight Normal guibg=#111111 ctermbg=242
set signcolumn=yes

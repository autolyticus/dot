if has('gui_running')
    " Make shift-insert work like in Xterm
    map <S-Insert> <MiddleMouse>
    map! <S-Insert> <MiddleMouse>
endif


inoremap jj <Esc>
inoremap JJ <Esc>ZZ
if has('nvim')
    tnoremap <C-w> <C-\><C-n>
    tnoremap <A-h> <C-\><C-n><C-w>h
    tnoremap <A-j> <C-\><C-n><C-w>j
    tnoremap <A-k> <C-\><C-n><C-w>k
    tnoremap <A-l> <C-\><C-n><C-w>l
    tnoremap jj <C-\><C-n>
    map <A-r> :w<CR>:source<Space>%<CR>:PlugInstall<CR>
endif

nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" KEY MAPPINGS
" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l><C-w>z<C-w>o

" Force write! If you're not logged in as sudo
cmap fw w !sudo tee % >/dev/null <CR> <Space>q

nnoremap j gj
nnoremap k gk

" SPACE IS THE LEADER!
map <Space> <Leader>

" Quick macros
map <Space>o @o
map <Space>p @p
map <Space>i @i


" Quick copy-paste
vmap <Space>y "+y
vmap <Space>Y "+Y
vmap <Space>d "+d
nmap <Space>p "+p
nmap <Space>P "+P
vmap <Space>p "+p
vmap <Space>P "+P
" vmap r "_dP
" vmap <Space>r "_d"+P

" Don't use Ex mode, use Q to quit
" Revert with ":unmap Q", ":unmap q:"
map Q <NOP>
map <F1> <NOP>
map <expr> <Space>q &mod ? ':q!' : ':q<CR>'
"map q: :q<CR>

map <Space>` :w<CR>
map <Space>w <C-w>

" Quick preview close
map <Space>z <C-w>z<C-w>o
autocmd BufWinEnter,WinEnter,BufNewFile term://* startinsert
autocmd BufWinEnter quickfix nnoremap <silent> <buffer>
            \   q :cclose<cr>:lclose<cr>
autocmd BufEnter * if (winnr('$') == 1 && &buftype ==# 'quickfix' ) |
            \   bd|
            \   q | endif

map <F5> :w<CR>:execute<Space>g:mp<CR>

map <silent> <Space>d :term<CR>i
map <F6> :botright<Space>vspl<CR>:terminal<Space>gdb<Space>./%.out<CR>
map <F9> :botright<Space>vspl<CR>:terminal<Space>./%.out<CR>i
map <F10> :botright<Space>vspl<CR>:terminal<Space>./tester<CR>
" Go to the first non-blank character of a line
noremap 0 ^
" Just in case you need to go to the very beginning of a line
noremap ^ 0


" map <F12> :Neoformat<CR>:set<Space>ts=2<CR>:retab!<CR>:set<Space>ts=4<CR>

nnoremap <CR> <NOP>
map <C-j>j <C-W><C-]>

noremap ' `
map ` <ESC>

map <Leader><C-j> $x
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" Revert with ":iunmap <C-U>".
inoremap <C-U> <C-G>u<C-U>

" Visual mode indent
vmap < <gv
vmap > >gv

" Visual mode search for selected text
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Switch to last tab
if !exists('g:lasttab')
  let g:lasttab = 1
endif
nmap <Leader><Tab> :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

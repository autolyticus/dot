let b:ale_fixers = ['dartfmt']
" function! TriggerHotReload() abort
" 	" silent execute 'NeomakeSh! kill -SIGUSR1 $(cat /tmp/flutter.pid)'
" 	silent execute '!kill -SIGUSR1 $(cat /tmp/flutter.pid)'
" endfunction

" autocmd BufWritePost *.dart execute ':%!dartfmt'

call plug#begin('~/.config/nvim/plugins')
	" AutoCompletion Framework
	" Plug 'autozimu/LanguageClient-neovim', {
	" 	\ 'branch': 'next',
	" 	\ 'do': 'bash install.sh',
	" 	\ }
	" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	" Plug 'zchee/deoplete-clang'
	" Plug 'zchee/deoplete-jedi'
	" Plug 'ervandew/supertab'
	" Plug 'roxma/nvim-completion-manager'
	Plug 'Shougo/neco-syntax'
	Plug 'Shougo/neoinclude.vim'
	Plug 'Shougo/neosnippet.vim' | Plug 'Shougo/neosnippet-snippets'

	" Linters/Builders
	" Plug 'neomake/neomake'
	let g:ale_emit_conflict_warnings = 0
	Plug 'w0rp/ale' ", { 'for': ['c', 'cpp', 'python', 'go'] }
	" Plug 'fntlnz/atags.vim'
	" Plug 'jsfaint/gen_tags.vim'
	" Plug 'c0r73x/neotags.nvim'

	" Syntax Highlighting
	Plug 'sheerun/vim-polyglot'
	" Plug 'arakashic/chromatica.nvim'
	" Plug 'jalvesaq/Nvim-R' , { 'for': [ 'r' ] }
	" Plug 'vim-scripts/armasm'
	" Plug 'neovim/node-host', { 'do': 'npm install' }
	" Plug 'vimlab/mdown.vim', { 'do': 'npm install' }

	" Code Formatting
	Plug 'sbdchd/neoformat'
	" Plug 'godlygeek/tabular'
	" Plug 'ntpeters/vim-better-whitespace'
	Plug 'Yggdroot/indentLine'

	" Efficiency Helpers
	Plug 'easymotion/vim-easymotion'
	Plug 'tpope/vim-surround'
	Plug 'Raimondi/delimitMate'
	" Plug 'tweekmonster/braceless.vim'
	" Plug 'jiangmiao/auto-pairs'

	" Code commenting
	" Plug 'scrooloose/nerdcommenter'
	Plug 'tpope/vim-commentary'
	" Plug 'tomtom/tcomment_vim'

	" Other
	" Plug 'junegunn/vim-easy-align'
	" Plug 'Konfekt/FastFold'
	Plug 'wellle/targets.vim'
	" Plug '/bin/fzf'
	" Plug 'junegunn/fzf.vim'
	" Plug 'junegunn/fzf'
	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-unimpaired'
	Plug 'svermeulen/vim-easyclip'


	" Terminal related
	" Plug 'BurningEther/nvimux'
	" Plug 'kassio/neoterm'
	" Plug 'mklabs/split-term.vim'
	" Plug 'durgaswaroop/vim-mpc'

	" Interface changes
	" Plug 'vim-airline/vim-airline'
	" Plug 'majutsushi/tagbar'
	" Plug 'itchyny/lightline.vim'
	" Plug 'mhinz/vim-startify'
	" Plug 'Shougo/denite.nvim'

	" Colours
	Plug 'rafi/awesome-vim-colorschemes'
	" Plug 'vim-airline/vim-airline-themes'
	" Plug 'bluz71/vim-moonfly-colors'
	" Plug 'jlesquembre/base16-neovim'
	" Plug 'chriskempson/base16-vim'
	" Plug 'MaxSt/FlatColor'
	" Plug 'mhinz/vim-janah'
	" Plug 'joshdick/onedark.vim'

call plug#end()

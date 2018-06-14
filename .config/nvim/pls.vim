call plug#begin('~/.config/nvim/plugins')
	" AutoCompletion Framework
	Plug 'roxma/nvim-completion-manager'
	Plug 'Shougo/neco-syntax'
	Plug 'Shougo/neoinclude.vim'
	Plug 'Shougo/neosnippet.vim' | Plug 'Shougo/neosnippet-snippets' | Plug 'honza/vim-snippets'
	" Plug 'autozimu/LanguageClient-neovim', {
	" 	\ 'branch': 'next',
	" 	\ 'do': 'bash install.sh',
	" 	\ }
	" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	" Plug 'zchee/deoplete-clang'
	" Plug 'zchee/deoplete-go', {'do' : 'make' }
	" Plug 'zchee/deoplete-jedi'
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
	Plug 'stevearc/vim-arduino'
	" Plug 'ervandew/supertab'

	" Linters/Builders
	Plug 'neomake/neomake'
	let g:ale_emit_conflict_warnings = 0
	Plug 'w0rp/ale' ", { 'for': ['c', 'cpp', 'python', 'go'] }
	Plug 'fntlnz/atags.vim'
	" Plug 'jsfaint/gen_tags.vim'
	" Plug 'c0r73x/neotags.nvim'

	" Syntax Highlighting
	Plug 'sheerun/vim-polyglot'
	" Plug 'jalvesaq/Nvim-R' , { 'for': [ 'r' ] }
	" Plug 'vim-scripts/armasm'
	" Plug 'neovim/node-host', { 'do': 'npm install' }
	" Plug 'vimlab/mdown.vim', { 'do': 'npm install' }
	" Plug 'arakashic/chromatica.nvim'

	" Code Formatting
	Plug 'sbdchd/neoformat'
	Plug 'ntpeters/vim-better-whitespace'
	Plug 'Yggdroot/indentLine'
	Plug 'tpope/vim-sleuth'
	" Plug 'junegunn/vim-easy-align'
	" Plug 'godlygeek/tabular'

	" Efficiency Helpers
	Plug 'easymotion/vim-easymotion'
	Plug 'tpope/vim-surround'
	Plug 'tweekmonster/braceless.vim'
	Plug 'Konfekt/FastFold'
	Plug 'wellle/targets.vim'
	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-unimpaired'
	Plug 'svermeulen/vim-easyclip'
	" Plug 'maxbrunsfeld/vim-yankstack'
	Plug 'AndrewRadev/linediff.vim'
	Plug 'rhysd/accelerated-jk'
	Plug 'AndrewRadev/sideways.vim'
	Plug 'FooSoft/vim-argwrap'
	" Plug 'Raimondi/delimitMate'
	" Plug 'jiangmiao/auto-pairs'

	" Miscallaneous
	Plug 'metakirby5/codi.vim'
	Plug 'junegunn/limelight.vim'
	Plug 'Shougo/vinarise.vim'
	Plug 'diepm/vim-rest-console'
	Plug 'wakatime/vim-wakatime'

	" Code commenting
	Plug 'tpope/vim-commentary'
	" Plug 'tomtom/tcomment_vim'
	" Plug 'scrooloose/nerdcommenter'

	" FZF
	Plug '/bin/fzf'
	Plug 'junegunn/fzf.vim'
	Plug 'junegunn/fzf'

	" Git
	" Plug 'tpope/vim-fugitive'
	Plug 'junegunn/gv.vim'
	Plug 'airblade/vim-gitgutter'

	" Terminal related
	Plug 'BurningEther/nvimux'
	Plug 'kassio/neoterm'
	Plug 'mklabs/split-term.vim'
	" Plug 'durgaswaroop/vim-mpc'

	" Interface
	Plug 'vim-airline/vim-airline'
	Plug 'majutsushi/tagbar'
	Plug 'mhinz/vim-startify'
	Plug 'scrooloose/nerdtree'
	" Plug 'Shougo/echodoc.vim'
	" Plug 'Shougo/denite.nvim'
	" Plug 'itchyny/lightline.vim'

	" Colours
	Plug 'rafi/awesome-vim-colorschemes'
	Plug 'vim-airline/vim-airline-themes'
	" Plug 'bluz71/vim-moonfly-colors'
	Plug 'jlesquembre/base16-neovim'
	" Plug 'chriskempson/base16-vim'
	" Plug 'MaxSt/FlatColor'
	" Plug 'mhinz/vim-janah'
	Plug 'josuegaleas/jay'
	" Plug 'joshdick/onedark.vim'

call plug#end()

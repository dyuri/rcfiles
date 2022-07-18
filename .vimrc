" vim-plug based

" xonsh => bash
set shell=bash

" use system python even in virtualenvs
let g:python2_host_prog='/usr/bin/python2'
let g:python3_host_prog='/usr/bin/python'

set nocompatible | filetype indent plugin on | syn on

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

endif

call plug#begin()
  " Colorschemes
  " Plug 'tomasr/molokai'
  Plug 'dylanaraps/wal.vim'
  Plug 'sainnhe/gruvbox-material'

  Plug 'itchyny/lightline.vim'
  Plug 'mengelbrecht/lightline-bufferline'

  Plug 'Shougo/vimproc.vim', { 'do': 'make' }
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'kristijanhusak/defx-icons'

  Plug 'voldikss/vim-floaterm'
  Plug 'simnalamburt/vim-mundo'
  Plug 'tpope/vim-abolish'
  Plug 'phaazon/hop.nvim'

  Plug 'nelstrom/vim-visual-star-search'
  Plug 'haya14busa/incsearch.vim'
  Plug 'haya14busa/vim-asterisk'
  Plug 'machakann/vim-highlightedyank'
  Plug 'blueyed/vim-diminactive'
  Plug 'vim-utils/vim-troll-stopper'

  Plug 'Shougo/denite.nvim'

  " LSP
  Plug 'mattn/emmet-vim'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'dcampos/nvim-snippy'
  Plug 'dcampos/cmp-snippy'
  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/nvim-lsp-installer'
  Plug 'ray-x/guihua.lua', { 'do': 'cd lua/fzy && make' }
  Plug 'ray-x/navigator.lua'
  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'nvim-treesitter/nvim-treesitter-refactor'

  " fzf
  " Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

  " git
  Plug 'tpope/vim-fugitive'
  Plug 'tanvirtin/vgit.nvim'

  " development
  " Plug 'ryanoasis/vim-devicons' => nvim-web-devicons
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'scrooloose/nerdcommenter'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'mileszs/ack.vim'
  Plug 'ddrscott/vim-side-search'
  " Plug 'mhinz/vim-signify' => vgit
  Plug 'mhinz/vim-startify'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-surround'
  Plug 'AndrewRadev/tagalong.vim'
  Plug 'luochen1990/rainbow'
  Plug 'manicmaniac/betterga'
  Plug 'valloric/MatchTagAlways'
  Plug 'sbdchd/neoformat'
  Plug 'AndrewRadev/splitjoin.vim'
  Plug 'preservim/tagbar'

  Plug 'dense-analysis/ale'

  " copilot
  Plug 'github/copilot.vim'

  " markdown
  Plug 'vim-pandoc/vim-pandoc-syntax'

  " frontend
  Plug 'hail2u/vim-css3-syntax'
  Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
  Plug 'stephenway/postcss.vim'
  Plug 'jonsmithers/vim-html-template-literals'

  " python
  Plug 'ambv/black'
  Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

  " go
  "Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " stucks on save
  Plug 'darrikonn/vim-gofmt'
call plug#end()

" Look & feel

set t_Co=256
set background=dark
let g:rehash256=1

if has("termguicolors")
  set tgc
endif

if has("gui_running")
  set guifont=Hasklug\ Nerd\ Font:h16
  set nu
  " set lines=40
  " set columns=140
  set guioptions-=T
  set guioptions-=m
  set guioptions-=r
  " enable mouse
  set mouse=a
endif

" some colors
hi User1                ctermbg=darkblue ctermfg=cyan
hi User1                guibg=#080848 guifg=cyan
hi User2                ctermbg=darkblue ctermfg=white
hi User2                guibg=#080848 guifg=white
hi User3                ctermbg=darkblue ctermfg=green
hi User3                guibg=#080848 guifg=#33cc33
hi User4                ctermbg=darkblue ctermfg=blue
hi User4                guibg=#080848 guifg=#202050
hi StatusLine           ctermfg=white ctermbg=darkblue term=none cterm=none
hi StatusLine           guifg=white guibg=#080848 gui=none
hi StatusLineNC         ctermfg=gray ctermbg=darkblue term=none cterm=none
hi StatusLineNC         guifg=gray guibg=#080848 gui=none

hi TrollStopper         ctermbg=red guibg=#FF0000

let g:gruvbox_material_palette = 'original'
let g:gruvbox_material_background = 'hard'

colorscheme gruvbox-material

" Lightline
set showtabline=2

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ ['darkestgreen', 'brightgreen', 'bold'], ['white', 'gray4'] ]
let s:p.normal.right = [ ['gray5', 'gray10'], ['gray9', 'gray4'], ['gray8', 'gray2'] ]
let s:p.inactive.right = [ ['gray1', 'gray5'], ['gray4', 'gray1'], ['gray4', 'gray0'] ]
let s:p.inactive.left = s:p.inactive.right[1:]
let s:p.insert.left = [ ['darkestcyan', 'white', 'bold'], ['white', 'darkblue'] ]
let s:p.insert.right = [ [ 'darkestcyan', 'mediumcyan' ], [ 'mediumcyan', 'darkblue' ], [ 'mediumcyan','darkestblue' ] ]
let s:p.replace.left = [ ['white', 'brightred', 'bold'], ['white', 'gray4'] ]
let s:p.visual.left = [ ['darkred', 'brightorange', 'bold'], ['white', 'gray4'] ]
let s:p.normal.middle = [ [ 'gray7', 'gray2' ] ]
let s:p.insert.middle = [ [ 'mediumcyan', 'darkestblue' ] ]
let s:p.replace.middle = s:p.normal.middle
let s:p.replace.right = s:p.normal.right
let s:p.tabline.left = [ [ 'gray9', 'gray3' ] ]
let s:p.tabline.tabsel = [ [ 'darkestgreen', 'brightgreen', 'bold' ] ]
let s:p.tabline.middle = [ [ 'gray9', 'gray1' ] ]
let s:p.tabline.right = [ [ 'gray9', 'gray3' ] ]
let s:p.normal.error = [ [ 'gray9', 'brightestred' ] ]
let s:p.normal.warning = [ [ 'gray1', 'yellow' ] ]
let g:lightline#colorscheme#repa#palette = lightline#colorscheme#fill(s:p)

let g:lightline = {
  \   'colorscheme': 'repa',
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
  \     ]
  \   },
  \   'tabline': {
  \     'left': [ [ 'buffers' ] ],
  \     'right': [],
  \   },
  \   'component_expand': {
  \     'buffers': 'lightline#bufferline#buffers',
  \   },
  \   'component_type': {
  \     'buffers': 'tabsel',
  \   },
  \   'component': {
  \     'lineinfo': ' %3l:%-2v',
  \   },
  \   'component_function': {
  \     'gitbranch': 'FugitiveHead',
  \   },
  \   'separator': {
  \     'left': '', 'right': ''
  \   },
  \   'subseparator': {
  \     'left': '', 'right': ''
  \   }
  \ }
let g:lightline.colorscheme = 'gruvbox_material'

let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#unicode_symbols = 1

set ls=3          " enable the status

" cursor
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
au InsertEnter * set cul | set cuc
au InsertLeave * set nocul | set nocuc

" Generic settings

" leader
let mapleader = "," " map leader to ,
" map space to leader
map <space> <leader>

" neovim Y[y$] back to vim Y[yy]
nnoremap Y yy

set signcolumn=yes

set diffopt+=filler,internal,algorithm:patience,indent-heuristic

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" set encoding=utf-8  " utf8 encoding
" set fileencodings=  " automatikus filefelismeres
set shiftwidth=2  " 2 space az autoindentnel
set showmatch     " zaro zarojelhez megmutatja a parjat
set nostartofline " ugrasoknal ne menjen a sor elejere
set breakindent   " breaked lines use the same indent level as the original

" folding
function! RepaFoldText()
  let line = getline(v:foldstart)
  let foldedlinecount = v:foldend - v:foldstart + 1
  return '  '. foldedlinecount . line
endfunction

set foldenable " folding bekapcsolasa
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent
set foldtext=RepaFoldText()
set fillchars=fold:\
nnoremap <Backspace> za

" indent

set autoindent    " always set autoindenting on
set si            " smartindent
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

set et            " expandt tab
set mousemodel=extend
set mouse=v
set ch=2
set tabstop=2
set softtabstop=2
set smarttab
set textwidth=0
set so=5          " 5 lines of scope
set vb            " visual bell
set lz            " lazy redraw
set hidden        " allow switching from unsaved changes
set completeopt=menu,menuone,noselect " don't need python docstrings
set clipboard=unnamed " use the system clipboard
set title
set autoread " auto read file if changed

" backup
" backup/swap to ~/backup first
set backupdir=~/backup//,~/tmp//,/var/tmp//,/tmp//,.
set directory=~/backup/swap//,~/tmp//,/var/tmp//,/tmp//,.
set undofile
set undodir=~/backup/undo//,~/tmp//,/var/tmp//,/tmp//,.
" switch on backup
set bk

set history=100   " keep 100 lines of command line history
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set ignorecase    " ignore case
set smartcase     " smart case
" set gdefault      " default s///g

" clear hilites with leader+space
nnoremap <leader><space> :noh<cr>

" cursor movement for broken lines
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
noremap <silent> <expr> <DOWN> (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> <UP> (v:count == 0 ? 'gk' : 'k')

" wildmenu arrow key navigation
set wildcharm=<C-Z>
cnoremap <expr> <up> wildmenumode() ? "\<left>" : "\<up>"
cnoremap <expr> <down> wildmenumode() ? "\<right>" : "\<down>"
cnoremap <expr> <left> wildmenumode() ? "\<up>" : "\<left>"
cnoremap <expr> <right> wildmenumode() ? " \<bs>\<C-Z>" : "\<right>"

set wildignore+=*/tmp/*,*/build/*,*/target/*,*.so,*.swp,*.zip

set noshowmode

" resize splits
au VimResized * exe "normal \<c-w>="

" Don't use Ex mode, use Q for formatting
map Q gq

syntax on
set hlsearch

" save session
autocmd VimLeavePre * mksession! ~/.vim.session

" don't switch to unlisted buffers
augroup qf
  autocmd!
  autocmd FileType qf set nobuflisted
augroup END

augroup filepos
  autocmd!
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
augroup END

au FileType python setlocal tw=0 sw=4 ts=4 sta sts=4 ai et
au FileType html,htmldjango setlocal tw=0 sw=2 ts=2 sta sts=2 ai et
au FileType go setlocal tw=0 sw=4 ts=4 sts=4 noet
au FileType go au BufWritePre * GoFmt

" frissen beillesztett resz kijelolese
nnoremap <leader>v V`]

" #-os commentek ne menjenek a sor elejere
" inoremap # X<C-H>#

" indentalt resz ujraselectalasa
vnoremap < <gv
vnoremap > >gv

" Ctrl-Space kodkiegeszites
inoremap <Nul> <C-X><C-O>
inoremap <C-space> <C-X><C-O>

" <leader>cd -> pufferben levo file konyvtaraba lepes
nmap <silent> <Leader>cd :cd %:p:h<CR>

" egergombok
imap <RightMouse> <Esc>
nmap <RightMouse> i<LeftMouse>

" funkciogombok
inoremap <F1> <ESC>
vnoremap <F1> <ESC>

nmap <F2> :Defx<CR>
imap <F2> :Defx<CR>

nmap <F3> :bp!<cr>
nmap <F4> :bn!<cr>
map <F3> :bp!<cr>
map <F4> :bn!<cr>
imap <F3> <ESC>:bp!<cr>a
imap <F4> <ESC>:bn!<cr>a

nnoremap <F5> :MundoToggle<CR>

nnoremap <C-F6> mzggg?G'z
inoremap <C-F6> <ESC>mzggg?G'z

"nnoremap <F7> :Leaderf file<cr>
"nnoremap <S-F7> :Leaderf rg<cr>
"nnoremap <C-F7> :Leaderf mru<cr>
"nnoremap <F19> :Leaderf rg<cr>
"nnoremap <F31> :Leaderf mru<cr>
"nnoremap ; :Leaderf buffer<cr>
" leaderf => telescope
nnoremap <F7> <cmd>Telescope find_files<cr>
nnoremap <S-F7> <cmd>Telescope live_grep<cr>
nnoremap <F19> <cmd>Telescope live_grep<cr>

nmap <F8> :set wrap!<CR>
nmap <F9> :TagbarToggle<CR>
nmap <F11> :set nu!<CR>:set relativenumber!<CR>
nmap <F12> :set list!<CR>:RainbowToggle<CR>
nmap <C-F12> :set cursorline!<CR>:set cursorcolumn!<CR>
nmap <F36> :set cursorline!<CR>:set cursorcolumn!<CR>

" window/split navigation
map <esc>[1;5A <c-up>
map <esc>[1;5B <c-down>
map <esc>[1;5C <c-right>
map <esc>[1;5D <c-left>

map <c-left> <c-w><left>
map <c-right> <c-w><right>
map <c-up> <c-w><up>
map <c-down> <c-w><down>

" prezi fold navigation
map <M-Down> zmzjzo
map <M-Up> zmzkzo

" Dvorak Q => :
nnoremap Q :

" capital commands
cab W! w!
cab Q! q!
cab Wq wq
cab Wa wa
cab wQ wq
cab WQ wq
cab W w
cab Q q

" PLUGINS

" defx (file manager)
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  " Define mappings
  nnoremap <silent><buffer><expr> <CR> defx#do_action('drop')
  nnoremap <silent><buffer><expr> c defx#do_action('copy')
  nnoremap <silent><buffer><expr> m defx#do_action('move')
  nnoremap <silent><buffer><expr> p defx#do_action('paste')
  nnoremap <silent><buffer><expr> l defx#do_action('open')
  nnoremap <silent><buffer><expr> E defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> P defx#do_action('open', 'pedit')
  nnoremap <silent><buffer><expr> o defx#do_action('open_or_close_tree')
  nnoremap <silent><buffer><expr> K defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> C defx#do_action('toggle_columns', 'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> S defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d defx#do_action('remove')
  nnoremap <silent><buffer><expr> r defx#do_action('rename')
  nnoremap <silent><buffer><expr> ! defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ; defx#do_action('repeat')
  nnoremap <silent><buffer><expr> h defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> * defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l> defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g> defx#do_action('print')
  nnoremap <silent><buffer><expr> cd defx#do_action('change_vim_cwd')
endfunction

call defx#custom#option('_', {
      \ 'winwidth': 30,
      \ 'split': 'vertical',
      \ 'direction': 'topleft',
      \ 'show_ignored_files': 0,
      \ 'buffer_name': 'defxplorer',
      \ 'toggle': 1,
      \ 'resume': 1,
      \ 'columns': 'icon:indent:icons:filename',
      \ })

call defx#custom#column('icon', {
      \ 'directory_icon': '▸',
      \ 'opened_icon': '▾',
      \ })

" HTML fold tag
nnoremap <leader>ft Vatzf

" floaterm
command! LG FloatermNew lazygit
command! FM FloatermNew nnn

" LeaderF
"let g:Lf_WindowPosition = 'popup'
"let g:Lf_PreviewInPopup = 1
"let g:Lf_CommandMap = {'<C-K>': ['<Up>'], '<C-J>': ['<Down>']}
"let g:Lf_StlSeparator = {'left': "\ue0b0", 'right': "\ue0b2"}
"let g:Lf_HideHelp = 1
"let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }
"let g:Lf_ShortcutF = "<leader>ff"

"noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
"noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
"noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
"noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

" leaderf => telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>

lua << EOF
require('telescope').setup({
  defaults = {
    layout_strategy = 'vertical',
  },
})
require('telescope').load_extension('fzf')
EOF

" vgit
lua << EOF
require('vgit').setup()
EOF

" indentline - disable by default
let g:indentLine_enabled = 0
let g:indent_blankline_enabled = v:false

" ack => ag
let g:ackprg = 'ag --nogroup --nocolor --column'

" sidesearch
cabbrev SS SideSearch
nnoremap <Leader>ss :SideSearch <C-r><C-w><CR> | wincmd p

" highlightyank
let g:highlightedyank_highlight_duration = 1000

" incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" vim-asterisk
map *   <Plug>(asterisk-*)
map #   <Plug>(asterisk-#)
map g*  <Plug>(asterisk-g*)
map g#  <Plug>(asterisk-g#)
map z*  <Plug>(asterisk-z*)
map gz* <Plug>(asterisk-gz*)
map z#  <Plug>(asterisk-z#)
map gz# <Plug>(asterisk-gz#)

" Signify => vgit
"let g:signify_vcs_list = [ 'git', 'hg' ]
"let g:signify_sign_add               = '▌'
"let g:signify_sign_delete            = '▌' " '▁'
"let g:signify_sign_delete_first_line = '▌'
"let g:signify_sign_change            = '▌'

" Sign colors
hi DiffAdd              guifg=#8ec02b guibg=#232526
hi DiffDelete           guifg=#f92672 guibg=#232526
hi DiffChange           guifg=#ffaf00 guibg=#232526

" hop
nnoremap <leader>/ :HopWord<cr>
hi HopNextKey         guifg=#ff007c
hi HopNextKey1        guifg=#00dfff
hi HopNextKey2        guifg=#2b9db3
hi HopUnmatched       guifg=#666666

" gpg crypt/decrypt
augroup encrypted
  au!

  "nem ment a viminfoba, swp-be
  autocmd BufReadPre,FileReadPre      *.gpg,*.asc set viminfo=
  autocmd BufReadPre,FileReadPre      *.gpg,*.asc set noswapfile
  "olvasas: binrais
  autocmd BufReadPre,FileReadPre      *.gpg set bin
  "autocmd BufReadPre,FileReadPre      *.gpg,*.asc let ch_save = &ch|set ch=2
  autocmd BufReadPost,FileReadPost    *.gpg,*.asc '[,']!sh -c 'gpg --decrypt 2> /dev/null'
  "iraskor normal mod
  autocmd BufReadPost,FileReadPost    *.gpg set nobin
  "autocmd BufReadPost,FileReadPost    *.gpg,*.asc let &ch = ch_save|unlet ch_save
  autocmd BufReadPost,FileReadPost    *.gpg,*.asc execute ":doautocmd BufReadPost " . expand("%:r")
  "menteskor encrypt
  autocmd BufWritePre,FileWritePre    *.gpg '[,']!sh -c 'gpg --default-recipient-self -e 2>/dev/null'
  autocmd BufWritePre,FileWritePre    *.asc '[,']!sh -c 'gpg --default-recipient-self -ae 2>/dev/null'
  "undo encrypt
  autocmd BufWritePost,FileWritePost  *.gpg,*.asc u
augroup END

" xsh
augroup xsh
  au! BufNewFile,BufRead *.xsh   set filetype=python
augroup END

" md
augroup pandoc_syntax
  au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

" tag %
nnoremap <leader>% :MtaJumpToOtherTag<cr>

" hexokinase colors
let g:Hexokinase_highlighters = ['virtual']
let g:Hexokinase_ftEnabled = ['css', 'html', 'js']
let g:Hexokinase_optInPatterns = ['full_hex', 'rgb', 'rgba', 'hsl', 'hsla']

" css - dash is inside words
au! FileType css,scss,js setl iskeyword+=-

" jspf => jsp
au BufNewFile,BufRead *.jspf set filetype=jsp

" ALE
let g:ale_linters = { 'vue': ['eslint'], 'javascript': ['eslint', 'prettier'] }
let g:ale_fixers = { 'javascript': ['eslint', 'prettier'] }

" Ale keybindings
nmap <silent> <leader>] :ALENext<cr>
nmap <silent> <leader>[ :ALEPrevious<cr>

" Ale signs
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_sign_info = ''

" Ale colors
hi ALEErrorSign         guifg=#fb4934 guibg=#232526
hi ALEWarningSign       guifg=#fabd2f guibg=#232526
hi ALEInfoSign          guifg=#83a598 guibg=#232526

" copilot
let g:copilot_node_command = "~/.nodenv/versions/16.15.0/bin/node"

" lsp lua
"lua << EOF
"local lsp_installer = require("nvim-lsp-installer")
"local kmopts = { noremap=true, silent=true }
"local function on_attach(client, bufnr)
  "-- mappings
  "vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', kmopts)
  "vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', kmopts)
  "vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', kmopts)
  "vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', kmopts)
  "vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', kmopts)
  "vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', kmopts)
  "vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', kmopts)
  "vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', kmopts)
  "vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', kmopts)
  "vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', kmopts)
  "vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', kmopts)
  "vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', kmopts)
  "vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', kmopts)
"end

"lsp_installer.on_server_ready(function(server)
  "local opts = {
    "on_attach = on_attach,
  "}

  "server:setup(opts)
"end)
"EOF


" `tsserver` installed manually with npm
" lsp server manual config - for navigator to work properly
lua << EOF
local install_root_dir = '/home/dyuri/.local/share/nvim/lsp_servers'

require'navigator'.setup({
  debug = true,
  lsp = {
    gopls = {
      cmd = { install_root_dir .. '/go/gopls' }
    },
    pyright = {
      cmd = { install_root_dir .. '/python/node_modules/.bin/pyright-langserver', '--stdio' }
    },
    jedi_language_server = {
      cmd = { install_root_dir .. '/jedi_language_server/venv/bin/jedi-language-server' }
    },
    html = {
      cmd = { install_root_dir .. '/html/node_modules/.bin/vscode-html-language-server', '--stdio' }
    },
    cssls = {
      cmd = { install_root_dir .. '/cssls/node_modules/.bin/vscode-css-language-server', '--stdio' }
    },
    format_on_save = false,
  }
})
EOF

" formatting
nmap <leader>f :lua vim.lsp.buf.formatting()<cr>
vmap <leader>f :lua vim.lsp.buf.range_formatting()<cr>


" nvim-cmp lua
lua << EOF
local cmp = require'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
      require'snippy'.expand_snippet(args.body)
    end,
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
    ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'snippy' },
  }, {
    { name = 'buffer' },
  })
})
EOF


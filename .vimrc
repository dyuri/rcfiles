" Repa's vimrc + nvimrc

filetype off

if has('vim_starting')
  set nocompatible " Be iMproved

  " Required:
  set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
endif

" use system python even in virtualenvs
let g:python2_host_prog='/usr/bin/python2'
let g:python3_host_prog='/usr/bin/python'

if dein#load_state('/home/dyuri/.cache/dein')
  call dein#begin('/home/dyuri/.cache/dein')

  " Let dein manage dein
  call dein#add('/home/dyuri/.cache/dein/repos/github.com/Shougo/dein.vim')

  " dein update
  call dein#add('wsdjeg/dein-ui.vim')

  " my plugins
  call dein#add('Shougo/vimproc.vim', {'build': 'make'})
  " call dein#add('scrooloose/nerdtree')
  " call dein#add('Xuyuanp/nerdtree-git-plugin')
  call dein#add('Shougo/defx.nvim')
  call dein#add('kristijanhusak/defx-icons')
  call dein#add('voldikss/vim-floaterm')
  call dein#add('scrooloose/nerdcommenter')
  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-fugitive')
  call dein#add('Yggdroot/LeaderF', {'build': './install.sh'})
  call dein#add('Yggdroot/indentLine')
  call dein#add('lukas-reineke/indent-blankline.nvim')
  call dein#add('itchyny/lightline.vim')
  call dein#add('mengelbrecht/lightline-bufferline')
  call dein#add('sheerun/vim-polyglot') " Check
  call dein#add('mileszs/ack.vim')
  call dein#add('ddrscott/vim-side-search')
  call dein#add('hail2u/vim-css3-syntax')
  call dein#add('mattn/emmet-vim')
  call dein#add('simnalamburt/vim-mundo')
  call dein#add('Shougo/deoplete.nvim')
  "" NeoBundle 'Valloric/YouCompleteMe', {
  ""      \ 'build': {
  ""      \     'unix': './install.sh --system-boost'
  ""      \   }
  ""      \ }
  "call dein#add('neoclide/coc.nvim', {'rev': 'release'}) " don't like
  " CocInstall coc-html, coc-css, coc-python
  call dein#add('autozimu/LanguageClient-neovim', {
    \ 'rev': 'next',
    \ 'build': 'bash install.sh',
    \ })
  call dein#add('ternjs/tern_for_vim')
  call dein#add('Shougo/denite.nvim')
  " call dein#add('vim-scripts/vcscommand.vim')
  call dein#add('tpope/vim-abolish')
  "call dein#add('pangloss/vim-javascript' " replaced by polyglot)call dein#add('othree/yajs.vim')
  "call dein#add('bolasblack/csslint.vim')
  call dein#add('ludovicchabant/vim-lawrencium')
  call dein#add('mhinz/vim-signify')
  call dein#add('mhinz/vim-startify')
  call dein#add('tpope/vim-unimpaired')
  call dein#add('tpope/vim-surround')
  call dein#add('nelstrom/vim-visual-star-search')
  call dein#add('haya14busa/incsearch.vim')
  call dein#add('haya14busa/vim-asterisk')
  call dein#add('machakann/vim-highlightedyank')
  "call dein#add('chrisbra/vim-diff-enhanced')
  call dein#add('manicmaniac/betterga')
  call dein#add('blueyed/vim-diminactive')
  call dein#add('luochen1990/rainbow')
  call dein#add('christoomey/vim-sort-motion')
  call dein#add('valloric/MatchTagAlways')
  call dein#add('AndrewRadev/tagalong.vim')
  call dein#add('Konfekt/vim-unicode-homoglyphs')
  call dein#add('https://git.danielmoch.com/vim-smartsplit.git')

  " General development
  "call dein#add("scrooloose/syntastic")
  call dein#add('dense-analysis/ale')
  " call dein#add('dense-analysis/ale', {'rev': '89db85121c001fc60787647f012978a2328816a5'}) " something wrong with deoplete - ale
  call dein#add('sbdchd/neoformat')
  call dein#add('AndrewRadev/splitjoin.vim')

  " Python
  call dein#add("davidhalter/jedi-vim")
  call dein#add("zchee/deoplete-jedi")
  "call dein#add('klen/python-mode')
  call dein#add("majutsushi/tagbar")
  call dein#add("ambv/black")
  call dein#add("numirias/semshi", {'build': ':UpdateRemotePlugins'})

  " markdown
  call dein#add("vim-pandoc/vim-pandoc-syntax")

  " go
  call dein#add("fatih/vim-go")

  " vue.js
  call dein#add("posva/vim-vue")
  "call dein#add("sekel/vim-vue-syntastic")

  " polymer / lit
  call dein#add("jonsmithers/vim-html-template-literals")

  " css colors
  call dein#add("RRethy/vim-hexokinase", {'build': 'make hexokinase'})

  " postcss
  call dein#add("stephenway/postcss.vim")

  " Color
  call dein#add('tomasr/molokai')
  call dein#add('sainnhe/edge')
  call dein#add("w0ng/vim-hybrid")
  call dein#add("dylanaraps/wal.vim")

  " devicons
  call dein#add('ryanoasis/vim-devicons')
    " end of my plugins
 
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on

" leader
let mapleader = "," " map leader to ,
" map space to leader
map <space> <leader>

" wildmenu arrow key navigation
set wildcharm=<C-Z>
cnoremap <expr> <up> wildmenumode() ? "\<left>" : "\<up>"
cnoremap <expr> <down> wildmenumode() ? "\<right>" : "\<down>"
cnoremap <expr> <left> wildmenumode() ? "\<up>" : "\<left>"
cnoremap <expr> <right> wildmenumode() ? " \<bs>\<C-Z>" : "\<right>"

" NERDTree tweeks
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1

" rainbow
let g:rainbow_active = 0

" jsbeautifier
let g:jsbeautify = {'indent_size': 2, 'indent_char': ' '}
let g:htmlbeautify = {'indent_size': 2, 'indent_char': ' ', 'brace_style': 'expand', 'unformatted': ['a', 'sub', 'sup', 'b', 'i', 'u', 'em', 'cite', 'strong']}
let g:cssbeautify = {'indent_size': 2, 'indent_char': ' '}
let g:jsbeautify_engine = 'node'

" tern
let g:tern#command = ["tern"]

" css colors
let g:Hexokinase_highlighters = ['virtual']
" let g:Hexokinase_refreshEvents = ['BufWritePost']
let g:Hexokinase_ftEnabled = ['css', 'html', 'js']
let g:Hexokinase_optInPatterns = ['full_hex', 'rgb', 'rgba', 'hsl', 'hsla']

" lsp support
let g:LanguageClient_serverCommands = {
  \   'go': ['gopls'],
  \   'python': ['pyls'],
  \ }

let g:LanguageClient_useVirtualText = 0

nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
nnoremap <leader>lx :call LanguageClient#textDocument_references()<CR>
nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>

set signcolumn=yes

" syntastic - disable python (python-mode)
let g:syntastic_mode_map = { 'mode': 'active',
        \ 'active_filetypes': [],
        \ 'passive_filetypes': ['python'] }

" syntastic checkers
let g:syntastic_javascript_checkers = ['eslint', 'jshint']
let g:syntastic_html_checkers = ['eslint']

" golang
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" no jsx by default
let g:jsx_ext_required=1

" set diffopt+=filler,internal,algorithm:histogram,indent-heuristic
set diffopt+=filler,internal,algorithm:patience,indent-heuristic

" python-mode, jedi
let g:jedi#show_call_signatures = 2
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
" let g:pymode_rope = 0

" neocopmlete
" let g:acp_enableAtStartup = 0
" let g:neocomplete#enable_at_startup = 1
" let g:neocomplete#enable_smart_case = 1
" let g:neocomplete#sources#syntax#min_keyword_length = 3
" let g:neocomplete#enable_auto_select = 1

" deoplete
let g:deoplete#enable_at_startup = 1

" inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><C-y> neocomplete#close_popup()
" inoremap <expr><C-e> neocomplete#cancel_popup()

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

" sidesearch
cabbrev SS SideSearch
nnoremap <Leader>ss :SideSearch <C-r><C-w><CR> | wincmd p

" vim-asterisk
map *   <Plug>(asterisk-*)
map #   <Plug>(asterisk-#)
map g*  <Plug>(asterisk-g*)
map g#  <Plug>(asterisk-g#)
map z*  <Plug>(asterisk-z*)
map gz* <Plug>(asterisk-gz*)
map z#  <Plug>(asterisk-z#)
map gz# <Plug>(asterisk-gz#)

" html output
let html_use_css = 1

map <c-f> :call JsBeautify()<cr>

" 88/256 colors for urxvt
set t_Co=256

" molokai 256 colors
let g:rehash256 = 1

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Szinek beallitasa
  hi Normal               guibg=black guifg=#90f0b0
  hi Normal               ctermfg=white ctermbg=black
  "hi Normal               guifg=white guibg=darkblue
  hi String               ctermfg=Green
  hi String               guifg=#33cc33
  hi Number               ctermfg=LightGreen
  hi Number               guifg=#44ee44
  hi Boolean              ctermfg=LightGreen
  hi Boolean              guifg=#44ee44
  hi Float                ctermfg=LightGreen
  hi Float                guifg=#44ee44
  hi Operator             ctermfg=Yellow
  hi Operator             guifg=Yellow
  hi Repeat               ctermfg=Red
  hi Repeat               guifg=Red
  hi ErrorMsg             ctermfg=white ctermbg=red
  hi ErrorMsg             guifg=white guibg=red
  hi Visual               ctermbg=darkyellow ctermfg=darkcyan term=reverse
  hi Visual               guibg=#a0b020 guifg=darkblue
  hi VisualNOS            ctermbg=black ctermfg=darkcyan cterm=reverse,underline
  hi Todo                 ctermfg=red   ctermbg=darkblue gui=reverse,underline
  hi Todo                 guifg=red guibg=darkblue
  hi Search               ctermfg=yellow ctermbg=darkgreen
  hi Search               guifg=#44ee44 guibg=darkgreen
  hi IncSearch            ctermfg=black ctermbg=darkyellow cterm=bold,reverse,underline term=underline
  hi IncSearch            guifg=black guibg=darkyellow gui=bold,reverse
  hi SpecialKey           ctermfg=darkcyan
  hi SpecialKey           guifg=darkcyan
  hi Directory            ctermfg=cyan
  hi Directory            guifg=cyan
  hi Title                ctermfg=magenta cterm=bold
  hi Title                guifg=magenta gui=bold
  hi WarningMsg           ctermfg=red
  hi WarningMsg           guifg=red
  hi WildMenu             ctermfg=yellow ctermbg=black cterm=none term=none
  hi WildMenu             guifg=yellow guibg=black gui=none
  hi ModeMsg              ctermfg=yellow
  hi ModeMsg              guifg=yellow
  hi MoreMsg              ctermfg=darkgreen
  hi MoreMsg              guifg=darkgreen
  hi Question             ctermfg=green cterm=none
  hi Question             guifg=#33cc33 gui=none
  hi NonText              ctermfg=lightMagenta
  hi NonText              guifg=lightMagenta
  hi StatusLine           ctermfg=blue ctermbg=gray term=none cterm=none
  hi StatusLine           guifg=blue guibg=gray gui=none
  hi StatusLineNC         ctermfg=black ctermbg=gray term=none cterm=none
  hi StatusLineNC         guifg=black guibg=gray gui=none
  hi VertSplit            ctermfg=black ctermbg=gray term=none cterm=none
  hi VertSplit            guifg=black guibg=gray gui=none
  hi Folded               ctermfg=darkgrey ctermbg=black cterm=bold term=bold
  hi Folded               guifg=darkgrey guibg=black gui=bold
  hi FoldColumn           ctermfg=darkgrey ctermbg=black cterm=bold term=bold
  hi FoldColumn           guifg=darkgrey guibg=black gui=bold
  hi LineNr               ctermbg=black ctermfg=green cterm=none
  hi LineNr               guibg=#080840 guifg=#33cc33 gui=none
  hi SignColumn           ctermbg=black ctermfg=lightcyan cterm=none
  hi SignColumn           guibg=#080840 guifg=#44ffff gui=none
  hi Cursor               ctermfg=bg ctermbg=cyan
  hi Cursor               guifg=bg guibg=cyan
  hi lCursor              ctermfg=bg ctermbg=darkgreen
  hi lCursor              guifg=bg guibg=darkgreen
  hi Comment              ctermfg=brown cterm=none term=none
  hi Comment              guifg=blue gui=italic
  hi Constant             ctermfg=darkgreen
  hi Constant             guifg=#33cc33
  hi Special              ctermfg=green
  hi Special              guifg=lightcyan
  hi Identifier           ctermfg=cyan cterm=none
  hi Identifier           guifg=cyan gui=none
  hi Statement            ctermfg=yellow
  hi Statement            guifg=yellow
  hi PreProc              ctermfg=lightred cterm=bold
  hi PreProc              guifg=red gui=bold
  hi type                 ctermfg=darkYellow cterm=bold
  hi type                 guifg=darkYellow gui=bold
  hi Underlined           cterm=underline term=underline
  hi Underlined           gui=underline
  hi Ignore               ctermfg=darkcyan
  hi Ignore               guifg=bg

  " Status line
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

  " CtrlP
  hi CtrlPMode1           ctermbg=darkblue ctermfg=yellow
  hi CtrlPMode1           guibg=#080848 guifg=yellow
  hi CtrlPMode2           ctermbg=darkblue ctermfg=green
  hi CtrlPMode2           guibg=#080848 guifg=#33cc33
  hi CtrlPStatus          ctermbg=darkblue ctermfg=cyan
  hi CtrlPStatus          guibg=#080848 guifg=cyan

if v:version >= 700
  hi CursorLine           guibg=#041008
  hi CursorColumn         guibg=#041008

  hi MatchParen           ctermbg=darkgreen guibg=darkgreen guifg=yellow ctermfg=yellow

  hi Pmenu                guifg=Black guibg=#C4C090 ctermfg=LightGreen ctermbg=DarkGreen
  hi PmenuSel             guifg=Black guibg=#FFBF00 ctermfg=LightGreen ctermbg=Black
  hi PmenuSbar            guifg=Black guibg=LightGray
  hi PmenuThumb           guifg=Black guibg=White gui=NONE

  hi TabLine              guifg=Black guibg=#A4A090 gui=NONE
  hi TabLineFill          guifg=Black guibg=#A4A090 gui=NONE
  hi TabLineSel           guifg=White guibg=Black
endif

colorscheme molokai
" colorscheme edge
" colorscheme wal
set background=dark
" 24 bit / truecolor support needed
if has("termguicolors")
  set tgc
endif

nnoremap <leader>sm :set tgc<cr>:colorscheme molokai<cr>
nnoremap <leader>sw :set notgc<cr>:colorscheme wal<cr>

if has("gui_running")
  set guifont=MesloLGS\ Nerd\ Font\ 10
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" set encoding=utf-8  " utf8 encoding
" set fileencodings=  " automatikus filefelismeres
set shiftwidth=2  " 2 space az autoindentnel
set showmatch     " zaro zarojelhez megmutatja a parjat
set nostartofline " ugrasoknal ne menjen a sor elejere
set breakindent   " breaked lines use the same indent level as the original

set foldenable " folding bekapcsolasa
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent
nnoremap <Backspace> za

set autoindent    " always set autoindenting on
set si            " smartindent
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

set nobackup      " keep no backup file

set history=50    " keep 50 lines of command line history
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set ignorecase    " ignore case
set smartcase     " smart case
" set gdefault      " default s///g
" clear hilites with leader+space
nnoremap <leader><space> :noh<cr>

set ls=2          " enable the status

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
set completeopt=menu " don't need python docstrings
set clipboard=unnamed " use the system clipboard
set title
set autoread " auto read file if changed

" ctrlp ignore
set wildignore+=*/tmp/*,*/build/*,*/target/*,*.so,*.swp,*.zip
let g:ctrlp_working_path_mode = 'ra'
" let g:ctrlp_working_path_mode = 2
let g:ctrlp_map = '<F7>'
let g:ctrlp_cmd = 'CtrlPMixed'

" slime tmux
" let g:slime_target = "tmux"
" slimux
map <Leader>s :SlimuxREPLSendLine<CR>
vmap <Leader>s :SlimuxREPLSendSelection<CR>
map <Leader>a :SlimuxShellLast<CR>
map <C-c><C-c> :SlimuxREPLSendLine<CR>
vmap <C-c><C-c> :SlimuxREPLSendSelection<CR>

" par formatting
set formatprg=par

" backup/swap to ~/backup first
set backupdir=~/backup//,~/tmp//,/var/tmp//,/tmp//,.
set directory=~/backup/swap//,~/tmp//,/var/tmp//,/tmp//,.
set undofile
set undodir=~/backup/undo//,~/tmp//,/var/tmp//,/tmp//,.
" switch on backup
set bk

" cursor
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
au InsertEnter * set cul | set cuc
au InsertLeave * set nocul | set nocuc

" relative line numbering
" set number
" set relativenumber

" cursor movement for broken lines
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
noremap <silent> <expr> <DOWN> (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> <UP> (v:count == 0 ? 'gk' : 'k')

if has("gui_running")
  set nu
  " set lines=40
  " set columns=140
  set guioptions-=T
  set guioptions-=m
  set guioptions-=r
  " enable mouse
  set mouse=a
endif

" lightline
" 'colorscheme': 'powerlineish'
set showtabline=2
let g:lightline = {
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
  \     'gitbranch': 'fugitive#head',
  \   },
  \   'separator': {
  \     'left': '', 'right': ''
  \   },
  \   'subseparator': {
  \     'left': '', 'right': '' 
  \   }
  \ }

let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#unicode_symbols = 1

let g:ale_linters = { 'vue': ['eslint'] }
let g:ale_fixers = { 'javascript': ['eslint'] }

" Signify
let g:signify_vcs_list = [ 'git', 'hg' ]

" VCSCommand
let g:VCSCommandVCSTypePreference = ['git', 'hg']

" Ag
let g:ackprg = 'ag --nogroup --nocolor --column'

set noshowmode

" NERDTree
let g:NERDTreeIgnore=['\.swp$','\.pyc$','\.pyo$']

" Defx
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

" Defx - set appearance
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

" omnicomplete
" autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags

" xsh
augroup xsh
  au!
  autocmd BufNewFile,BufRead *.xsh   set filetype=python
augroup END

" md
augroup pandoc_syntax
  au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

let xml_use_xhtml = 1
let xml_tag_completion_map = "<C-l>"

" resize splits
au VimResized * exe "normal \<c-w>="

" filetypes
au BufNewFile,BufRead *.jspf set filetype=jsp

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " For all text files set 'textwidth' to 78 characters.
  " autocmd FileType text setlocal textwidth=0

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " session mentes
  autocmd VimLeavePre * mksession! ~/.vim.session

endif " has("autocmd")

" minibuf explorer
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" Source the vimrc file after saving it
" if has("autocmd")
"   autocmd bufwritepost .vimrc source $MYVIMRC
" endif

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

" don't switch to unlisted buffers
augroup qf
  autocmd!
  autocmd FileType qf set nobuflisted
augroup END

au FileType python setlocal tw=0 sw=4 ts=4 sta sts=4 ai et omnifunc=pythoncomplete#Complete
au FileType html,htmldjango setlocal tw=0 sw=2 ts=2 sta sts=2 ai et

" shortcuts
" HTML fold tag
nnoremap <leader>ft Vatzf
" short CSS attributes
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

" frissen beillesztett resz kijelolese
nnoremap <leader>v V`]

" #-os commentek ne menjenek a sor elejere
inoremap # X<C-H>#

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

" egyeb gombok
map <C-J> <C-W>j<downarrow>
map <C-K> <C-W>k<uparrow>
map <C-H> <C-W>h<leftarrow>
map <C-L> <C-W>l<rightarrow>

nnoremap <F5> :MundoToggle<CR>

" funkciogombok
map <F1> <Plug>TMiniBufExplorer
inoremap <F1> <ESC>
vnoremap <F1> <ESC>
" nmap <F2> :NERDTreeToggle<CR><C-W>l<C-W>j
" imap <F2> <ESC>:NERDTreeToggle<CR><C-W>l<C-W>ji
nmap <F2> :Defx<CR>
imap <F2> :Defx<CR>
nmap <F8> :set wrap!<CR>
nmap <F9> :TagbarToggle<CR>
nmap <F11> :set nu!<CR>:set relativenumber!<CR>
nmap <F12> :set list!<CR>:RainbowToggle<CR>
nmap <C-F12> :set cursorline!<CR>:set cursorcolumn!<CR>
nmap <F36> :set cursorline!<CR>:set cursorcolumn!<CR>

" buffer navigation
nmap <F3> :bp!<cr>
nmap <F4> :bn!<cr>
map <F3> :bp!<cr>
map <F4> :bn!<cr>
imap <F3> <ESC>:bp!<cr>a
imap <F4> <ESC>:bn!<cr>a

" neocomplete
" nnoremap <F6> :NeoCompleteToggle<CR>
" inoremap <F6> <ESC>:NeoCompleteToggle<CR>a

" panic button
nnoremap <C-F6> mzggg?G'z
inoremap <C-F6> <ESC>mzggg?G'z

" command-t / ctrl-p / fzf
" nnoremap <F7> :CtrlPMixed<cr>
" nnoremap <S-F7> :CtrlP<cr>
" nnoremap <C-F7> :CtrlPMRUFiles<cr>
" nnoremap <leader>p :CtrlPMixed<cr>

" unicode homoglyphs
let g:is_homoglyph_on = 0
nmap zu <plug>(HighlightHomoglyphs)

" fzf

" let g:fzf_layout = { 'down': '~40%' }
" let g:fzf_history_dir = '~/.local/share/fzf-history'
" let g:fzf_buffers_jump = 1
" nnoremap <F7> :FZF<cr>
" nnoremap ; :Buffers<CR>
" nnoremap <S-F7> :GFiles<cr>
" nnoremap <F19> :GFiles<cr>

" LeaderF
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_CommandMap = {'<C-K>': ['<Up>'], '<C-J>': ['<Down>']}
let g:Lf_StlSeparator = {'left': "\ue0b0", 'right': "\ue0b2"}
let g:Lf_HideHelp = 1
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

nnoremap <F7> :Leaderf file<cr>
nnoremap <S-F7> :Leaderf rg<cr>
nnoremap <C-F7> :Leaderf mru<cr>
nnoremap <F19> :Leaderf rg<cr>
nnoremap <F31> :Leaderf mru<cr>
nnoremap ; :Leaderf buffer<cr>

" screen hacks
map <esc>[1;5A <c-up>
map <esc>[1;5B <c-down>
map <esc>[1;5C <c-right>
map <esc>[1;5D <c-left>

map <c-left> <c-w><left>
map <c-right> <c-w><right>
map <c-up> <c-w><up>
map <c-down> <c-w><down>

" prezi w/ folds
map <M-Down> zmzjzo
map <M-Up> zmzkzo

" Dvorak Q => :
nnoremap Q :

" Capital commands
cab W! w!
cab Q! q!
cab Wq wq
cab Wa wa
cab wQ wq
cab WQ wq
cab W w
cab Q q

" Signify signs
let g:signify_sign_add               = '▌'
let g:signify_sign_delete            = '▌' " '▁'
let g:signify_sign_delete_first_line = '▌'
let g:signify_sign_change            = '▌'

" Sign colors
hi DiffAdd              guifg=#8ec02b guibg=#232526
hi DiffDelete           guifg=#f92672 guibg=#232526
hi DiffChange           guifg=#ffaf00 guibg=#232526

" Ale signs
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_sign_info = ''

" Ale colors
hi ALEErrorSign         guifg=#fb4934 guibg=#232526
hi ALEWarningSign       guifg=#fabd2f guibg=#232526
hi ALEInfoSign          guifg=#83a598 guibg=#232526

" FloaTerm
command! LG FloatermNew lazygit
command! FM FloatermNew vifm

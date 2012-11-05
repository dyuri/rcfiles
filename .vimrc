" Repa's vimrc
" Recommended plugins:
" taglist:    http://www.vim.org/scripts/script.php?script_id=273
" netrw:      http://www.vim.org/scripts/script.php?script_id=1075
" vimblog:    http://www.vim.org/scripts/script.php?script_id=2030
" snippets:   http://www.vim.org/scripts/script.php?script_id=1318
" vcscommand: http://www.vim.org/scripts/script.php?script_id=90 
" minbufexpl: http://www.vim.org/scripts/script.php?script_id=159
"          -> https://github.com/fholgado/minibufexpl.vim
" matchit:    http://www.vim.org/scripts/script.php?script_id=39
" VE:         http://www.vim.org/scripts/script.php?script_id=1950
" NERDtree:   http://www.vim.org/scripts/script.php?script_id=1658
" NERDcommenter: http://www.vim.org/scripts/script.php?script_id=1218
" CSApprox:   http://www.vim.org/scripts/script.php?script_id=2390
" slime:      http://technotales.wordpress.com/2008/10/17/screencast-like-slime-for-vim/
" pyflakes:   http://www.vim.org/scripts/script.php?script_id=2441
" # sparkup:    http://github.com/rstacruz/sparkup
" surround:   http://www.vim.org/scripts/script.php?script_id=1697
" project:    http://www.vim.org/scripts/script.php?script_id=69
" gundo:      http://sjl.bitbucket.org/gundo.vim/
" javascipt:  https://github.com/pangloss/vim-javascript
" syntastic
" command-t:  http://git.wincent.com/command-t.git

" pathogen
filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

" NERDTree tweeks
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1

" 88/256 colors for urxvt
set t_Co=256

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Szinek beallitasa
  hi Normal               guibg=black guifg=#90f0b0
  hi Normal               ctermfg=white ctermbg=black
  "hi Normal               guifg=white guibg=darkblue
  hi String               ctermfg=Green
  hi String               guifg=Green
  hi Number               ctermfg=LightGreen
  hi Number               guifg=LightGreen
  hi Boolean              ctermfg=LightGreen
  hi Boolean              guifg=LightGreen
  hi Float                ctermfg=LightGreen
  hi Float                guifg=LightGreen
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
  hi Search               guifg=lightgreen guibg=darkgreen
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
  hi Question             guifg=green gui=none
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
  hi LineNr               guibg=#080840 guifg=green gui=none
  hi DiffAdd              ctermbg=darkblue term=none cterm=none
  hi DiffAdd              guibg=darkblue gui=none
  hi DiffChange           ctermbg=magenta cterm=none
  hi DiffChange           guibg=magenta gui=none
  hi DiffDelete           ctermfg=blue ctermbg=cyan
  hi DiffDelete           guifg=blue guibg=cyan
  hi DiffText             cterm=bold ctermbg=red
  hi DiffText             gui=bold guibg=red
  hi Cursor               ctermfg=bg ctermbg=cyan
  hi Cursor               guifg=bg guibg=cyan
  hi lCursor              ctermfg=bg ctermbg=darkgreen
  hi lCursor              guifg=bg guibg=darkgreen
  hi Comment              ctermfg=brown cterm=none term=none
  hi Comment              guifg=blue gui=italic
  hi Constant             ctermfg=darkgreen
  hi Constant             guifg=green
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
  hi User3                guibg=#080848 guifg=green
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
  hi CtrlPMode2           guibg=#080848 guifg=green
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

" colors via CSApprox
if !has("gui_running")
  colorscheme repa
endif

if has("gui_running")
  set guifont=Inconsolata-g\ 10
  let g:Powerline_symbols = 'fancy'
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" set encoding=utf-8  " utf8 encoding
" set fileencodings=  " automatikus filefelismeres
set shiftwidth=2  " 2 space az autoindentnel
set showmatch     " zaro zarojelhez megmutatja a parjat
set nostartofline " ugrasoknal ne menjen a sor elejere

set foldmethod=marker " folding bekapcsolasa

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
set ch=2
set tabstop=2
set softtabstop=2
set smarttab
set textwidth=0
set so=5          " 5 lines of scope
set vb            " visual bell
set lz            " lazy redraw
set completeopt=menu " don't need python docstrings
set clipboard=unnamed " use the system clipboard
set title
set autoread " auto read file if changed
let mapleader = "," " map leader to ,

" ctrlp ignore
set wildignore+=*/tmp/*,*/build/*,*/target/*,*.so,*.swp,*.zip
" let g:ctrlp_working_path_mode = 'rc'
let g:ctrlp_working_path_mode = 2

" par formatting
set formatprg=par

" backup/swap to ~/backup first
set backupdir=~/backup//,~/tmp//,/var/tmp//,/tmp//,.
set directory=~/backup/swap//,~/tmp//,/var/tmp//,/tmp//,.
set undofile
set undodir=~/backup/undo//,~/tmp//,/var/tmp//,/tmp//,.
" switch on backup
set bk

if has("gui_running")
  set nu
  " set lines=40
  " set columns=140
  set guioptions-=T
  set guioptions-=m
  set guioptions-=r
  " enable mouse
  set mouse=a
  " cursor
  set cursorline
  set cursorcolumn
endif

" NERDTree
let g:NERDTreeIgnore=['\.swp$','\.pyc$','\.pyo$']

" omnicomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags

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
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

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

" python
function! RePa_py()
  setlocal tw=0 sw=4 ts=4 sta et sts=4 ai
  
  " color column #79
  hi clear ColorColumn
  hi link ColorColumn User1
  set colorcolumn=79

  hi OverLength guibg=#BB4040 ctermbg=darkred ctermfg=white
  match OverLength /\%80v.\+/
endfunction

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

nnoremap <F5> :GundoToggle<CR>

" funkciogombok
map <F1> <Plug>TMiniBufExplorer
inoremap <F1> <ESC>
vnoremap <F1> <ESC>
nmap <F2> :NERDTreeToggle<CR><C-W>l<C-W>j
imap <F2> <ESC>:NERDTreeToggle<CR><C-W>l<C-W>ji
nmap <F8> :set wrap!<CR>
nmap <F9> :Tlist<CR>
nmap <F11> :set nu!<CR>
nmap <F12> :set list!<CR>

" buffer navigation
nmap <F3> :bp!<cr>
nmap <F4> :bn!<cr>
map <F3> :bp!<cr>
map <F4> :bn!<cr>
imap <F3> <ESC>:bp!<cr>i
imap <F4> <ESC>:bn!<cr>i

" panic button
nnoremap <F6> mzggg?G'z

" command-t
" nnoremap <F7> :CommandT<cr>
" nnoremap <S-F7> :CommandTBuffer<cr>
nnoremap <F7> :CtrlPMixed<cr>
nnoremap <S-F7> :CtrlP<cr>
nnoremap <C-F7> :CtrlPMRUFiles<cr>

" tab navigation like firefox
nmap <C-F3> :tabprevious<cr>
nmap <C-F4> :tabnext<cr>
map <C-F3> :tabprevious<cr>
map <C-F4> :tabnext<cr>
imap <C-F3> <ESC>:tabprevious<cr>i
imap <C-F4> <ESC>:tabnext<cr>i
nmap <C-t> :tabnew<cr>
imap <C-t> <ESC>:tabnew<cr>

" setting the status line

function! RePa_sl_lines()
  if &nu == 0
    return ''
  else
    let b:lastline = line('$')
    "if b:lastline < 10
      "return '[     '.b:lastline.'] '
    "elseif b:lastline < 100
      "return '[    '.b:lastline.'] '
    "elseif b:lastline < 1000
      "return '[   '.b:lastline.'] '
    "elseif b:lastline < 10000
      "return '[  '.b:lastline.'] '
    "elseif b:lastline < 100000
      "return '[ '.b:lastline.'] '
    "elseif b:lastline < 1000000
      "return '['.b:lastline.'] '
    "else
      "return b:lastline.' '
    "endif
    return b:lastline.' '
  endif
endfunction

function! RePa_sl_filestate()
  let state = ""
  
  if &buftype == "help"
    return 'H'
  elseif &buftype == "nowrite"
    return '-'
  elseif &modified != 0
    return '*'
  else
    return ' '
  endif
endfunction

function! RePa_sl_fileformat()
  if &fileformat == ""
    return "--"
  else
    return &fileformat
  endif
endfunction

function! RePa_sl_fileencoding()
  if &fileencoding == ""
    if &encoding != ""
      return &encoding
    else
      return "--"
    endif
  else
    return &fileencoding
  endif
endfunction

function! RePa_sl_filetype()
  if &filetype == ""
    return "--"
  else
    return &filetype
  endif
endfunction

function! RePa_sl_expandtabON()
  if &expandtab == 0
    return ""
  else
    return "notab"
  endif
endfunction

function! RePa_sl_expandtabOFF()
  if &expandtab == 0
    return "notab"
  else
    return ""
  endif
endfunction

function! RePa_sl_ignorecaseON()
  if &ignorecase == 0
    return ""
  else
    return "ic"
  endif
endfunction

function! RePa_sl_ignorecaseOFF()
  if &ignorecase == 0
    return "ic"
  else
    return ""
  endif
endfunction

function! RePa_sl_mode()
  return mode()
endfunction

function! RePa_statusline()

  let sl = ""
  
  " lines
  let sl = sl . '%2*%{RePa_sl_lines()}'
  " mode
  let sl = sl . '%2*[%3*%{RePa_sl_mode()}%2*]'
  " filename
  let sl = sl . '%1*\ %f'
  " filestate
  let sl = sl . '%3*%{RePa_sl_filestate()}%{SyntasticStatuslineFlag()}\ '
  " break
  let sl = sl . '%<'
  " working directory
  let sl = sl . '%2*(%1*%{getcwd()}%2*)\ '
  " fileformat
  let sl = sl . '%2*[%{RePa_sl_fileformat()}:'
  " encoding
  let sl = sl . '%{RePa_sl_fileencoding()}:'
  " filetype
  let sl = sl . '%{RePa_sl_filetype()}]'

  " justify to right
  let sl = sl . '\ %='

  " expand tab
  let sl = sl . '%3*%{RePa_sl_expandtabON()}'
  let sl = sl . '%4*%{RePa_sl_expandtabOFF()}'
  
  " ignorecase
  let sl = sl . '%3*\|%{RePa_sl_ignorecaseON()}'
  let sl = sl . '%4*%{RePa_sl_ignorecaseOFF()}'
  
  " position, line and column, percentage
  let sl = sl . '%2*\ %05(%l%),%03(%v%)%2*\ %P'
  
  return sl
  
endfunction

" set the statusline
" execute "set statusline=" . RePa_statusline()

" taglist
let Tlist_Inc_Winwidth=0

" screen hacks
map <esc>[1;5A <c-up>
map <esc>[1;5B <c-down>
map <esc>[1;5C <c-right>
map <esc>[1;5D <c-left>


" Repa's vimrc
" Recommended plugins:
" netrw:      http://www.vim.org/scripts/script.php?script_id=1075
" vimblog:    http://www.vim.org/scripts/script.php?script_id=2030
" snippets:   http://www.vim.org/scripts/script.php?script_id=1318
" vcscommand: http://www.vim.org/scripts/script.php?script_id=90 
" - minbufexpl: http://www.vim.org/scripts/script.php?script_id=159 " removed in favor of airline#tabline
"          -> https://github.com/fholgado/minibufexpl.vim
" matchit:    http://www.vim.org/scripts/script.php?script_id=39
" VE:         http://www.vim.org/scripts/script.php?script_id=1950
" NERDtree:   http://www.vim.org/scripts/script.php?script_id=1658
" NERDcommenter: http://www.vim.org/scripts/script.php?script_id=1218
" CSApprox:   http://www.vim.org/scripts/script.php?script_id=2390
" slime:      http://technotales.wordpress.com/2008/10/17/screencast-like-slime-for-vim/
"             https://github.com/jpalardy/vim-slime
" removed in favor of python-mode pyflakes:   http://www.vim.org/scripts/script.php?script_id=2441
" # sparkup:    http://github.com/rstacruz/sparkup
" surround:   http://www.vim.org/scripts/script.php?script_id=1697
" project:    http://www.vim.org/scripts/script.php?script_id=69
" gundo:      http://sjl.bitbucket.org/gundo.vim/
" javascipt:  https://github.com/pangloss/vim-javascript
" syntastic
" - command-t:  http://git.wincent.com/command-t.git -> ctrlp
" python-mode: https://github.com/klen/python-mode
" jedi-vim: https://github.com/davidhalter/jedi-vim
" tagbar: https://github.com/majutsushi/tagbar
" - doctorjs: https://github.com/mozilla/doctorjs
" unimpaierd: https://github.com/tpope/vim-unimpaired
" vim-visual-star-search [github]
" airline: https://github.com/bling/vim-airline
" signify: https://github.com/mhinz/vim-signify
" startify: https://github.com/mhinz/vim-startify
" lawrencium: https://bitbucket.org/ludovicchabant/vim-lawrencium
" fugitive: https://github.com/tpope/vim-fugitive

" pathogen
filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

" NERDTree tweeks
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1

" jsbeautifier
let g:jsbeautify = {'indent_size': 2, 'indent_char': ' '}
let g:htmlbeautify = {'indent_size': 2, 'indent_char': ' ', 'brace_style': 'expand', 'unformatted': ['a', 'sub', 'sup', 'b', 'i', 'u', 'em', 'cite', 'strong']}
let g:cssbeautify = {'indent_size': 2, 'indent_char': ' '}
let g:jsbeautify_engine = 'node'

" syntastic - disable python (python-mode)
let g:syntastic_mode_map = { 'mode': 'active',
        \ 'active_filetypes': [],
        \ 'passive_filetypes': ['python'] }

" python-mode, jedi
let g:jedi#show_function_definition = 1
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#auto_vim_configuration = 0

" neocopmlete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#enable_auto_select = 1

inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplete#close_popup()
inoremap <expr><C-e> neocomplete#cancel_popup()

" html output
let html_use_css = 1

map <c-f> :call JsBeautify()<cr>

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

" colors via CSApprox
if !has("gui_running")
  colorscheme repa
endif

if has("gui_running")
  set guifont=Meslo\ LG\ S\ for\ Powerline\ 10
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
set mouse=a
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

" Powerline - replaced by airline
" let g:Powerline_symbols = 'fancy'
" python from powerline.vim import setup as powerline_setup
" python powerline_setup()
" python del powerline_setup

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'powerlineish'
let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#use_vcscommand = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#eclim#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#tabline#enabled = 1

" Signify
let g:signify_vcs_list = [ 'git', 'hg' ]

" Ag
let g:ackprg = 'ag --nogroup --nocolor --column'

set noshowmode

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
nmap <F9> :TagbarToggle<CR>
nmap <F11> :set nu!<CR>
nmap <F12> :set list!<CR>

" buffer navigation
nmap <F3> :bp!<cr>
nmap <F4> :bn!<cr>
map <F3> :bp!<cr>
map <F4> :bn!<cr>
imap <F3> <ESC>:bp!<cr>a
imap <F4> <ESC>:bn!<cr>a

" neocomplete
nnoremap <F6> :NeoCompleteToggle<CR>
inoremap <F6> <ESC>:NeoCompleteToggle<CR>a

" panic button
nnoremap <C-F6> mzggg?G'z
inoremap <C-F6> <ESC>mzggg?G'z

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

" screen hacks
map <esc>[1;5A <c-up>
map <esc>[1;5B <c-down>
map <esc>[1;5C <c-right>
map <esc>[1;5D <c-left>

" prezi w/ folds
map <M-Down> zmzjzo
map <M-Up> zmzkzo

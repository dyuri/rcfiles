" This scheme was created by CSApproxSnapshot
" on Thu, 17 May 2012

hi clear
if exists("syntax_on")
    syntax reset
endif

if v:version < 700
    let g:colors_name = expand("<sfile>:t:r")
    command! -nargs=+ CSAHi exe "hi" substitute(substitute(<q-args>, "undercurl", "underline", "g"), "guisp\\S\\+", "", "g")
else
    let g:colors_name = expand("<sfile>:t:r")
    command! -nargs=+ CSAHi exe "hi" <q-args>
endif

if 0
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_konsole") && g:CSApprox_konsole) || &term =~? "^konsole"
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=157 gui=NONE guibg=#000000 guifg=#90f0b0
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=#ffff00
    CSAHi Repeat term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=#ff0000
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=21 gui=NONE guibg=#ffff00 guifg=#0000ff
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=147 gui=NONE guibg=bg guifg=#80a0ff
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=217 gui=NONE guibg=bg guifg=#ffa0a0
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=214 gui=NONE guibg=bg guifg=#ffa500
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=87 gui=NONE guibg=bg guifg=#40ffff
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=228 gui=bold guibg=bg guifg=#ffff60
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=219 gui=NONE guibg=bg guifg=#ff80ff
    CSAHi type term=underline cterm=bold ctermbg=bg ctermfg=120 gui=bold guibg=bg guifg=#60ff60
    CSAHi CtrlPStatus term=NONE cterm=NONE ctermbg=17 ctermfg=51 gui=NONE guibg=#080848 guifg=#00ffff
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=#ff0000 guifg=#ffffff
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=#008b8b
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=225 gui=bold guibg=bg guifg=#ffbbff
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=51 gui=NONE guibg=bg guifg=#00ffff
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=#ff0000 guifg=#ffffff
    CSAHi IncSearch term=underline cterm=bold ctermbg=16 ctermfg=184 gui=reverse,bold guibg=#bbbb00 guifg=#000000
    CSAHi Search term=reverse cterm=NONE ctermbg=28 ctermfg=157 gui=NONE guibg=#006400 guifg=#90ee90
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=28 gui=bold guibg=bg guifg=#006400
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=226 gui=bold guibg=bg guifg=#ffff00
    CSAHi LineNr term=underline cterm=NONE ctermbg=17 ctermfg=46 gui=NONE guibg=#080840 guifg=#00ff00
    CSAHi CtrlPMode2 term=NONE cterm=NONE ctermbg=17 ctermfg=46 gui=NONE guibg=#080848 guifg=#00ff00
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=#ff00ff
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=51 gui=undercurl guibg=bg guifg=fg guisp=#00ffff
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=187 ctermfg=16 gui=NONE guibg=#c4c090 guifg=#000000
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=220 ctermfg=16 gui=NONE guibg=#ffbf00 guifg=#000000
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=252 ctermfg=16 gui=NONE guibg=#d3d3d3 guifg=#000000
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=#ffffff guifg=#000000
    CSAHi TabLine term=underline cterm=NONE ctermbg=145 ctermfg=16 gui=NONE guibg=#a4a090 guifg=#000000
    CSAHi TabLineSel term=bold cterm=bold ctermbg=16 ctermfg=231 gui=bold guibg=#000000 guifg=#ffffff
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=145 ctermfg=16 gui=NONE guibg=#a4a090 guifg=#000000
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#041008 guifg=fg
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=147 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=#000000
    CSAHi User1 term=NONE cterm=NONE ctermbg=17 ctermfg=51 gui=NONE guibg=#080848 guifg=#00ffff
    CSAHi User2 term=NONE cterm=NONE ctermbg=17 ctermfg=231 gui=NONE guibg=#080848 guifg=#ffffff
    CSAHi User3 term=NONE cterm=NONE ctermbg=17 ctermfg=46 gui=NONE guibg=#080848 guifg=#00ff00
    CSAHi User4 term=NONE cterm=NONE ctermbg=17 ctermfg=60 gui=NONE guibg=#080848 guifg=#202050
    CSAHi CtrlPMode1 term=NONE cterm=NONE ctermbg=17 ctermfg=226 gui=NONE guibg=#080848 guifg=#ffff00
    CSAHi CursorLineNr term=bold cterm=bold ctermbg=bg ctermfg=226 gui=bold guibg=bg guifg=#ffff00
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=#00ff00
    CSAHi StatusLine term=NONE cterm=NONE ctermbg=17 ctermfg=231 gui=NONE guibg=#080848 guifg=#ffffff
    CSAHi StatusLineNC term=NONE cterm=NONE ctermbg=17 ctermfg=250 gui=NONE guibg=#080848 guifg=#bebebe
    CSAHi VertSplit term=NONE cterm=NONE ctermbg=250 ctermfg=16 gui=NONE guibg=#bebebe guifg=#000000
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=201 gui=bold guibg=bg guifg=#ff00ff
    CSAHi Visual term=reverse cterm=NONE ctermbg=143 ctermfg=19 gui=NONE guibg=#a0b020 guifg=#00008b
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=#ff0000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=16 ctermfg=226 gui=NONE guibg=#000000 guifg=#ffff00
    CSAHi CursorLine term=underline cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#041008 guifg=fg
    CSAHi ColorColumn term=reverse cterm=NONE ctermbg=124 ctermfg=fg gui=NONE guibg=#8b0000 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=51 ctermfg=16 gui=NONE guibg=#00ffff guifg=#000000
    CSAHi lCursor term=NONE cterm=NONE ctermbg=28 ctermfg=16 gui=NONE guibg=#006400 guifg=#000000
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=28 ctermfg=226 gui=NONE guibg=#006400 guifg=#ffff00
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=#00ff00
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=157 gui=NONE guibg=bg guifg=#90ee90
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=157 gui=NONE guibg=bg guifg=#90ee90
    CSAHi Float term=NONE cterm=NONE ctermbg=bg ctermfg=157 gui=NONE guibg=bg guifg=#90ee90
    CSAHi Folded term=bold cterm=bold ctermbg=16 ctermfg=248 gui=bold guibg=#000000 guifg=#a9a9a9
    CSAHi FoldColumn term=bold cterm=bold ctermbg=16 ctermfg=248 gui=bold guibg=#000000 guifg=#a9a9a9
    CSAHi DiffAdd term=NONE cterm=NONE ctermbg=19 ctermfg=fg gui=NONE guibg=#00008b guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=201 ctermfg=fg gui=NONE guibg=#ff00ff guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=51 ctermfg=21 gui=bold guibg=#00ffff guifg=#0000ff
    CSAHi DiffText term=reverse cterm=bold ctermbg=196 ctermfg=fg gui=bold guibg=#ff0000 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=51 gui=NONE guibg=#bebebe guifg=#00ffff
    CSAHi Conceal term=NONE cterm=NONE ctermbg=248 ctermfg=252 gui=NONE guibg=#a9a9a9 guifg=#d3d3d3
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=#ff0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=#0000ff
elseif has("gui_running") || (&t_Co == 256 && (&term ==# "xterm" || &term =~# "^screen") && exists("g:CSApprox_eterm") && g:CSApprox_eterm) || &term =~? "^eterm"
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=158 gui=NONE guibg=#000000 guifg=#90f0b0
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=#ffff00
    CSAHi Repeat term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=#ff0000
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=21 gui=NONE guibg=#ffff00 guifg=#0000ff
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=153 gui=NONE guibg=bg guifg=#80a0ff
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=224 gui=NONE guibg=bg guifg=#ffa0a0
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=220 gui=NONE guibg=bg guifg=#ffa500
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=123 gui=NONE guibg=bg guifg=#40ffff
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=228 gui=bold guibg=bg guifg=#ffff60
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=219 gui=NONE guibg=bg guifg=#ff80ff
    CSAHi type term=underline cterm=bold ctermbg=bg ctermfg=120 gui=bold guibg=bg guifg=#60ff60
    CSAHi CtrlPStatus term=NONE cterm=NONE ctermbg=18 ctermfg=51 gui=NONE guibg=#080848 guifg=#00ffff
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=#ff0000 guifg=#ffffff
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=37 gui=NONE guibg=bg guifg=#008b8b
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=225 gui=bold guibg=bg guifg=#ffbbff
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=51 gui=NONE guibg=bg guifg=#00ffff
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=255 gui=NONE guibg=#ff0000 guifg=#ffffff
    CSAHi IncSearch term=underline cterm=bold ctermbg=16 ctermfg=184 gui=reverse,bold guibg=#bbbb00 guifg=#000000
    CSAHi Search term=reverse cterm=NONE ctermbg=28 ctermfg=157 gui=NONE guibg=#006400 guifg=#90ee90
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=28 gui=bold guibg=bg guifg=#006400
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=226 gui=bold guibg=bg guifg=#ffff00
    CSAHi LineNr term=underline cterm=NONE ctermbg=18 ctermfg=46 gui=NONE guibg=#080840 guifg=#00ff00
    CSAHi CtrlPMode2 term=NONE cterm=NONE ctermbg=18 ctermfg=46 gui=NONE guibg=#080848 guifg=#00ff00
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=#ff00ff
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=51 gui=undercurl guibg=bg guifg=fg guisp=#00ffff
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=229 ctermfg=16 gui=NONE guibg=#c4c090 guifg=#000000
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=220 ctermfg=16 gui=NONE guibg=#ffbf00 guifg=#000000
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=#d3d3d3 guifg=#000000
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=255 ctermfg=16 gui=NONE guibg=#ffffff guifg=#000000
    CSAHi TabLine term=underline cterm=NONE ctermbg=187 ctermfg=16 gui=NONE guibg=#a4a090 guifg=#000000
    CSAHi TabLineSel term=bold cterm=bold ctermbg=16 ctermfg=255 gui=bold guibg=#000000 guifg=#ffffff
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=187 ctermfg=16 gui=NONE guibg=#a4a090 guifg=#000000
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#041008 guifg=fg
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=153 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=#000000
    CSAHi User1 term=NONE cterm=NONE ctermbg=18 ctermfg=51 gui=NONE guibg=#080848 guifg=#00ffff
    CSAHi User2 term=NONE cterm=NONE ctermbg=18 ctermfg=255 gui=NONE guibg=#080848 guifg=#ffffff
    CSAHi User3 term=NONE cterm=NONE ctermbg=18 ctermfg=46 gui=NONE guibg=#080848 guifg=#00ff00
    CSAHi User4 term=NONE cterm=NONE ctermbg=18 ctermfg=60 gui=NONE guibg=#080848 guifg=#202050
    CSAHi CtrlPMode1 term=NONE cterm=NONE ctermbg=18 ctermfg=226 gui=NONE guibg=#080848 guifg=#ffff00
    CSAHi CursorLineNr term=bold cterm=bold ctermbg=bg ctermfg=226 gui=bold guibg=bg guifg=#ffff00
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=#00ff00
    CSAHi StatusLine term=NONE cterm=NONE ctermbg=18 ctermfg=255 gui=NONE guibg=#080848 guifg=#ffffff
    CSAHi StatusLineNC term=NONE cterm=NONE ctermbg=18 ctermfg=250 gui=NONE guibg=#080848 guifg=#bebebe
    CSAHi VertSplit term=NONE cterm=NONE ctermbg=250 ctermfg=16 gui=NONE guibg=#bebebe guifg=#000000
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=201 gui=bold guibg=bg guifg=#ff00ff
    CSAHi Visual term=reverse cterm=NONE ctermbg=185 ctermfg=19 gui=NONE guibg=#a0b020 guifg=#00008b
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=#ff0000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=16 ctermfg=226 gui=NONE guibg=#000000 guifg=#ffff00
    CSAHi CursorLine term=underline cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#041008 guifg=fg
    CSAHi ColorColumn term=reverse cterm=NONE ctermbg=124 ctermfg=fg gui=NONE guibg=#8b0000 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=51 ctermfg=16 gui=NONE guibg=#00ffff guifg=#000000
    CSAHi lCursor term=NONE cterm=NONE ctermbg=28 ctermfg=16 gui=NONE guibg=#006400 guifg=#000000
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=28 ctermfg=226 gui=NONE guibg=#006400 guifg=#ffff00
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=#00ff00
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=157 gui=NONE guibg=bg guifg=#90ee90
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=157 gui=NONE guibg=bg guifg=#90ee90
    CSAHi Float term=NONE cterm=NONE ctermbg=bg ctermfg=157 gui=NONE guibg=bg guifg=#90ee90
    CSAHi Folded term=bold cterm=bold ctermbg=16 ctermfg=248 gui=bold guibg=#000000 guifg=#a9a9a9
    CSAHi FoldColumn term=bold cterm=bold ctermbg=16 ctermfg=248 gui=bold guibg=#000000 guifg=#a9a9a9
    CSAHi DiffAdd term=NONE cterm=NONE ctermbg=19 ctermfg=fg gui=NONE guibg=#00008b guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=201 ctermfg=fg gui=NONE guibg=#ff00ff guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=51 ctermfg=21 gui=bold guibg=#00ffff guifg=#0000ff
    CSAHi DiffText term=reverse cterm=bold ctermbg=196 ctermfg=fg gui=bold guibg=#ff0000 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=51 gui=NONE guibg=#bebebe guifg=#00ffff
    CSAHi Conceal term=NONE cterm=NONE ctermbg=248 ctermfg=231 gui=NONE guibg=#a9a9a9 guifg=#d3d3d3
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=#ff0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=#0000ff
elseif has("gui_running") || &t_Co == 256
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=121 gui=NONE guibg=#000000 guifg=#90f0b0
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=NONE guibg=bg guifg=#ffff00
    CSAHi Repeat term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=#ff0000
    CSAHi Todo term=NONE cterm=NONE ctermbg=226 ctermfg=21 gui=NONE guibg=#ffff00 guifg=#0000ff
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=111 gui=NONE guibg=bg guifg=#80a0ff
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=217 gui=NONE guibg=bg guifg=#ffa0a0
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=214 gui=NONE guibg=bg guifg=#ffa500
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=87 gui=NONE guibg=bg guifg=#40ffff
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=227 gui=bold guibg=bg guifg=#ffff60
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=213 gui=NONE guibg=bg guifg=#ff80ff
    CSAHi type term=underline cterm=bold ctermbg=bg ctermfg=83 gui=bold guibg=bg guifg=#60ff60
    CSAHi CtrlPStatus term=NONE cterm=NONE ctermbg=17 ctermfg=51 gui=NONE guibg=#080848 guifg=#00ffff
    CSAHi Error term=reverse cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=#ff0000 guifg=#ffffff
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=30 gui=NONE guibg=bg guifg=#008b8b
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=219 gui=bold guibg=bg guifg=#ffbbff
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=51 gui=NONE guibg=bg guifg=#00ffff
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=196 ctermfg=231 gui=NONE guibg=#ff0000 guifg=#ffffff
    CSAHi IncSearch term=underline cterm=bold ctermbg=16 ctermfg=142 gui=reverse,bold guibg=#bbbb00 guifg=#000000
    CSAHi Search term=reverse cterm=NONE ctermbg=22 ctermfg=120 gui=NONE guibg=#006400 guifg=#90ee90
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=22 gui=bold guibg=bg guifg=#006400
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=226 gui=bold guibg=bg guifg=#ffff00
    CSAHi LineNr term=underline cterm=NONE ctermbg=17 ctermfg=46 gui=NONE guibg=#080840 guifg=#00ff00
    CSAHi CtrlPMode2 term=NONE cterm=NONE ctermbg=17 ctermfg=46 gui=NONE guibg=#080848 guifg=#00ff00
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=undercurl guibg=bg guifg=fg guisp=#ff00ff
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=51 gui=undercurl guibg=bg guifg=fg guisp=#00ffff
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=180 ctermfg=16 gui=NONE guibg=#c4c090 guifg=#000000
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=214 ctermfg=16 gui=NONE guibg=#ffbf00 guifg=#000000
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=252 ctermfg=16 gui=NONE guibg=#d3d3d3 guifg=#000000
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=231 ctermfg=16 gui=NONE guibg=#ffffff guifg=#000000
    CSAHi TabLine term=underline cterm=NONE ctermbg=144 ctermfg=16 gui=NONE guibg=#a4a090 guifg=#000000
    CSAHi TabLineSel term=bold cterm=bold ctermbg=16 ctermfg=231 gui=bold guibg=#000000 guifg=#ffffff
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=144 ctermfg=16 gui=NONE guibg=#a4a090 guifg=#000000
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#041008 guifg=fg
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=111 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=#000000
    CSAHi User1 term=NONE cterm=NONE ctermbg=17 ctermfg=51 gui=NONE guibg=#080848 guifg=#00ffff
    CSAHi User2 term=NONE cterm=NONE ctermbg=17 ctermfg=231 gui=NONE guibg=#080848 guifg=#ffffff
    CSAHi User3 term=NONE cterm=NONE ctermbg=17 ctermfg=46 gui=NONE guibg=#080848 guifg=#00ff00
    CSAHi User4 term=NONE cterm=NONE ctermbg=17 ctermfg=17 gui=NONE guibg=#080848 guifg=#202050
    CSAHi CtrlPMode1 term=NONE cterm=NONE ctermbg=17 ctermfg=226 gui=NONE guibg=#080848 guifg=#ffff00
    CSAHi CursorLineNr term=bold cterm=bold ctermbg=bg ctermfg=226 gui=bold guibg=bg guifg=#ffff00
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=#00ff00
    CSAHi StatusLine term=NONE cterm=NONE ctermbg=17 ctermfg=231 gui=NONE guibg=#080848 guifg=#ffffff
    CSAHi StatusLineNC term=NONE cterm=NONE ctermbg=17 ctermfg=250 gui=NONE guibg=#080848 guifg=#bebebe
    CSAHi VertSplit term=NONE cterm=NONE ctermbg=250 ctermfg=16 gui=NONE guibg=#bebebe guifg=#000000
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=201 gui=bold guibg=bg guifg=#ff00ff
    CSAHi Visual term=reverse cterm=NONE ctermbg=142 ctermfg=18 gui=NONE guibg=#a0b020 guifg=#00008b
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=196 gui=NONE guibg=bg guifg=#ff0000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=16 ctermfg=226 gui=NONE guibg=#000000 guifg=#ffff00
    CSAHi CursorLine term=underline cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#041008 guifg=fg
    CSAHi ColorColumn term=reverse cterm=NONE ctermbg=88 ctermfg=fg gui=NONE guibg=#8b0000 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=51 ctermfg=16 gui=NONE guibg=#00ffff guifg=#000000
    CSAHi lCursor term=NONE cterm=NONE ctermbg=22 ctermfg=16 gui=NONE guibg=#006400 guifg=#000000
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=22 ctermfg=226 gui=NONE guibg=#006400 guifg=#ffff00
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=46 gui=NONE guibg=bg guifg=#00ff00
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=120 gui=NONE guibg=bg guifg=#90ee90
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=120 gui=NONE guibg=bg guifg=#90ee90
    CSAHi Float term=NONE cterm=NONE ctermbg=bg ctermfg=120 gui=NONE guibg=bg guifg=#90ee90
    CSAHi Folded term=bold cterm=bold ctermbg=16 ctermfg=248 gui=bold guibg=#000000 guifg=#a9a9a9
    CSAHi FoldColumn term=bold cterm=bold ctermbg=16 ctermfg=248 gui=bold guibg=#000000 guifg=#a9a9a9
    CSAHi DiffAdd term=NONE cterm=NONE ctermbg=18 ctermfg=fg gui=NONE guibg=#00008b guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=201 ctermfg=fg gui=NONE guibg=#ff00ff guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=51 ctermfg=21 gui=bold guibg=#00ffff guifg=#0000ff
    CSAHi DiffText term=reverse cterm=bold ctermbg=196 ctermfg=fg gui=bold guibg=#ff0000 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=250 ctermfg=51 gui=NONE guibg=#bebebe guifg=#00ffff
    CSAHi Conceal term=NONE cterm=NONE ctermbg=248 ctermfg=252 gui=NONE guibg=#a9a9a9 guifg=#d3d3d3
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=undercurl guibg=bg guifg=fg guisp=#ff0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=undercurl guibg=bg guifg=fg guisp=#0000ff
elseif has("gui_running") || &t_Co == 88
    CSAHi Normal term=NONE cterm=NONE ctermbg=16 ctermfg=46 gui=NONE guibg=#000000 guifg=#90f0b0
    CSAHi Operator term=NONE cterm=NONE ctermbg=bg ctermfg=76 gui=NONE guibg=bg guifg=#ffff00
    CSAHi Repeat term=NONE cterm=NONE ctermbg=bg ctermfg=64 gui=NONE guibg=bg guifg=#ff0000
    CSAHi Todo term=NONE cterm=NONE ctermbg=76 ctermfg=19 gui=NONE guibg=#ffff00 guifg=#0000ff
    CSAHi Comment term=bold cterm=NONE ctermbg=bg ctermfg=39 gui=NONE guibg=bg guifg=#80a0ff
    CSAHi Constant term=underline cterm=NONE ctermbg=bg ctermfg=69 gui=NONE guibg=bg guifg=#ffa0a0
    CSAHi Special term=bold cterm=NONE ctermbg=bg ctermfg=68 gui=NONE guibg=bg guifg=#ffa500
    CSAHi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=31 gui=NONE guibg=bg guifg=#40ffff
    CSAHi Statement term=bold cterm=bold ctermbg=bg ctermfg=77 gui=bold guibg=bg guifg=#ffff60
    CSAHi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=71 gui=NONE guibg=bg guifg=#ff80ff
    CSAHi type term=underline cterm=bold ctermbg=bg ctermfg=45 gui=bold guibg=bg guifg=#60ff60
    CSAHi CtrlPStatus term=NONE cterm=NONE ctermbg=17 ctermfg=31 gui=NONE guibg=#080848 guifg=#00ffff
    CSAHi Error term=reverse cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=#ff0000 guifg=#ffffff
    CSAHi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=21 gui=NONE guibg=bg guifg=#008b8b
    CSAHi NonText term=bold cterm=bold ctermbg=bg ctermfg=75 gui=bold guibg=bg guifg=#ffbbff
    CSAHi Directory term=bold cterm=NONE ctermbg=bg ctermfg=31 gui=NONE guibg=bg guifg=#00ffff
    CSAHi ErrorMsg term=NONE cterm=NONE ctermbg=64 ctermfg=79 gui=NONE guibg=#ff0000 guifg=#ffffff
    CSAHi IncSearch term=underline cterm=bold ctermbg=16 ctermfg=56 gui=reverse,bold guibg=#bbbb00 guifg=#000000
    CSAHi Search term=reverse cterm=NONE ctermbg=20 ctermfg=45 gui=NONE guibg=#006400 guifg=#90ee90
    CSAHi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=20 gui=bold guibg=bg guifg=#006400
    CSAHi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=76 gui=bold guibg=bg guifg=#ffff00
    CSAHi LineNr term=underline cterm=NONE ctermbg=16 ctermfg=28 gui=NONE guibg=#080840 guifg=#00ff00
    CSAHi CtrlPMode2 term=NONE cterm=NONE ctermbg=17 ctermfg=28 gui=NONE guibg=#080848 guifg=#00ff00
    CSAHi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=67 gui=undercurl guibg=bg guifg=fg guisp=#ff00ff
    CSAHi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=31 gui=undercurl guibg=bg guifg=fg guisp=#00ffff
    CSAHi Pmenu term=NONE cterm=NONE ctermbg=57 ctermfg=16 gui=NONE guibg=#c4c090 guifg=#000000
    CSAHi PmenuSel term=NONE cterm=NONE ctermbg=72 ctermfg=16 gui=NONE guibg=#ffbf00 guifg=#000000
    CSAHi PmenuSbar term=NONE cterm=NONE ctermbg=86 ctermfg=16 gui=NONE guibg=#d3d3d3 guifg=#000000
    CSAHi PmenuThumb term=NONE cterm=NONE ctermbg=79 ctermfg=16 gui=NONE guibg=#ffffff guifg=#000000
    CSAHi TabLine term=underline cterm=NONE ctermbg=37 ctermfg=16 gui=NONE guibg=#a4a090 guifg=#000000
    CSAHi TabLineSel term=bold cterm=bold ctermbg=16 ctermfg=79 gui=bold guibg=#000000 guifg=#ffffff
    CSAHi TabLineFill term=reverse cterm=NONE ctermbg=37 ctermfg=16 gui=NONE guibg=#a4a090 guifg=#000000
    CSAHi CursorColumn term=reverse cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#041008 guifg=fg
    CSAHi Underlined term=underline cterm=underline ctermbg=bg ctermfg=39 gui=underline guibg=bg guifg=#80a0ff
    CSAHi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=16 gui=NONE guibg=bg guifg=#000000
    CSAHi User1 term=NONE cterm=NONE ctermbg=17 ctermfg=31 gui=NONE guibg=#080848 guifg=#00ffff
    CSAHi User2 term=NONE cterm=NONE ctermbg=17 ctermfg=79 gui=NONE guibg=#080848 guifg=#ffffff
    CSAHi User3 term=NONE cterm=NONE ctermbg=17 ctermfg=28 gui=NONE guibg=#080848 guifg=#00ff00
    CSAHi User4 term=NONE cterm=NONE ctermbg=17 ctermfg=17 gui=NONE guibg=#080848 guifg=#202050
    CSAHi CtrlPMode1 term=NONE cterm=NONE ctermbg=17 ctermfg=76 gui=NONE guibg=#080848 guifg=#ffff00
    CSAHi CursorLineNr term=bold cterm=bold ctermbg=bg ctermfg=76 gui=bold guibg=bg guifg=#ffff00
    CSAHi Question term=NONE cterm=NONE ctermbg=bg ctermfg=28 gui=NONE guibg=bg guifg=#00ff00
    CSAHi StatusLine term=NONE cterm=NONE ctermbg=17 ctermfg=79 gui=NONE guibg=#080848 guifg=#ffffff
    CSAHi StatusLineNC term=NONE cterm=NONE ctermbg=17 ctermfg=85 gui=NONE guibg=#080848 guifg=#bebebe
    CSAHi VertSplit term=NONE cterm=NONE ctermbg=85 ctermfg=16 gui=NONE guibg=#bebebe guifg=#000000
    CSAHi Title term=bold cterm=bold ctermbg=bg ctermfg=67 gui=bold guibg=bg guifg=#ff00ff
    CSAHi Visual term=reverse cterm=NONE ctermbg=40 ctermfg=17 gui=NONE guibg=#a0b020 guifg=#00008b
    CSAHi VisualNOS term=bold,underline cterm=bold,underline ctermbg=bg ctermfg=fg gui=bold,underline guibg=bg guifg=fg
    CSAHi WarningMsg term=NONE cterm=NONE ctermbg=bg ctermfg=64 gui=NONE guibg=bg guifg=#ff0000
    CSAHi WildMenu term=NONE cterm=NONE ctermbg=16 ctermfg=76 gui=NONE guibg=#000000 guifg=#ffff00
    CSAHi CursorLine term=underline cterm=NONE ctermbg=16 ctermfg=fg gui=NONE guibg=#041008 guifg=fg
    CSAHi ColorColumn term=reverse cterm=NONE ctermbg=32 ctermfg=fg gui=NONE guibg=#8b0000 guifg=fg
    CSAHi Cursor term=NONE cterm=NONE ctermbg=31 ctermfg=16 gui=NONE guibg=#00ffff guifg=#000000
    CSAHi lCursor term=NONE cterm=NONE ctermbg=20 ctermfg=16 gui=NONE guibg=#006400 guifg=#000000
    CSAHi MatchParen term=reverse cterm=NONE ctermbg=20 ctermfg=76 gui=NONE guibg=#006400 guifg=#ffff00
    CSAHi String term=NONE cterm=NONE ctermbg=bg ctermfg=28 gui=NONE guibg=bg guifg=#00ff00
    CSAHi Number term=NONE cterm=NONE ctermbg=bg ctermfg=45 gui=NONE guibg=bg guifg=#90ee90
    CSAHi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=45 gui=NONE guibg=bg guifg=#90ee90
    CSAHi Float term=NONE cterm=NONE ctermbg=bg ctermfg=45 gui=NONE guibg=bg guifg=#90ee90
    CSAHi Folded term=bold cterm=bold ctermbg=16 ctermfg=84 gui=bold guibg=#000000 guifg=#a9a9a9
    CSAHi FoldColumn term=bold cterm=bold ctermbg=16 ctermfg=84 gui=bold guibg=#000000 guifg=#a9a9a9
    CSAHi DiffAdd term=NONE cterm=NONE ctermbg=17 ctermfg=fg gui=NONE guibg=#00008b guifg=fg
    CSAHi DiffChange term=bold cterm=NONE ctermbg=67 ctermfg=fg gui=NONE guibg=#ff00ff guifg=fg
    CSAHi DiffDelete term=bold cterm=bold ctermbg=31 ctermfg=19 gui=bold guibg=#00ffff guifg=#0000ff
    CSAHi DiffText term=reverse cterm=bold ctermbg=64 ctermfg=fg gui=bold guibg=#ff0000 guifg=fg
    CSAHi SignColumn term=NONE cterm=NONE ctermbg=85 ctermfg=31 gui=NONE guibg=#bebebe guifg=#00ffff
    CSAHi Conceal term=NONE cterm=NONE ctermbg=84 ctermfg=86 gui=NONE guibg=#a9a9a9 guifg=#d3d3d3
    CSAHi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=64 gui=undercurl guibg=bg guifg=fg guisp=#ff0000
    CSAHi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=19 gui=undercurl guibg=bg guifg=fg guisp=#0000ff
endif

if 1
    delcommand CSAHi
endif

" Vim syntax file
" Language:	edje 
" Maintainer:	C. David Wilde <cdw@mylinuxguy.com>
" Last Change:	2005 Apr 04 

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn keyword edjeSection images group parts part description rel1 rel2 program script
syn keyword edjeKeyword image name min max type effect mouse_events repeat_events clip_to color_class text_class state visisble align step aspect border color color2 color3 relative offset to to_x to_y normal tween smooth text font size fit signal source action transition target after

syn keyword	edjeTodo	contained TODO FIXME XXX
" Avoid matching "text#text", used in /etc/disktab and /etc/gettytab
syn match	edjeComment	"^//.*" contains=edjeTodo
syn match	edjeComment	"\s//.*"ms=s+1 contains=edjeTodo
syn match	edjeComment	"^\s.*//.*"ms=s+1 contains=edjeTodo

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_edje_syntax_inits")
  if version < 508
    let did_edje_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink edjeComment	Comment
  HiLink edjeTodo	Todo
  HiLink edjeSection Type
  HiLink edjeKeyword Statement

  delcommand HiLink
endif

let b:current_syntax = "edje"

" vim: ts=8 sw=2

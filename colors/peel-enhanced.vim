"########################################
"########################################
" Peel Contrast (rainglow)
"
" https://github.com/rainglow/vim
"
" Copyright (c) Dayle Rees.
"########################################
"########################################


"########################################
"# Settings.                            #
"########################################

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "peel-contrast"

"########################################
"# Base Colors.                         #
"########################################

hi Cursor           guifg=#0c0b0a guibg=#f8f8f0 gui=NONE
hi Visual           guifg=#ffffff guibg=#4f5258 gui=NONE
hi CursorLine       guifg=NONE guibg=#141311 gui=NONE
hi CursorLineNr     guifg=#82786f guibg=NONE gui=NONE
hi CursorColumn     guifg=NONE guibg=NONE gui=NONE
hi ColorColumn      guifg=NONE guibg=NONE gui=NONE
hi LineNr           guifg=#403a35 guibg=NONE gui=NONE
hi VertSplit        guifg=#282421 guibg=#282421 gui=NONE
hi MatchParen       guifg=#d3643b guibg=NONE gui=NONE
hi StatusLine       guifg=#edebe6 guibg=NONE gui=bold
hi StatusLineNC     guifg=#edebe6 guibg=NONE gui=NONE
hi Pmenu            guifg=#edebe6 guibg=NONE gui=NONE
hi PmenuSel         guifg=NONE guibg=#94c7b6 gui=NONE
hi IncSearch        guifg=#0c0b0a guibg=#f4d370 gui=NONE
hi Search           guifg=NONE guibg=#404040 gui=NONE
hi Directory        guifg=#94c7b6 guibg=NONE gui=NONE
hi Folded           guifg=#e2dfd7 guibg=NONE gui=NONE
hi Normal           guifg=#d6e1c7 guibg=NONE gui=NONE
hi Boolean          guifg=#f7b83d guibg=NONE gui=italic
hi Character        guifg=#f4d370 guibg=NONE gui=NONE
hi Comment          guifg=#585146 guibg=NONE gui=NONE
hi Conditional      guifg=#94c7b6 guibg=NONE gui=NONE
hi Constant         guifg=NONE guibg=NONE gui=NONE
hi Define           guifg=#94c7b6 guibg=NONE gui=NONE
hi DiffAdd          guifg=#a7da1e guibg=NONE gui=NONE
hi DiffDelete       guifg=#e61f44 guibg=NONE gui=NONE
hi DiffChange       guifg=#f7b83d guibg=NONE gui=NONE
hi diffAdded        guifg=#a7da1e guibg=NONE gui=NONE
hi diffRemoved      guifg=#e61f44 guibg=NONE gui=NONE
hi diffChanged      guifg=#f7b83d guibg=NONE gui=NONE
hi DiffText         guifg=#f7b83d guibg=NONE gui=bold
hi ErrorMsg         guifg=#36312d guibg=#e61f44 gui=NONE
hi WarningMsg       guifg=#36312d guibg=#f7b83d gui=NONE
hi Float            guifg=#f4d370 guibg=NONE gui=NONE
hi Function         guifg=#94c7b6 guibg=NONE gui=NONE
hi Identifier       guifg=#edebe6 guibg=NONE gui=NONE
hi Keyword          guifg=#94c7b6 guibg=NONE gui=NONE
hi Label            guifg=#f4d370 guibg=NONE gui=NONE
hi NonText          guifg=#585146 guibg=NONE gui=NONE
hi Number           guifg=#d3643b guibg=NONE gui=NONE
hi Operator         guifg=#988c6f guibg=NONE gui=NONE
hi PreProc          guifg=#837868 guibg=NONE gui=NONE
hi Special          guifg=#edebe6 guibg=NONE gui=NONE
hi SpecialKey       guifg=#edebe6 guibg=#94c7b6 gui=NONE
hi Statement        guifg=#94c7b6 guibg=NONE gui=NONE
hi StorageClass     guifg=#d3643b guibg=NONE gui=NONE
hi String           guifg=#f4d370 guibg=NONE gui=NONE
hi Tag              guifg=#94c7b6 guibg=NONE gui=NONE
hi Title            guifg=#94c7b6 guibg=NONE gui=bold
hi Todo             guifg=#837868 guibg=NONE gui=inverse,bold
hi Type             guifg=NONE guibg=NONE gui=NONE
hi Underlined       guifg=NONE guibg=NONE gui=underline
hi SignColumn       guifg=#282421 guibg=NONE gui=NONE

"########################################
"# Tree-Sitter Overrides                #
"########################################

hi @constant.builtin      guifg=#f7b83d guibg=NONE gui=italic
hi @function.builtin      guifg=#f7b83d guibg=NONE gui=italic
hi @punctuation.delimiter guifg=#988c6f guibg=NONE gui=NONE

"########################################
"# Language Overrides                   #
"########################################

hi phpIdentifier     guifg=#edebe6
hi phpMethodsVar     guifg=#c3bdb8
hi xmlTag            guifg=#94c7b6 guibg=NONE gui=NONE
hi xmlTagName        guifg=#94c7b6 guibg=NONE gui=NONE
hi xmlEndTag         guifg=#94c7b6 guibg=NONE gui=NONE


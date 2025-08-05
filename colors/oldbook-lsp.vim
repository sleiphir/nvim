" Vim Colorscheme: oldbook
" Maintainer: Konstantin Gorodinskii, adapted for Neovim
" Description: A light theme inspired by aged paper and faded ink, with TreeSitter and LSP support

" --- Setup ---
set background=light
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "oldbook"

" --- Palette ---
" Inspired by aged paper and various shades of faded ink
let s:paper         = "#fcf5e6"  " Neutral Beige Paper
let s:ink           = "#585040"  " Main foreground (Standard Ink)
let s:light_ink     = "#9a8f7d"  " Faded Ink for comments, line numbers
let s:keyword_ink   = "#70553a"  " Warm, sepia ink for keywords
let s:function_ink  = "#5e6a75"  " Cool, slate ink for functions & types
let s:literal_ink   = "#72785b"  " Earthy, faded green for strings & numbers
let s:selection     = "#e4d8ba"  " Subtle, low-contrast selection
let s:line_hl       = "#f0e8d9"  " Barely-there line highlight
let s:scope_hl      = "#d8d0c3"  " Scope highlight
let s:popup_bg      = "#ede4d2"  " Popup menu background
let s:error_curl    = "#c48484"  " Muted red for error underlining

" --- Helper for Highlighting ---
function! s:HL(group, guifg, guibg, gui, guisp)
  let cmd = "hi " . a:group
  if a:guifg != "" && a:guifg != "NONE"
    let cmd .= " guifg=" . a:guifg
  else
    let cmd .= " guifg=NONE"
  endif
  if a:guibg != "" && a:guibg != "NONE"
    let cmd .= " guibg=" . a:guibg
  else
    let cmd .= " guibg=NONE"
  endif
  if a:gui != "" && a:gui != "NONE"
    let cmd .= " gui=" . a:gui . " cterm=" . a:gui . " term=" . a:gui
  else
    let cmd .= " gui=NONE cterm=NONE term=NONE"
  endif
  if a:guisp != "" && a:guisp != "NONE"
    let cmd .= " guisp=" . a:guisp
  endif
  execute cmd
endfunction

" --- UI Highlighting ---
call s:HL("Normal", s:ink, s:paper, "NONE", "NONE")
call s:HL("NormalNC", s:light_ink, s:paper, "NONE", "NONE")
call s:HL("Cursor", s:paper, s:ink, "NONE", "NONE")
call s:HL("CursorLine", "NONE", s:line_hl, "NONE", "NONE")
call s:HL("Visual", s:ink, s:selection, "NONE", "NONE")
call s:HL("ColorColumn", "NONE", s:line_hl, "NONE", "NONE")

" Gutters and Splits
call s:HL("LineNr", s:light_ink, "NONE", "NONE", "NONE")
call s:HL("CursorLineNr", s:ink, s:line_hl, "bold", "NONE")
call s:HL("CursorLineSign", s:ink, s:line_hl, "bold", "NONE")
call s:HL("SignColumn", s:light_ink, s:paper, "NONE", "NONE")
call s:HL("Folded", s:light_ink, s:line_hl, "italic", "NONE")
call s:HL("FoldColumn", s:light_ink, s:paper, "NONE", "NONE")
call s:HL("VertSplit", s:light_ink, s:paper, "NONE", "NONE")
call s:HL("WinSeparator", s:light_ink, s:paper, "NONE", "NONE")

" Status & Tab Line
call s:HL("StatusLine", s:paper, s:ink, "NONE", "NONE")
call s:HL("StatusLineNC", s:light_ink, s:paper, "NONE", "NONE")
call s:HL("TabLine", s:light_ink, s:line_hl, "NONE", "NONE")
call s:HL("TabLineFill", "NONE", s:line_hl, "NONE", "NONE")
call s:HL("TabLineSel", s:ink, s:selection, "bold", "NONE")

" Pop-up Menu and Floating Windows
call s:HL("Pmenu", s:ink, s:popup_bg, "NONE", "NONE")
call s:HL("PmenuSel", s:ink, s:selection, "bold", "NONE")
call s:HL("PmenuSbar", "NONE", s:line_hl, "NONE", "NONE")
call s:HL("PmenuThumb", "NONE", s:selection, "NONE", "NONE")
call s:HL("NormalFloat", s:ink, s:popup_bg, "NONE", "NONE")
call s:HL("FloatBorder", s:light_ink, s:popup_bg, "NONE", "NONE")
call s:HL("TelescopeNormal", s:ink, s:popup_bg, "NONE", "NONE")
call s:HL("TelescopeBorder", s:light_ink, s:popup_bg, "NONE", "NONE")

" LuaLine
call s:HL("StatusLine", s:ink, s:line_hl, "NONE", "NONE")
call s:HL("LuaLineDiffAdd", s:literal_ink, s:line_hl, "NONE", "NONE")
call s:HL("LuaLineDiffChange", s:keyword_ink, s:line_hl, "NONE", "NONE")
call s:HL("LuaLineDiffRemove", s:error_curl, s:line_hl, "NONE", "NONE")

" Indent-Blankline
call s:HL("IblIndent", s:light_ink, "NONE", "NONE", "NONE")
call s:HL("IblScope", s:keyword_ink, "NONE", "NONE", "NONE")
call s:HL("IblWhitespace", s:light_ink, "NONE", "NONE", "NONE")

" General
call s:HL("Directory", s:keyword_ink, "NONE", "bold", "NONE")
call s:HL("Title", s:keyword_ink, "NONE", "bold", "NONE")
call s:HL("Question", s:keyword_ink, "NONE", "bold", "NONE")
call s:HL("MatchParen", "NONE", s:selection, "bold", "NONE")
call s:HL("Search", s:ink, s:selection, "NONE", "NONE")
call s:HL("IncSearch", s:paper, s:keyword_ink, "bold", "NONE")
call s:HL("WildMenu", s:paper, s:ink, "bold", "NONE")
call s:HL("NonText", s:light_ink, "NONE", "NONE", "NONE")
call s:HL("SpecialKey", s:light_ink, "NONE", "NONE", "NONE")

" --- Syntax Highlighting ---
call s:HL("Comment", s:light_ink, "NONE", "italic", "NONE")
call s:HL("Todo", s:paper, s:keyword_ink, "bold", "NONE")

" Keywords and Statements
call s:HL("Statement", s:keyword_ink, "NONE", "bold", "NONE")
hi! link Keyword Statement
hi! link Operator Statement
hi! link Conditional Statement
hi! link Repeat Statement
hi! link Label Statement

" Functions and Types
call s:HL("Function", s:function_ink, "NONE", "NONE", "NONE")
call s:HL("Type", s:function_ink, "NONE", "italic", "NONE")
hi! link StorageClass Type
hi! link Structure Type
hi! link Typedef Type

" Literals
call s:HL("Constant", s:literal_ink, "NONE", "NONE", "NONE")
hi! link String Constant
hi! link Character Constant
hi! link Number Constant
hi! link Boolean Constant
hi! link Float Constant

" Other
call s:HL("Identifier", s:ink, "NONE", "NONE", "NONE")
call s:HL("PreProc", s:light_ink, "NONE", "NONE", "NONE")
call s:HL("Special", s:keyword_ink, "NONE", "NONE", "NONE")
call s:HL("Underlined", s:ink, "NONE", "underline", "NONE")

" Errors and Diffs
call s:HL("Error", s:ink, s:selection, "bold", "NONE")
call s:HL("ErrorMsg", s:paper, s:error_curl, "bold", "NONE")
call s:HL("WarningMsg", s:paper, s:keyword_ink, "bold", "NONE")
call s:HL("DiffAdd", "NONE", "#e1e9e1", "NONE", "NONE")
call s:HL("DiffDelete", "NONE", "#e9e1e1", "NONE", "NONE")
call s:HL("DiffChange", "NONE", "#dfe2e9", "NONE", "NONE")
call s:HL("DiffText", s:ink, "#cdd7e9", "bold", "NONE")

" --- Avante Diff ---
call s:HL("AvanteToBeDeleted", "strikethrough", "#e9e1e1", "strikethrough", "strikethrough")
call s:HL("AvanteToBeDeletedWOStrikethrough", "NONE", "#e9e1e1", "NONE", "NONE")

" --- TreeSitter Highlighting ---
call s:HL("@variable", s:ink, "NONE", "italic", "NONE")
call s:HL("@variable.builtin", s:keyword_ink, "NONE", "italic", "NONE")
call s:HL("@variable.parameter", s:ink, "NONE", "italic", "NONE")
call s:HL("@variable.member", s:function_ink, "NONE", "NONE", "NONE")
call s:HL("@variable.function.go", s:function_ink, "NONE", "NONE", "NONE")
call s:HL("@module", s:ink, "NONE", "NONE", "NONE")
call s:HL("@module.builtin", s:ink, "NONE", "NONE", "NONE")
call s:HL("@function", s:function_ink, "NONE", "NONE", "NONE")
call s:HL("@function.builtin", s:function_ink, "NONE", "NONE", "NONE")
call s:HL("@function.call", s:function_ink, "NONE", "NONE", "NONE")
call s:HL("@function.method", s:function_ink, "NONE", "NONE", "NONE")
call s:HL("@function.method.call", s:function_ink, "NONE", "NONE", "NONE")
call s:HL("@constructor", s:function_ink, "NONE", "NONE", "NONE")
call s:HL("@keyword", s:keyword_ink, "NONE", "bold", "NONE")
call s:HL("@keyword.function", s:keyword_ink, "NONE", "bold", "NONE")
call s:HL("@keyword.operator", s:keyword_ink, "NONE", "bold", "NONE")
call s:HL("@keyword.return", s:keyword_ink, "NONE", "bold", "NONE")
call s:HL("@string", s:literal_ink, "NONE", "NONE", "NONE")
call s:HL("@string.escape", s:keyword_ink, "NONE", "NONE", "NONE")
call s:HL("@string.regexp", s:literal_ink, "NONE", "NONE", "NONE")
call s:HL("@string.special", s:keyword_ink, "NONE", "NONE", "NONE")
call s:HL("@number", s:literal_ink, "NONE", "NONE", "NONE")
call s:HL("@boolean", s:literal_ink, "NONE", "NONE", "NONE")
call s:HL("@constant", s:literal_ink, "NONE", "NONE", "NONE")
call s:HL("@constant.builtin", s:literal_ink, "NONE", "NONE", "NONE")
call s:HL("@type", s:function_ink, "NONE", "NONE", "NONE")
call s:HL("@type.builtin", s:function_ink, "NONE", "italic", "NONE")
call s:HL("@type.definition", s:function_ink, "NONE", "italic", "NONE")
call s:HL("@property", s:function_ink, "NONE", "NONE", "NONE")
call s:HL("@field", s:ink, "NONE", "italic", "NONE")
call s:HL("@parameter", s:ink, "NONE", "italic", "NONE")
call s:HL("@comment", s:light_ink, "NONE", "italic", "NONE")
call s:HL("@punctuation", s:ink, "NONE", "NONE", "NONE")
call s:HL("@operator", s:keyword_ink, "NONE", "NONE", "NONE")
call s:HL("@namespace", s:function_ink, "NONE", "italic", "NONE")
call s:HL("@tag", s:keyword_ink, "NONE", "NONE", "NONE")
call s:HL("@tag.attribute", s:ink, "NONE", "NONE", "NONE")
call s:HL("@tag.delimiter", s:light_ink, "NONE", "NONE", "NONE")
call s:HL("@attribute", s:keyword_ink, "NONE", "NONE", "NONE")
call s:HL("@label", s:keyword_ink, "NONE", "bold", "NONE")

" --- LSP Diagnostics ---
call s:HL("DiagnosticError", s:error_curl, "NONE", "NONE", "NONE")
call s:HL("DiagnosticWarn", s:keyword_ink, "NONE", "NONE", "NONE")
call s:HL("DiagnosticInfo", s:function_ink, "NONE", "NONE", "NONE")
call s:HL("DiagnosticHint", s:light_ink, "NONE", "NONE", "NONE")
call s:HL("DiagnosticVirtualTextError", s:error_curl, "NONE", "italic", "NONE")
call s:HL("DiagnosticVirtualTextWarn", s:keyword_ink, "NONE", "italic", "NONE")
call s:HL("DiagnosticVirtualTextInfo", s:function_ink, "NONE", "italic", "NONE")
call s:HL("DiagnosticVirtualTextHint", s:light_ink, "NONE", "italic", "NONE")
call s:HL("DiagnosticUnderlineError", "NONE", "NONE", "underline", s:error_curl)
call s:HL("DiagnosticUnderlineWarn", "NONE", "NONE", "underline", s:keyword_ink)
call s:HL("DiagnosticUnderlineInfo", "NONE", "NONE", "underline", s:function_ink)
call s:HL("DiagnosticUnderlineHint", "NONE", "NONE", "underline", s:light_ink)
call s:HL("DiagnosticSignError", s:error_curl, "NONE", "NONE", "NONE")
call s:HL("DiagnosticSignWarn", s:keyword_ink, "NONE", "NONE", "NONE")
call s:HL("DiagnosticSignInfo", s:function_ink, "NONE", "NONE", "NONE")
call s:HL("DiagnosticSignHint", s:light_ink, "NONE", "NONE", "NONE")

" --- Indent Blankline ---
call s:HL("IblIndent", s:line_hl, "NONE", "NONE", "NONE")
call s:HL("IblScope", s:scope_hl, "NONE", "NONE", "NONE")

" --- Cleanup ---
delfunction s:HL

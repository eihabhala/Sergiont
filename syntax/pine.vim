" Vim syntax file
" Language: Pine Script (TradingView)
" Maintainer: Sergiont Team
" Latest Revision: 2025-09-20

if exists("b:current_syntax")
  finish
endif

" Pine Script keywords
syn keyword pineKeyword if else for to step in and or not var var_init
syn keyword pineKeyword indicator strategy alertcondition study
syn keyword pineKeyword plot hline fill bgcolor
syn keyword pineKeyword input time series
syn keyword pineKeyword ta request security security_lower_tf

" Pine Script functions
syn keyword pineFunction open high low close volume
syn keyword pineFunction plot plotchar plotshape plotbar plotcandle
syn keyword pineFunction sma ema rsi macd stoch bb bollingerBands
syn keyword pineFunction crossover crossunder cross
syn keyword pineFunction nz change sign alma

" Pine Script versions
syn keyword pineVersion version=1 version=2 version=3 version=4 version=5

" Comments
syn match pineComment "//.*$"
syn region pineComment start="/\*" end="\*/"

" Strings
syn region pineString start='"' end='"'
syn region pineString start="'" end="'"

" Numbers
syn match pineNumber '\d\+'
syn match pineFloat '\d\+\.\d*'

" Operators
syn match pineOperator "[-+*/%=<>!&|^~]"

" Highlighting
hi def link pineKeyword Keyword
hi def link pineFunction Function
hi def link pineVersion PreProc
hi def link pineComment Comment
hi def link pineString String
hi def link pineNumber Number
hi def link pineFloat Float
hi def link pineOperator Operator

let b:current_syntax = "pine"
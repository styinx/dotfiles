if exists("b:current_syntax") && b:current_syntax == "tri"
  finish
endif

syn iskeyword @,48-57,192-255,$,_

syn keyword triKeyword      ret nop
syn keyword triKeyword      elif else if match and or
syn keyword triKeyword      for
syn keyword triKeyword      beg end in is rec
syn keyword triKeyword      ret

syn keyword triConstant     false nil true

syn keyword triType         I8 U8 I16 U16 I32 U32 I64 U64
syn keyword triType         F32 F64
syn keyword triType         Bool Byte
syn keyword triType         Fun

syn match triFunKeyword     /\<Fun\>/
syn match triModKeyword     /\<mod\>/   skipwhite nextgroup=triModIdentifier
syn match triModIdentifier  /\<\w\+\>/  skipwhite
syn match triTypeSeparator  /:/         skipwhite nextgroup=triType

syn match triNumber         /\d\+/

syn match triString         /"[^"]*"/
syn match triCharacter      /'[^']*'/

syn match triOperator       /#/

syn match triSpecial        /,/
syn match triSpecial        /_/
syn match triSpecial        /->/

syn region triString        start=/"/ end=/"/

syn region triArguments start=/Fun(/ end=/)/ contains=triArgument,triArgumentSeparator
syn match triArgument               /\w\+/ contained
syn match triArgumentSeparator      /,/ contained

"syn region triBlock         start=/beg/ end=/end/ fold
"syn region triFor           start=/for/ end=/end/ fold
"syn region triFun           start=/fun/ end=/end/ fold
"syn region triMod           start=/mod/ end=/end/ fold
"syn region triIf            start=/if/ end=/end/  fold

" Colors
hi def link ModuleName                  Identifier
hi def link FunctionName                Identifier
hi def link FunctionArgument            Identifier
hi def link FunctionArgumentSeparator   Delimiter

hi def link triModKeyword           Keyword
hi def link triModIdentifier        ModuleName
hi def link triFunKeyword           Type
hi def link triFunIdentifier        FunctionName

hi def link triKeyword              Keyword
hi def link triOperator             Operator
hi def link triType                 Type
hi def link triConstant             Constant
hi def link triNumber               Number
hi def link triString               String
hi def link triChar                 String
hi def link triSpecial              Special
hi def link triTypeSeparator        Special
hi def link triIdentifier           Special

hi def link triArgument             FunctionArgument
hi def link triArgumentSeparator    FunctionArgumentSeparator

let b:current_syntax = "tri"

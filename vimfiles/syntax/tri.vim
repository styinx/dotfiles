if exists("b:current_syntax") && b:current_syntax == "tri"
  finish
endif


" [Identifiers]

syn match triIdentifier         /\<\w\+\>/
syn match triIdentifierAlias    /\<\w\+\>/      contains=@NoSpell contained
syn match triIdentifierCall     /\zs\w\+\ze(/   contains=@NoSpell
syn match triIdentifierFunction /\<\w\+\>/      contains=@NoSpell contained
syn match triIdentifierModule   /\<\w\+\>/      contains=@NoSpell contained
syn match triIdentifierRecord   /\<\w\+\>/      contains=@NoSpell contained
syn match triIdentifierType     /\<\w\+\>/      contains=@NoSpell contained


" [Keywords]

syn match triAlias      /\<alias\>/     contains=@NoSpell nextgroup=triIdentifierAlias skipwhite
syn match triAnd        /\<and\>/       contains=@NoSpell
syn match triBeg        /\<beg\>/       contains=@NoSpell
syn match triElif       /\<elif\>/      contains=@NoSpell
syn match triElse       /\<else\>/      contains=@NoSpell
syn match triEnd        /\<end\>/       contains=@NoSpell
syn match triFor        /\<for\>/       contains=@NoSpell
syn match triFun        /\<fun\>/       contains=@NoSpell nextgroup=triIdentifierFunction skipwhite
syn match triIf         /\<if\>/        contains=@NoSpell
syn match triIn         /\<in\>/        contains=@NoSpell
syn match triIs         /\<is\>/        contains=@NoSpell
syn match triMatch      /\<match\>/     contains=@NoSpell
syn match triMod        /\<mod\>/       contains=@NoSpell nextgroup=triIdentifierModule skipwhite
syn match triNop        /\<nop\>/       contains=@NoSpell
syn match triOr         /\<or\>/        contains=@NoSpell
syn match triRec        /\<rec\>/       contains=@NoSpell nextgroup=triIdentifierRecord skipwhite
syn match triRet        /\<ret\>/       contains=@NoSpell
syn match triType       /\<type\>/      contains=@NoSpell nextgroup=triIdentifierType skipwhite


" [Constants]

syn match triFalse      /\<false\>/
syn match triNil        /\<nil\>/
syn match triTrue       /\<true\>/


" [Standard Types]

syn match triBool       /\<Bool\>/      contains=@NoSpell
syn match triByte       /\<Byte\>/      contains=@NoSpell
syn match triFunction   /\<Function\>/  contains=@NoSpell
syn match triI8         /\<I8\>/        contains=@NoSpell
syn match triU8         /\<U8\>/        contains=@NoSpell
syn match triI16        /\<I16\>/       contains=@NoSpell
syn match triU16        /\<U16\>/       contains=@NoSpell
syn match triI32        /\<I32\>/       contains=@NoSpell
syn match triU32        /\<U32\>/       contains=@NoSpell
syn match triI64        /\<I64\>/       contains=@NoSpell
syn match triU64        /\<U64\>/       contains=@NoSpell
syn match triF32        /\<F32\>/       contains=@NoSpell
syn match triF64        /\<F64\>/       contains=@NoSpell


" [Operators]

syn match triOpAssign       /=/
syn match triOpContinuation /\.\./
syn match triOpLen          /#/


" [Others]

syn match triNumber                     /\v<[0-9][0-9']*>/              contains=@NoSpell
syn match triBinNumber                  /\v<0b[01][01']*>/              contains=@NoSpell
syn match triOctNumber                  /\v<0o[0-7][0-7']*>/            contains=@NoSpell
syn match triHexNumber                  /\v<0[hx][0-9A-F][0-9A-F']*>/   contains=@NoSpell

syn match triCharacter                  /\v'[^']*'/
syn match triString                     /\v"[^"]*"/

syn match triArrow                      /->/
syn match triComma                      /,/
syn match triColon                      /:/
syn match triParenthesisOpen            /(/
syn match triParenthesisClose           /)/
syn match triBracketOpen                /\[/
syn match triBracketClose               /\]/
syn match triUnderscore                 /_/


" [Clusters]



" [Regions]

"syn region triString                    start=/"/           end=/"/
"syn region triArguments                 start=/Function(/   end=/)/
"syn region triBlock                     start=/beg/         end=/end/
"syn region triFor                       start=/for/         end=/end/
"syn region triFun                       start=/fun/         end=/end/
"syn region triMod                       start=/mod/         end=/end/
"syn region triIf                        start=/if/          end=/end/


" [Colors]

" [Color overwrite]
hi Operator cterm=None ctermbg=None guifg=darkgreen
hi Alias    cterm=None ctermbg=None guifg=darkyellow
hi Call     cterm=None ctermbg=None guifg=orange
hi Function cterm=None ctermbg=None guifg=darkcyan
hi Module   cterm=None ctermbg=None guifg=darkred
hi Record   cterm=None ctermbg=None guifg=gold
hi Typename cterm=None ctermbg=None guifg=darkmagenta

" [Color definition]
hi def link colKeyword                  Keyword
hi def link colIdentifier               Identifier
hi def link colIdentifierAlias          Alias
hi def link colIdentifierCall           Call
hi def link colIdentifierFunction       Function
hi def link colIdentifierModule         Module
hi def link colIdentifierRecord         Record
hi def link colIdentifierType           Typename
hi def link colConstant                 Constant
hi def link colType                     Type
hi def link colOperator                 Operator
hi def link colNumber                   Number
hi def link colSpecial                  Special

" [Color assignment]

" Identifiers
hi def link triIdentifier           colIdentifier
hi def link triIdentifierAlias      colIdentifierAlias
hi def link triIdentifierCall       colIdentifierCall
hi def link triIdentifierFunction   colIdentifierFunction
hi def link triIdentifierModule     colIdentifierModule
hi def link triIdentifierRecord     colIdentifierRecord
hi def link triIdentifierType       colIdentifierType

" Keywords
hi def link triAlias    colKeyword
hi def link triAnd      colKeyword
hi def link triBeg      colKeyword
hi def link triElif     colKeyword
hi def link triElse     colKeyword
hi def link triEnd      colKeyword
hi def link triFor      colKeyword
hi def link triFun      colKeyword
hi def link triIf       colKeyword
hi def link triIn       colKeyword
hi def link triIs       colKeyword
hi def link triMatch    colKeyword
hi def link triMod      colKeyword
hi def link triNop      colKeyword
hi def link triOr       colKeyword
hi def link triRec      colKeyword
hi def link triRet      colKeyword
hi def link triType     colKeyword

" Constants
hi def link triFalse    colConstant
hi def link triNil      colConstant
hi def link triTrue     colConstant

" Types
hi def link triBool     colType
hi def link triByte     colType
hi def link triFunction colType
hi def link triI8       colType
hi def link triU8       colType
hi def link triI16      colType
hi def link triU16      colType
hi def link triI32      colType
hi def link triU32      colType
hi def link triI64      colType
hi def link triU64      colType
hi def link triF32      colType
hi def link triF64      colType

" Operators
hi def link triOpAssign         colOperator
hi def link triOpContinuation   colOperator
hi def link triOpLen            colOperator

" Other
hi def link triNumber       colNumber
hi def link triBinNumber    colNumber
hi def link triOctNumber    colNumber
hi def link triHexNumber    colNumber

hi def link triArrow            colSpecial
hi def link triComma            colSpecial
hi def link triColon            colSpecial
hi def link triParenthesisOpen  colSpecial
hi def link triParenthesisClose colSpecial
hi def link triBracketOpen      colSpecial
hi def link triBracketClose     colSpecial
hi def link triUnderscore       colSpecial

let b:current_syntax = "tri"

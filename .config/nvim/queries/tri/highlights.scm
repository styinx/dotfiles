; -----------------------------------------------------------------------------
; Fallback
; -----------------------------------------------------------------------------

(identifier) @variable

; -----------------------------------------------------------------------------
; Literals
; -----------------------------------------------------------------------------

(boolean) @boolean
(nil) @constant.builtin
(nop) @constant.builtin

(number) @number
(int) @number
(float) @number.float
(bin) @number
(hex) @number

(string) @string

; -----------------------------------------------------------------------------
; Types
; -----------------------------------------------------------------------------

(type) @type
(builtin_type) @type.builtin

; -----------------------------------------------------------------------------
; Operators
; -----------------------------------------------------------------------------

"#"  @special
"^"  @special
"$"  @special

"="  @operator
"->" @operator

":"  @punctuation.delimiter
"."  @punctuation.delimiter
","  @punctuation.delimiter
".." @punctuation.delimiter

"(" @punctuation.bracket
")" @punctuation.bracket
"[" @punctuation.bracket
"]" @punctuation.bracket

; -----------------------------------------------------------------------------
; Keywords
; -----------------------------------------------------------------------------

[
  "alias"
  "beg"
  "elif"
  "else"
  "end"
  "for"
  "fun"
  "if"
  "in"
  "mod"
  "rec"
  "ret"
  "type"
] @keyword

; -----------------------------------------------------------------------------
; Declarations
; -----------------------------------------------------------------------------

(alias_declaration
  name: (identifier) @type)

(function_declaration
  name: (identifier) @function)

(module_declaration
  name: (identifier) @module)

(record_declaration
  name: (identifier) @type)

(type_declaration
  name: (identifier) @type)

(variable_declaration
  name: (identifier) @variable.parameter)

; -----------------------------------------------------------------------------
; Parameters
; -----------------------------------------------------------------------------

(parameter_declaration_list
  (variable_declaration
    name: (identifier) @variable.parameter))

; -----------------------------------------------------------------------------
; Expressions
; -----------------------------------------------------------------------------

(call_expression
  name: (identifier) @function.call)

(operation_expression
  operator: (operator) @operator)

; -----------------------------------------------------------------------------
; Statements
; -----------------------------------------------------------------------------

(for_statement
  counter: (identifier) @variable)

(return_statement
  "ret" @keyword.return)

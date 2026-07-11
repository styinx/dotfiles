; -----------------------------------------------------------------------------
; Defaults
; -----------------------------------------------------------------------------

(comment) @comment
((identifier) @variable
  (#set! priority 90)
)

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
(oct) @number

(string) @string

; -----------------------------------------------------------------------------
; Types
; -----------------------------------------------------------------------------

(type) @type
(builtin_type) @type.builtin

; -----------------------------------------------------------------------------
; Operators
; -----------------------------------------------------------------------------

(operator) @operator
(unary_operator) @operator
(assignment_operator) @operator
"->" @operator
"=" @operator

[
  ":"
  "."
  ","
  ".."
] @punctuation.delimiter

[
  "("
  ")"
  "["
  "]"
] @punctuation.bracket

[
  "#"
  "^"
  "$"
] @special


; -----------------------------------------------------------------------------
; Keywords
; -----------------------------------------------------------------------------

[
  "alias"
  "beg"
  "elif"
  "else"
  "end"
  "enum"
  "for"
  "fun"
  "if"
  "import"
  "in"
  "match"
  "mod"
  "rec"
  "ret"
  "type"
] @keyword

; -----------------------------------------------------------------------------
; Declarations
; -----------------------------------------------------------------------------

(alias_declaration
  name: (identifier) @type
)

(enum_declaration
  name: (identifier) @enum
  enumerator: (identifier) @constant
)

(function_declaration
  name: (identifier) @function
)

(function_declaration
  [
    (variable_definition
      name: (identifier) @variable.parameter
    )
    (variable_declaration
      (variable_definition
        name: (identifier) @variable.parameter
      )
    )
  ]
)

(module_declaration
  name: (identifier) @module
)

(record_declaration
  name: (identifier) @structure
)

(record_declaration
  [
    (variable_definition
      name: (identifier) @variable.member
    )
    (variable_declaration
      (variable_definition
        name: (identifier) @variable.member
      )
    )
  ]
)

(type_declaration
  name: (identifier) @type
)

; -----------------------------------------------------------------------------
; Expressions
; -----------------------------------------------------------------------------

(call_expression
  name: (identifier) @function.call
)

; -----------------------------------------------------------------------------
; Statements
; -----------------------------------------------------------------------------

(import_statement
  "import" @keyword.import
  (identifier) @module
)

(return_statement
  "ret" @keyword.return
)

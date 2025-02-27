[
  "acl"
  "sub"
  "backend"
  "probe"
  "vcl"
  "else"
  "elsif"
  "elseif"
  "if"
  "return"
  "import"
  "include"
  "set"
  "unset"
  "new"
  "call"
] @keyword

[
  "hit"
  "miss"
  "pass"
  "pipe"
  "retry"
  "restart"
  "fail"
  "synth"
  "hash"
  "deliver"
  "abandon"
  "lookup"
] @keyword

(operator) @operator
"=" @operator
"!" @operator

[
  "."
  ","
  ";"
] @punctuation.delimiter

[
  "("
  ")"
  "{"
  "}"
]  @punctuation.bracket


(string) @string
(number) @number
; (float) @number
(duration) @number
(bytes) @number
(bool) @constant.builtin

(ident_call_expr
  ident: (nested_ident) @function.call)
(ident_call_expr
  ident: (nested_ident) @function.builtin (#any-of? @function.builtin "regsub" "regsuball" "hash_data" "synthetic" "ban"))

(ident) @variable
(nested_ident) @variable
[
  ((nested_ident) @_content (#match? @_content "^(req|bereg|resp|beresp|obj|client|sess|server)"))
  ((ident) @_content (#match? @_content "^(req|bereg|resp|beresp|obj|client|sess|server)"))
] @variable.builtin
(enum_ident) @constant

(binary_expression
  operator: (operator (rmatch))
  right: (literal (string) @string.regex (#offset! @string.regex 0 1 0 -1)))

(func_call_named_arg
   arg_name: (nested_ident) @parameter)

(COMMENT) @comment

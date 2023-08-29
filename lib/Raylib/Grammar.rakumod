grammar RaylibGrammar {
    token TOP {
        [ <defined-content> ]*
    }

    rule defined-content {
        | <macro-block>
        | <closing-bracket>
        | <typedef>
        | <function>
        | <include>
        | <define-decl>
        | <statement>
    }

    rule macro-block {
        | <extern>
        | <if-macro-block>
        | <ifndef-block>
        | <else-macro-line>
        | <elif-macro-line>
        | <error-macro-line>
    }

    rule typedef-ignored {
        'typedef' 'enum' 'bool' <block> 'bool' ';'
    }

    rule extern {
        'extern' <string> '{'
    }

    token closing-bracket {
        '}'
    }

    rule if-macro-block {
        '#if' \N* \n? <defined-content>* '#endif'
    }

    rule ifndef-block {
        '#ifndef' <identifier> <defined-content>* '#endif'
    }
    rule error-macro-line {
        '#error' \N* \n?
    }
    rule else-macro-line {
        '#else' \n?
    }

    rule elif-macro-line {
        '#elif' \N* \n?
    }

    rule include {
        '#include' '<' ~ '>' [ <identifier> '.h' | <string> ]
    }

    rule if-defined {
        '#if' \N* \n?
    }

    rule elif-defined {
        '#elif' '!'? 'defined' '(' .* ')' <defined-content>* <endif>
    }

    token elif {
        '#elif'
    }

    token endif {
        '#endif'
    }

    rule statement {
        | <comment>
        | <var-decl>
        | <enum-var-decl>
    }

    rule block {
        '{' ~ '}' <statement>*
    }

    token typedef {
        | <typedef-ignored>
        | <typedef-struct>
        | <typedef-struct-forward>
        | <typedef-enum>
        | <typedef-callback>
        | <typedef-alias>
    }

    rule typedef-alias {
        'typedef' <type> <identifier> ';'
    }

    rule typedef-callback {
        'typedef' <const>? <unsigned>? <type> <pointer>* '(' ~ ')' [<pointer>* <identifier>] '(' ~ ')' <parameters>? ';'
    }
    rule typedef-struct {
        'typedef' 'struct' <identifier> <comment>? <block> <identifier> ';'
    }
    rule typedef-struct-forward {
        'typedef' 'struct' <type> <identifier>';'
    }

    rule typedef-enum {
        'typedef' 'enum' <identifier>? <block> <identifier> ';'
    }

    rule function {
        <api-decl>? <type> <pointer>* <identifier> '(' ~ ')' <parameters>? ';'
    }

    rule macro-identifier {
        | '__'<identifier>
        | '__'<identifier>'__'
        | <identifier>
    }


    rule macro-arguments {
        <value> [',' <value> ]*
    }

    rule macro-function {
        <macro-identifier> ['(' ~ ')' <macro-arguments> <block>?]?
    }

    rule parameters {
        | '...'
        | <const>? <unsigned>? <type> <pointer>* <identifier>? [',' <parameters>]*
    }


    token identifier {
        [<:alpha> | '_'] \w*
    }

    token api-decl {
        <identifier>
    }

    rule array-identifier {
        <identifier>'[' ~ ']' <index>
    }

    token index {
        <number>
    }

    rule var-decl {
        <modifier>* <type> <pointer>* [<array-identifier> | <identifier>] [',' [<array-identifier> | <identifier>]]* ';'
    }

    rule enum-var-decl {
        <value> ['=' <value> ]? ','?
    }

    token number {
        \d+ ['.' \d+? 'f']?
    }

    token hex-number {
        '0x' <hex-digits>
    }

    token hex-digits {
        [ <xdigit>+ ]
    }

    rule define-decl {
        '#define' [ <string> | <number> | <group> | <macro-function>*]? <comment>?
    }

    rule division {
        <value> '/' <value>
    }

    rule group {
        '(' ~ ')' [ <division> | <value> ]
    }

    token type {
        | 'struct'
        | 'enum'
        | 'void'
        | 'bool'
        | 'int'
        | 'float'
        | 'double'
        | 'char'
        | 'short'
        | 'va_list'
        | <identifier>
    }

    token boolean {
        'true' | '!'? 'false'
    }

    token value {
        | <number>
        | <string>
        | <group>
        | <hex-number>
        | <identifier>
        | <boolean>
    }

    rule string {
        '"' \N* '"'
    }

    token modifier {
        | <const>
        | <unsigned>
    }

    token const {
        'const'
    }

    token unsigned {
        'unsigned'
    }


    token pointer {
        '*'
    }

    rule comment {
        | <one-line-comment>
        | <block-comment>

    }

    rule one-line-comment {
        '//' \N* \n?
    }

    rule block-comment {
        '/*' .*? '*/'
    }

}

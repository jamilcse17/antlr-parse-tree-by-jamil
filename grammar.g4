
//project parser jamilcse17 github
                              by mahmud jamil///





grammar project;
root: declaration function;

declaration: ('@'declarationlist)+;
declarationlist: 'import' declarationtype| 'define' '"' datatype term 'as' Digit'"';
declarationtype: '"'term'"'| '"'term '.' term'"';


function: datatype ID '<''>' block | datatype ID '<'statement'>' block | datatype ID '<'statement'>' ':'|datatype ID '<''>'':' ;

datatype: 'int'|'float'|'bool'|'char'|'string' ;
block: '['statement']'| statement;

statement: ( defexpression| defcondition| defloop| defreturn| defoutput| definput| defbreak )+;

defexpression: datatype expression ':'|expression ':'|datatype expression ;

defcondition: 'if' '~'expression':'block | 'if' '~'expression':'block 'else' block ;

defloop: defwhile|deffor|defdowhile;

defdowhile: 'do' block 'while' '<'whileloopexpr'>';

defwhile: 'while' '<'whileloopexpr'>' block;
whileloopexpr: term relation term | term ;

deffor: 'for''<'forloopexpr'>'block;
forloopexpr: condition increament;
condition: var relation term ':'var relation term':';
increament: inc_or_dec var | var inc_or_dec ;

relation: 'is_equal' | 'isnot_equal' |'greater_than' |'less_than' | 'greater_or_equal' | 'less_or_equal' |'assign';

expression: expression binop expression | spop expression | expression relation expression | expression logicop expression | '('expression')'| inc_or_dec term| term inc_or_dec| expression ',' expression | term | term join term ;

defreturn: 'return'expression':';

defbreak: 'break'':';

logicop: 'and' | 'or';

binop: 'add' | 'sub' | 'multi' |'div' | 'mod' | 'power' ;
spop: 'root' ;


defoutput: 'print>>' expression ':' ;
definput: 'scan<<' term ':';

var: ID;
inc_or_dec: 'inc'|'dec';
term: ID|Digit;
ID: [a-zA-Z]+ ;
Digit: [0-9]+ ;
join: '_';
Termspec: [ \t\r\n]+ -> skip;
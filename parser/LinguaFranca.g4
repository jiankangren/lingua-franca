
grammar LinguaFranca;
sys : actor ;
actor : head '{' body '}' ;
head : 'actor' ID '(' param* ')' ;
param : ID ':' type def? ;
def : '(' INTVAL ')' ;
body : stat* ;

stat : lang
     | inp
     | outp
     | trig
     | pre
     | init
     | react
     ;

lang : 'language' ID ';' ;
inp : 'input' ID ':' type ';' ;
outp : 'output' ID ':' type ';' ;
trig : 'trigger' ID ';' ;

pre : 'preamble' '{' code '}' ;
init : 'initialize' '{' code '}' ;
react : 'reaction' '(' ID ')' sets* '{' code '}' ;

sets : '->' ID ;

code : (.)*? ;


type : INT | STR ;

INT : 'int' ;
STR : 'string' ;
IN : 'input' ;
OUT : 'output' ;
INTVAL : [0-9]+ ;
ID : [a-zA-Z]+ ;          // match identifiers
WS : [ \t\r\n]+ -> skip ; // skip spaces, tabs, newlines
NEWLINE : 'r'? '\n' ;
CMT : '/' '/' (.)*? NEWLINE -> skip ;

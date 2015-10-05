Here is my README for Lab 4. Problem 1 is at the beginning, and the report on the rest of the problems is below. Please see the sections below for the bug report and explanation.

## Problem 1 ##
This is from a simple hello.c in this directory.

You can grab the AST by clang -cc1 -ast-dump hello.c. I went ahead and printed the entire AST below. I don't really understand the first couple of lines and why its implicit. Then on the first level it shows the 'add' function with a return int and 2 ints in the parenthesis. Its interesting that it only shows the ints not the names, but it makes sense.

It then Declares the a and b as ints. It then describes the return statement with a binary oper. This seems really clear cut to be honest.

After that is the main which shows its return type and parameter types. It shows a cinit for the variables I created. Honestly, it makes a bunch of friends.  

Here is the AST:
TranslationUnitDecl 0x10302c0c0 <<invalid sloc>> <invalid sloc>
|-TypedefDecl 0x10302c5c0 <<invalid sloc>> <invalid sloc> implicit __int128_t '__int128'
|-TypedefDecl 0x10302c620 <<invalid sloc>> <invalid sloc> implicit __uint128_t 'unsigned __int128'
|-TypedefDecl 0x10302c970 <<invalid sloc>> <invalid sloc> implicit __builtin_va_list '__va_list_tag [1]'
|-FunctionDecl 0x10302cb10 <hello.c:1:1, line:3:1> line:1:5 used add 'int (int, int)'
| |-ParmVarDecl 0x10302c9d0 <col:9, col:13> col:13 used a 'int'
| |-ParmVarDecl 0x10302ca40 <col:16, col:20> col:20 used b 'int'
| `-CompoundStmt 0x10302cc88 <col:22, line:3:1>
|   `-ReturnStmt 0x10302cc68 <line:2:3, col:14>
|     `-BinaryOperator 0x10302cc40 <col:10, col:14> 'int' '+'
|       |-ImplicitCastExpr 0x10302cc10 <col:10> 'int' <LValueToRValue>
|       | `-DeclRefExpr 0x10302cbc0 <col:10> 'int' lvalue ParmVar 0x10302c9d0 'a' 'int'
|       `-ImplicitCastExpr 0x10302cc28 <col:14> 'int' <LValueToRValue>
|         `-DeclRefExpr 0x10302cbe8 <col:14> 'int' lvalue ParmVar 0x10302ca40 'b' 'int'
`-FunctionDecl 0x103068870 <line:5:1, line:11:1> line:5:5 main 'int (int, char **)'
  |-ParmVarDecl 0x10302ccc0 <col:10, col:14> col:14 argc 'int'
  |-ParmVarDecl 0x10302cd90 <col:20, col:27> col:27 argv 'char **'
  `-CompoundStmt 0x103068c40 <line:6:1, line:11:1>
    |-DeclStmt 0x1030689a8 <line:7:3, col:12>
    | `-VarDecl 0x103068930 <col:3, col:11> col:7 used a 'int' cinit
    |   `-IntegerLiteral 0x103068988 <col:11> 'int' 1
    |-DeclStmt 0x103068a48 <line:8:3, col:12>
    | `-VarDecl 0x1030689d0 <col:3, col:11> col:7 used b 'int' cinit
    |   `-IntegerLiteral 0x103068a28 <col:11> 'int' 2
    |-DeclStmt 0x103068be8 <line:9:3, col:20>
    | `-VarDecl 0x103068a70 <col:3, col:19> col:7 c 'int' cinit
    |   `-CallExpr 0x103068b80 <col:11, col:19> 'int'
    |     |-ImplicitCastExpr 0x103068b68 <col:11> 'int (*)(int, int)' <FunctionToPointerDecay>
    |     | `-DeclRefExpr 0x103068ac8 <col:11> 'int (int, int)' Function 0x10302cb10 'add' 'int (int, int)'
    |     |-ImplicitCastExpr 0x103068bb8 <col:15> 'int' <LValueToRValue>
    |     | `-DeclRefExpr 0x103068af0 <col:15> 'int' lvalue Var 0x103068930 'a' 'int'
    |     `-ImplicitCastExpr 0x103068bd0 <col:18> 'int' <LValueToRValue>
    |       `-DeclRefExpr 0x103068b18 <col:18> 'int' lvalue Var 0x1030689d0 'b' 'int'
    `-ReturnStmt 0x103068c20 <line:10:3, col:10>
      `-IntegerLiteral 0x103068c00 <col:10> 'int' 0


## Other Problems ##

# Note #
I got behind, and took Sunday to code this, therefore it isn't as pretty as I would like. It does resemble our base AST code for our compiler due to the fact that I learned how to do the AST from that. Please know I did develop everything on my own, this should be obvious in the other visitors that we did not have in our compiler.

# Bugs #
Currently I cannot get it to compile. The only error it throws is

[ 14%] Linking CXX executable ast_tree
Undefined symbols for architecture x86_64:
"Eval::visit(IntegerVal*)", referenced from:
    vtable for Eval in evaluate.cpp.o
"PrintExpr::visit(IntegerVal*)", referenced from:
    vtable for PrintExpr in printExpressions.cpp.o
ld: symbol(s) not found for architecture x86_64
clang: error: linker command failed with exit code 1 (use -v to see invocation)
make[2]: *** [ast_tree] Error 1
make[1]: *** [CMakeFiles/ast_tree.dir/all] Error 2
make: *** [all] Error 2

This is similar problem that happened on our compiler at the end, but it would run on everyone's machine but mine. I'm still working to figure out the problem, but I couldn't figure it out in time for the lab to be due.

Also, I wasn't sure how to grab the Min or Max of the vector<Root*>. I would have tested this out and figured it out with C++, but again couldn't get the earlier bug finished.

Even though I couldn't get it compile, I went ahead and coded all of it so you could get an idea of what I was doing.  

# Run #
$$ cmake .
$$ make
$$ ./ast_tree

# Problem 1
I looked at the man page for clang to make sure the assembly generated by -S is the LLVM. It has an interesting paragraph on LLVM and the stages of the compiler. I used the code below to generate the assembly file, problem1.s. You can see the the file in the tar.

`clang -O0 -S problem1.c`

This generated x86 assembly! Oh no! So thanks to Tyler's help, I have corrected it get the correct LLVM code. The correct file is problem1.ll.

`clang -O0 -S -emit-llvm problem1.c`

# Problem 2
## 1. How are functions encoded?
Here is the example of the function encoding for ackerman.

`define i32 @ackermann(i32 %m, i32 %n) #0 {`

It 'define' a function with a return of a 32 bit integer (i32). The @ackerman is the function name. It then gices the parameter list. Again it gives the type but following the type is the name it gave it. Each of the parameters in this case are 32 ints, but in the floatfun() one is a "float" which is (shockingly) a float.

For a more thorough explanation, here is the definition of a function encoding from the manual

```
define [linkage] [visibility] [DLLStorageClass]
       [cconv] [ret attrs]
       <ResultType> @<FunctionName> ([argument list])
       [unnamed_addr] [fn Attrs] [section "name"] [comdat [($name)]]
       [align N] [gc] [prefix Constant] [prologue Constant]
       [personality Constant] { ... }
```

## 2. How are blocks encoded?
Here is an example of the block encoding for label 6.

```
; <label>:6                                       ; preds = %0
  %7 = load i32* %3, align 4
  %8 = add nsw i32 %7, 1
  store i32 %8, i32* %1
  br label %24
```

This means this block is named number 6. It does some non jump operations, but then jumps at the end to another blocked with the label name 24. The preds is the number of all the blocks that could jump to that block.

## 3. Are there instructions that are not 3 address?
Yes. Many of them are 3 code addresses, but there are several that are not. One example is the call method. It has a lot of paramters.

`%8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str1, i32 0, i32 0), i32 %7)`

WAY too many parameters.

## 4. What are the %21 names?
%[number] are the intermediate variable names the compiler uses uses instead of the names we may have given it. These names could be for variable or a label. Paramter names are done by %[name given].

# Problem 3
Instead of just changing original ll code, I copied it and changed the function in problem3.ll.

Here is just some notes to myself will figuring the code out.
%2 is m, %3 is n, %19 is m, %20 is n, %18 m-1, %21 is n-1

In label 16 (ln 87) I changed the follows lines from

```
%22 = call i32 @ackermann(i32 %19, i32 %21)
%23 = call i32 @ackermann(i32 %18, i32 %22)
store i32 %23, i32* %1
br label %24
```

to

```
%22 = call i32 @ackermann(i32 %18, i32 %21)
store i32 %22, i32* %1
br label %23
```

Note that I had to change the numbering of the next block, and the blocks that called it.

# Problem 4
I think this may just keep things as is. Since you will use the ans = 100 if you go down the branches. I do expect it to have the phi function.

What do you know! it uses a phi function! Also it does optimize the ans further. It beings the compare, and then figures out where to go using the phi file.

# Problem 5
Again, I added a new file for recording later. I wrote the main in C, but I changed everything else by hand.

Answer should be:
Equal:      n+100 = 102
Positive:   n*100 + 100 = 300
Negative:   n*2 + 100 = 104

I got that answer! The source code is problem 5.ll, the original code is in problem4.ll.

# Problem 6
>> make all
>> ./problem6

This has a forloop print in the main that goes from 0 - 20

# Problem 7
>> make all (if you haven't yet)
>> ./problem 7

This has a couple of tests. It has no bugs, and I added a feature to return a -1 if they give an invalid selector. Towards the end I was realizing that I can name variables... I had understood that before, but I had tried it. After getting very confused on the loop for a bit, I named everything. That got rid of a lot of the confusion.

LLVM is very intereting! 

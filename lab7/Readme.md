## Bug Report
First off, I couldn't get scanf to work with the functions. I could get get it to input a number and than immediately print the same number, but I couldn't get it to pass the number to the function. I'm honestly completely confused as to why. I searched for several hours, and tried a ton of different ideas people had online. I also tried making a test.c and compiling it. That was how I was able to get it to printf after scanning, but not pass it on to anything. Also even with that it seg-faulted at times. Naturally, I assumed this to be my fault, but when I gdb and valgrind it apparently its within the scanf. I'm at a loss on getting it to work.

I was unable to answer problem 3. I tried to look up the floating point. Sorry, I would have asked you questions earlier today, but I hadn't started as I have gotten rather behind in everything.

## Random
Please note that I didn't use cdecl for printf. The reason was clang whined at me if I tried and things online said I should do it this way.

; Function Attrs: nounwind readnone ssp uwtable
define i32 @fib(i32 %n) #0{
  %1 = icmp eq i32 %n, 0
  br i1 %1, label %4, label %2

; <label>:2                         ; preds = %0
  %3 = icmp eq i32 %n, 1
  br i1 %3, label %4, label %5

; <label>:4                         ; preds = %0, %2
  %ans.0 = phi i32[1, %2], [0, %0]
  ret i32 %ans.0

; <label>:5                         ; preds = %2
  %6 = sub i32 %n, 1
  %7 = sub i32 %n, 2
  %8 = call i32 @fib(i32 %6)
  %9 = call i32 @fib(i32 %7)
  %10 = add i32 %8, %9
  ret i32 %10
}

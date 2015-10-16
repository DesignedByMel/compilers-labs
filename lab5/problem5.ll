; ModuleID = 'problem5.c'
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.11.0"

@.str = private unnamed_addr constant [14 x i8] c"Postitive: %d\00", align 1
@.str1 = private unnamed_addr constant [11 x i8] c"\0AEqual: %d\00", align 1
@.str2 = private unnamed_addr constant [14 x i8] c"\0ANegative: %d\00", align 1

; Function Attrs: nounwind readnone ssp uwtable
define i32 @f(i32 %n, i32 %choice) #0 {
  %1 = icmp eq i32 %choice, 0
  br i1 %1, label %4, label %6

; <label>:2                                       ; preds = %6
  %3 = mul nsw i32 %n, 100
  br label %4

; <label>:4                                       ; preds = %0, %2, %8
  %ans.0 = phi i32 [ %3, %2 ], [ %n, %0 ], [%9, %8]
  %5 = add nsw i32 %ans.0, 100
  ret i32 %5

; <label>:6                                       ; preds = %0
  %7 = icmp slt i32 %choice, 0
  br i1 %7, label %8, label %2

; <label>:8                                       ; preds = %6
  %9 = mul nsw i32 %n, 2
  br label %4
}

; Function Attrs: nounwind ssp uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %argv) #1 {
  %1 = tail call i32 @f(i32 2, i32 1)
  %2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str, i64 0, i64 0), i32 %1) #3
  %3 = tail call i32 @f(i32 2, i32 0)
  %4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str1, i64 0, i64 0), i32 %3) #3
  %5 = tail call i32 @f(i32 2, i32 -1)
  %6 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str2, i64 0, i64 0), i32 %5) #3
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

attributes #0 = { nounwind readnone ssp uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+ssse3,+cx16,+sse,+sse2,+sse3" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind ssp uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+ssse3,+cx16,+sse,+sse2,+sse3" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+ssse3,+cx16,+sse,+sse2,+sse3" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"PIC Level", i32 2}
!1 = !{!"Apple LLVM version 7.0.0 (clang-700.0.72)"}

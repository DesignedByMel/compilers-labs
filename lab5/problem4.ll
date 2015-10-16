; ModuleID = 'problem4.c'
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.11.0"

; Function Attrs: nounwind readnone ssp uwtable
define i32 @f(i32 %n, i32 %choice) #0 {
  %1 = icmp eq i32 %choice, 0
  br i1 %1, label %2, label %4

; <label>:2                                       ; preds = %0
  %3 = mul nsw i32 %n, 100
  br label %4

; <label>:4                                       ; preds = %0, %2
  %ans.0 = phi i32 [ %3, %2 ], [ %n, %0 ]
  %5 = add nsw i32 %ans.0, 100
  ret i32 %5
}

; Function Attrs: nounwind readnone ssp uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %argv) #0 {
  ret i32 0
}

attributes #0 = { nounwind readnone ssp uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+ssse3,+cx16,+sse,+sse2,+sse3" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"PIC Level", i32 2}
!1 = !{!"Apple LLVM version 7.0.0 (clang-700.0.72)"}

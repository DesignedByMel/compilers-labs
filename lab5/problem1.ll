; ModuleID = 'problem1.c'
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.11.0"

@.str = private unnamed_addr constant [15 x i8] c"floatfunc: %f\0A\00", align 1
@.str1 = private unnamed_addr constant [15 x i8] c"ackermann: %i\0A\00", align 1

; Function Attrs: nounwind ssp uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call float @floatfunc(i32 10, float 0x4024666660000000)
  %5 = fpext float %4 to double
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str, i32 0, i32 0), double %5)
  %7 = call i32 @ackermann(i32 6, i32 6)
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str1, i32 0, i32 0), i32 %7)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind ssp uwtable
define float @floatfunc(i32 %x, float %y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca float, align 4
  %ans = alloca float, align 4
  store i32 %x, i32* %1, align 4
  store float %y, float* %2, align 4
  %3 = load i32* %1, align 4
  %4 = sitofp i32 %3 to float
  store float %4, float* %ans, align 4
  %5 = load float* %2, align 4
  %6 = fpext float %5 to double
  %7 = load i32* %1, align 4
  %8 = sitofp i32 %7 to double
  %9 = call double @llvm.pow.f64(double %6, double %8)
  %10 = load float* %ans, align 4
  %11 = fpext float %10 to double
  %12 = fmul double %11, %9
  %13 = fptrunc double %12 to float
  store float %13, float* %ans, align 4
  %14 = load float* %2, align 4
  %15 = fpext float %14 to double
  %16 = call double @sin(double %15) #2
  %17 = load float* %ans, align 4
  %18 = fpext float %17 to double
  %19 = fsub double %18, %16
  %20 = fptrunc double %19 to float
  store float %20, float* %ans, align 4
  %21 = load float* %ans, align 4
  ret float %21
}

; Function Attrs: nounwind ssp uwtable
define i32 @ackermann(i32 %m, i32 %n) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %m, i32* %2, align 4
  store i32 %n, i32* %3, align 4
  %4 = load i32* %2, align 4
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %9

; <label>:6                                       ; preds = %0
  %7 = load i32* %3, align 4
  %8 = add nsw i32 %7, 1
  store i32 %8, i32* %1
  br label %24

; <label>:9                                       ; preds = %0
  %10 = load i32* %3, align 4
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %16

; <label>:12                                      ; preds = %9
  %13 = load i32* %2, align 4
  %14 = sub nsw i32 %13, 1
  %15 = call i32 @ackermann(i32 %14, i32 1)
  store i32 %15, i32* %1
  br label %24

; <label>:16                                      ; preds = %9
  %17 = load i32* %2, align 4
  %18 = sub nsw i32 %17, 1
  %19 = load i32* %2, align 4
  %20 = load i32* %3, align 4
  %21 = sub nsw i32 %20, 1
  %22 = call i32 @ackermann(i32 %19, i32 %21)
  %23 = call i32 @ackermann(i32 %18, i32 %22)
  store i32 %23, i32* %1
  br label %24

; <label>:24                                      ; preds = %16, %12, %6
  %25 = load i32* %1
  ret i32 %25
}

; Function Attrs: nounwind readnone
declare double @llvm.pow.f64(double, double) #2

; Function Attrs: nounwind readnone
declare double @sin(double) #3

attributes #0 = { nounwind ssp uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+ssse3,+cx16,+sse,+sse2,+sse3" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+ssse3,+cx16,+sse,+sse2,+sse3" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+ssse3,+cx16,+sse,+sse2,+sse3" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"PIC Level", i32 2}
!1 = !{!"Apple LLVM version 7.0.0 (clang-700.0.72)"}

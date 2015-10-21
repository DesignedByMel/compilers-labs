define i32 @phiNod(i32 %a, i32 %b, i32 %c) {

  ; compare a == 1
  %1 = icmp eq i32 %a, 1
  br i1 %1, label %6, label %2

  ; compare a == 2
; <label>:2                     preds : %0
  %3 = icmp eq i32 %a, 2
  br i1 %3, label %8, label %4

  ; compare a == 3
; <label>:4                    preds : %2
  %5 = icmp eq i32 %a, 3
  br i1 %5, label %12, label %10

  ; if a = 1, b + c
; <label>:6                    preds : %0
  %7 = add nsw i32 %b, %c
  br label %14

  ; if a = 2, b * c
; <label>:8                    preds : %2
  %9 = mul nsw i32 %b, %c
  br label %14

  ; return -1 if a not 1, 2, or 3
; <label>:10                    preds : %4
  %11 = sub nsw i32 0, 1
  ret i32 %11

  ; if a = 3, b^c using loops
; <label>:12                  preds : %4
  br label %13

; <label>:13                  preds : %12, %13
  %i = phi i32 [0, %12], [%i.next, %13]
  %b.1 = phi i32 [1, %12], [%b.next, %13]

  %b.next = mul i32 %b.1, %b
  %i.next = add i32 %i, 1
  %cond = icmp slt i32 %i.next, %c
  br i1 %cond, label %13, label %14

  ; return ans + b
; <label>:14                    preds : %6, %8, %13
  %ans.0 = phi i32 [%7, %6], [%9, %8], [%b.next, %13]
  %ret.type = add nsw i32 %ans.0, %b
  ret i32 %ret.type

}

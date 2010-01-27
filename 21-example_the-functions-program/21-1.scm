; The get-args procedure has a let that creates the variable first, and then
; that variable is used only once inside the body of the let. Why doesn't it just say the
; following?
;
; (define (get-args n)
;    (if (= n 0)
;       '()
;       (cons (get-arg) (get-args (- n 1)))))


; Solution: This is done so we can be sure of the order of execution. We need the result
; of the call to "get-arg" returned before we make a recursive step.

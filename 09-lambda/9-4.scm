; The following program doesn’t work. Why not? Fix it.
;
; (define (who sent)
;    (every describe ’(pete roger john keith)))
;
; (define (describe person)
;    (se person sent))
;
; It’s supposed to work like this:
;
; > (who ’(sells out))
; (pete sells out roger sells out john sells out keith sells out)
;
; In each of the following exercises, write the procedure in terms of lambda and
; higher-order functions. Do not use named helper procedures. If you’ve read Part IV,
; don’t use recursion, either.


; It doesn't work because the helper procedure 'describe' refers to an unnamed variable 'sent'.

(define (who sent)
  (every (lambda (wd) (se wd sent)) '(pete roger john keith)))

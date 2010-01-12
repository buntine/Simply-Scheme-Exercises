; Describe the result of calling the following procedure with a list as its argument.
; (See if you can figure it out before you try it.)
;
; (define (mystery lst)
;   (mystery-helper lst ’()))
;
; (define (mystery-helper lst other)
;   (if (null? lst)
;     other
;     (mystery-helper (cdr lst) (cons (car lst) other))))


; Solution: This procedure will return a reversed copy of the list that it is supplied with.
;           '(2 4 +)  ->  '(+ 2 4)

; Write a procedure first-last whose argument will be a sentence. It should
; return a sentence containing only those words in the argument sentence whose first and
; last letters are the same:
;
; > (first-last ’(california ohio nebraska alabama alaska massachusetts))
; (OHIO ALABAMA ALASKA)

(define (first-last sent)
  (keep (lambda (wd) (equal? (first wd) (last wd))) sent))

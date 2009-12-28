; > (odds ’(i lost my little girl))
; (I MY GIRL)

; Classification: keep + helper

(define (odds-helper n sent)
  (cond ((empty? sent) sent)
        ((= (remainder n 2) 0) (odds-helper (+ n 1) (bf sent)))
        (else (se (first wd) (odds-helper (+ n 1) (bf sent))))))

(define (odds sent)
  (odds-helper 1 sent))

; Rewrite the true-for-all? procedure from Exercise 8.10. Do not use every,
; keep, or accumulate

; Not sure if I've cheated here. I reimplemented keep, but it's recursive.

(define (keep2 pred sent)
  (if (word? sent)
    (combine pred sent word "")
    (combine pred sent se '())))

(define (combine pred sent combiner null-value)
  (cond
    ((empty? sent) null-value)
    ((pred (first sent))
      (combiner (first sent) (combine pred (butfirst sent)
                                      combiner null-value)))
    (else (combine pred (butfirst sent)
                   combiner null-value))))

(define (true-for-all? pred sent)
 (= (count sent) (count (keep2 pred sent))))

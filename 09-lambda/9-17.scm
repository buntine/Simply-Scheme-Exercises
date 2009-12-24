; Write keep in terms of every and accumulate.

; Andy note: This one stumped me for a bit. Works with words and sentences.

(define (newkeep f n)
  (let ((accum (if (sentence? n) se word)))
    (accumulate accum
                (every (lambda (wd)
                         (if (f wd) wd '())) n))))

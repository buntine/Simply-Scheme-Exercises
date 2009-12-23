; Write an exaggerate procedure which exaggerates sentences:
;
; > (exaggerate '(i ate 3 potstickers))
; (I ATE 6 POTSTICKERS)
;
; > (exaggerate '(the chow fun is good here))
; (THE CHOW FUN IS GREAT HERE)
;
; It should double all the numbers in the sentence, and it should replace "good" with
; "great," "bad" with "terrible," and anything else you can think of.

(define (double n)
  (* n 2))

(define (exaggerate-word wd)
  (cond ((equal? wd 'good) 'great)
        ((equal? wd 'bad) 'terrible)
        ((equal? wd 'nice) 'fantastic)
        ((equal? wd 'small) 'tiny)
        ((equal? wd 'big) 'huge)
        (else wd)))

(define (exaggerate se)
  (let ((parse-word (lambda (wd)
                     (if (number? wd)
                       (double wd)
                       (exaggerate-word wd)))))
    (every parse-word se)))

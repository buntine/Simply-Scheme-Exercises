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

(define (parse-word wd)
  (if (number? wd)
    (double wd)
    (cond ((equal? wd 'good) 'great)
          ((equal? wd 'bad) 'terrible)
          ((equal? wd 'nice) 'fantastic)
          ((equal? wd 'small) 'tiny)
          ((equal? wd 'big) 'huge)
          ((equal? wd 'like) 'love)
          (else wd))))
  
(define (exaggerate sent)
  (if (empty? sent)
    '()
    (se
      (parse-word (first sent))
      (exaggerate (bf sent)))))

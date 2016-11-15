;Fix the bug in the following definition:

;(define (acronym sent)                       ;; wrong
;  (if (= (count sent) 1)
;      (first sent)
;      (word (first (first sent))
;	    (acronym (bf sent)))))









(define (acronym sent)                    
  (if (= (count sent) 1)
      (first (first sent))
      (word (first (first sent))
            (acronym (bf sent)))))

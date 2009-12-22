; The following procedure does some redundant computation.
;
; (define (gertrude wd)
;   (se (if (vowel? (first wd)) 'an 'a)
;       wd
;       'is
;       (if (vowel? (first wd)) 'an 'a)
;       wd
;       'is
;       (if (vowel? (first wd)) 'an 'a)
;       wd))
;
; > (gertrude ’rose)
; (A ROSE IS A ROSE IS A ROSE)
;
; > (gertrude ’iguana)
; (AN IGUANA IS AN IGUANA IS AN IGUANA)
;
; Use let to avoid the redundant work.

(define (vowel? c)
  (member? c 'aeiou))

(define (gertrude wd)
  (let ((article (if (vowel? (first wd)) 'an 'a)))
    (se article wd 'is article wd 'is article wd)))

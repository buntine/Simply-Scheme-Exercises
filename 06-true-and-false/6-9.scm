; Sometimes you must choose the singular or the plural of a word: 1 book but
; 2 books. Write a procedure thismany that takes two arguments, a number and a
; singular noun, and combines them appropriately:
;
; > (thismany 1 ’partridge)
; (1 PARTRIDGE)
;
; > (thismany 3 ’french-hen)
; (3 FRENCH-HENS)

(define (plural wd)
  (if (equal? (last wd) 'y)
    (word (bl wd) 'ies)
    (word wd 's)))

(define (this-many quant obj)
  (sentence
    quant
    (if (> quant 1) (plural obj) obj)))

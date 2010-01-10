; A "palindrome" is a sentence that reads the same backward as forward. Write a
; predicate palindrome? that takes a sentence as argument and decides whether it is a
; palindrome. For example:
;
; > (palindrome? '(flee to me remote elf))
;
; #T
; > (palindrome? '(flee to me remote control))
;
; #F
; Do not reverse any words or sentences in your solution.

(define (implode sent)
  (accumulate word sent))

(define (check-palindrome wd)
  (if (<= (count wd) 1)
    #t
    (and (equal? (first wd) (last wd))
         (check-palindrome (bf (bl wd))))))

(define (palindrome? sent)
  (check-palindrome (implode sent)))

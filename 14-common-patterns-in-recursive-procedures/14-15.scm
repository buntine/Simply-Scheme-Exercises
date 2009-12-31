; Write merge, a procedure that takes two sentences of numbers as arguments.
; Each sentence must consist of numbers in increasing order. Merge should return a single
; sentence containing all of the numbers, in order. (We’ll use this in the next chapter as
; part of a sorting algorithm.)
;
; > (merge ’(4 7 18 40 99) ’(3 6 9 12 24 36 50))
; (3 4 6 7 9 12 18 24 36 40 50 99)

(define (merge-value-helper n left right)
  (if (empty? right)
    (se left n)
    (if (>= (first right) n)
      (se left n right)
      (merge-value-helper
        n
        (se left (first right))
        (bf right)))))

(define (merge-value n nums)
  (merge-value-helper n '() nums))

(define (merge nums-a nums-b)
  (cond ((empty? nums-b) nums-a)
        ((empty? nums-a) nums-b)
        (else
          (merge (merge-value (first nums-b) nums-a)
                 (bf nums-b)))))

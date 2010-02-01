; Write a procedure sum-vector that takes a vector full of numbers as its argument
; and returns the sum of all the numbers:
;
; > (sum-vector ’#(6 7 8))
; 21

(define (sum-vector nums)
  (sum-vector-helper nums 0))

(define (sum-vector-helper nums index)
  (if (= index (vector-length nums))
    0
    (+ (vector-ref nums index)
       (sum-vector-helper nums (+ 1 index)))))

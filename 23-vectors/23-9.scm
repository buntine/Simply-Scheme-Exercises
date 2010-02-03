; Write a procedure leader that says which car is in the lead right now.

(define *lap-vector* (make-vector 100))
(define *total-laps* 5)

(define (initialize-lap-vector index)
  (if (< index 0)
    'done
    (begin (vector-set! *lap-vector* index 0)
           (initialize-lap-vector (- index 1)))))

(define (leader)
  (leader-helper 0 0))

(define (leader-helper index car-number)
  (cond ((= index 99) car-number)
        ((> (vector-ref *lap-vector* index)
            (vector-ref *lap-vector* car-number))
          (leader-helper (+ index 1) index))
        (else
          (leader-helper (+ index 1) car-number))))

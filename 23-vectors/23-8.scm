; Modify the lap procedure to print "Car 34 wins!" when car 34 completes its 200th
; lap. (A harder but more correct modification is to print the message only if no other car
; has completed 200 laps.)

(define *lap-vector* (make-vector 100))
(define *total-laps* 5)

(define (initialize-lap-vector index)
  (if (< index 0)
    'done
    (begin (vector-set! *lap-vector* index 0)
           (initialize-lap-vector (- index 1)))))

(define (lap car-number)
  (vector-set! *lap-vector*
               car-number
               (+ (vector-ref *lap-vector* car-number) 1))
  (let ((lap-number (vector-ref *lap-vector* car-number)))
    (if (and (= lap-number *total-laps*)
             (not (already-a-winner? car-number)))
      (begin (display "Car ")
             (display car-number)
             (display " wins!")))
    lap-number))

(define (already-a-winner? ignore-car)
  (a-a-w-helper? ignore-car 0))

(define (a-a-w-helper? ignore-car index)
  (cond ((= index (vector-length *lap-vector*)) #f)
        ((= index ignore-car)
           (a-a-w-helper? ignore-car (+ index 1)))
        ((>= (vector-ref *lap-vector* index) *total-laps*) #t)
        (else
           (a-a-w-helper? ignore-car (+ index 1)))))

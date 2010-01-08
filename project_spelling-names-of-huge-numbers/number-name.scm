(define quantities '(thousand million billion trillion quadrillion quintillion
                     sextillion septillion octillion nonillion decillion))

(define (butlast-n wd n)
  ((repeated bl n) wd))

(define (last-n wd n)
  ((repeated bf (- (count wd) n)) wd))

(define (first-n wd n)
  ((repeated bl (- (count wd) n)) wd))

(define (groups-of-three sent)
  (cond ((word? sent) (groups-of-three (se sent)))
        ((> (count (first sent)) 3)
          (groups-of-three 
            (se (butlast-n (first sent) 3)
                (last-n (first sent) 3)
                (bf sent))))
        (else sent)))

(define (print-quantities n)
  n)

(define (print-magnitude nums m)
  (if (not (number? (first (bf nums))))
    nums
    (let ((onlynums (keep (lambda (n) (number? n)) nums))
          (increment (/ (+ m 1) 2)))
      (print-magnitude
        (se (first-n onlynums (- (count onlynums) increment))
            (item increment quantities)
            (last-n nums m)) (+ m 2)))))

(define (number-name n)
  (print-quantities
    (if (< n 999)
      (se n)
      (print-magnitude
        (groups-of-three n) 1))))

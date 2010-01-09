(define quantities '(thousand million billion trillion quadrillion quintillion
                     sextillion septillion octillion nonillion decillion))

(define (butlast-n wd n)
  ((repeated bl n) wd))

(define (last-n wd n)
  ((repeated bf (- (count wd) n)) wd))

(define (first-n wd n)
  ((repeated bl (- (count wd) n)) wd))

; Breaks the supplied word into a sentence of three-word groups.
; '1222333899 -> '(1 222 333 899)
(define (groups-of-three sent)
  (cond ((word? sent) (groups-of-three (se sent)))
        ((> (count (first sent)) 3)
          (groups-of-three 
            (se (butlast-n (first sent) 3)
                (last-n (first sent) 3)
                (bf sent))))
        (else sent)))

; Translates each number group into an English equivalant.
(define (print-quantities n)
  n)

; Inserts the magnitudes for each group of numbers.
; Any set of three zeroes are ignored.
(define (print-magnitudes nums m i)
  (cond ((= (count nums) m)
          nums)
        ((= (item (- (count nums) m) nums) "000")
          (print-magnitudes nums (+ m 1) (+ i 1)))
        (else
          (print-magnitudes
            (se (butlast-n nums m)
              (item i quantities)
              (last-n nums m)) (+ m 2) (+ i 1)))))

; Consumes an arbitrary-sized number and presents
; and English-language version of it.
(define (number-name n)
  (let ((nums (groups-of-three n)))
    (print-quantities
      (if (< n 999)
        (se n)
        (keep
          (lambda (n) (not (equal? n "000")))
          (se (print-magnitudes
            (bl nums) 0 1) (last nums)))))))

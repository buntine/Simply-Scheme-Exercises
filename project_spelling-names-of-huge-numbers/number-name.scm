(define quantities '(thousand million billion trillion quadrillion quintillion
                     sextillion septillion octillion nonillion decillion))

(define (butlast-n wd n)
  ((repeated bl n) wd))

(define (last-n wd n)
  ((repeated bf (- (count wd) n)) wd))

(define (first-n wd n)
  ((repeated bl (- (count wd) n)) wd))

(define (teen? n)
  (and (> n 10) (> 20 n)))

(define (hundreds n)
  (se (ones n) 'hundred))

(define (tens n)
  (cond ((= n 9) 'ninety) ((= n 8) 'eighty)
        ((= n 7) 'seventy) ((= n 6) 'sixty)
        ((= n 5) 'fifty) ((= n 4) 'forty)
        ((= n 3) 'thirty) ((= n 2) 'twenty)
        (else 'ten)))

(define (ones n)
  (cond ((= n 9) 'nine) ((= n 8) 'eight)
        ((= n 7) 'seven) ((= n 6) 'six)
        ((= n 5) 'five) ((= n 4) 'four)
        ((= n 3) 'three) ((= n 2) 'two)
        (else 'one)))
 
(define (teen n)
  (cond ((= n 19) 'nineteen) ((= n 18) 'eighteen)
        ((= n 17) 'seventeen) ((= n 16) 'sixteen)
        ((= n 15) 'fifteen) ((= n 14) 'fourteen)
        ((= n 13) 'thirteen) ((= n 12) 'twelve)
        (else 'eleven)))
 
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

; Translates a three digit (or smaller) number into it's
; English equivalent.
(define (translate n)
  (let ((tr (lambda (i f) (if (= i 0) '() (f i)))))
    (if (teen? n)
      (teen n)
      (cond ((= (count n) 1) (tr n ones))   ; 1-9
            ((= (count n) 2)                ; 10 - 99
              (if (teen? n)
                (teen n)
                (se (tr (first n) tens) (tr (last n) ones))))
            (else                           ; 100 - 999
              (se
                (tr (first n) hundreds)
                (if (teen? (last-n n 2))
                  (teen (last-n n 2))
                  (se (tr (first (bf n)) tens)
                      (tr (last n) ones)))))))))

; Translates each number group into it's equivalant.
(define (print-quantities sent)
  (every
    (lambda (wd)
      (if (number? wd) (translate wd) wd))
    sent))

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
    (if (= n 0)
      'zero
      (se (print-quantities
        (if (< n 999)
          (se n)
          (keep
            (lambda (n) (not (equal? n "000")))
            (se (print-magnitudes
                  (bl nums) 0 1) (last nums)))))))))

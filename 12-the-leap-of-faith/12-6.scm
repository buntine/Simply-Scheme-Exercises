; Write a GPA procedure. It should take a sentence of grades as its argument
; and return the corresponding grade point average:
;
; > (gpa ’(A A+ B+ B))
; 3.67

(define (base-grade g)
  (let ((grade (first g)))
    (cond ((equal? grade 'a) 4)
          ((equal? grade 'b) 3)
          ((equal? grade 'c) 2)
          ((equal? grade 'd) 1)
          ((equal? grade 'f) 0)
          (else 0))))

(define (grade-modifier g)
  (if (<= (count g) 1)
    0
    (+ 0 (word (bf g) 0.33))))

(define (count-points grades)
    (if (empty? grades)
      0
      (let ((g (first grades)))
        (+ (+ (base-grade g)
              (grade-modifier g))
           (count-points (bf grades))))))

(define (gpa grades)
  (/ (count-points grades) (count grades)))

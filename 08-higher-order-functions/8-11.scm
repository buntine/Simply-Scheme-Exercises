; Write a GPA procedure. It should take a sentence of grades as its argument
; and return the corresponding grade point average:
;
; > (gpa ’(A A+ B+ B))
; 3.67
;
; Hint: write a helper procedure base-grade that takes a grade as argument and returns
; 0, 1, 2, 3, or 4, and another helper procedure grade-modifier that returns −.33, 0, or
; .33, depending on whether the grade has a minus, a plus, or neither.

(define (base-grade g)
  (let ((grade (first g)))
    (cond ((equal? grade 'a) 4)
          ((equal? grade 'b) 3)
          ((equal? grade 'c) 2)
          ((equal? grade 'd) 1)
          ((equal? grade 'f) 0)
          (else 0))))

(define (grade-modifier g)
  (if (= (count g) 1)
    0
    (+ 0 (word (bf g) 0.33))))

(define (gpa grades)
  (let ((final-grade
           (lambda (g)
             (+ (base-grade g) (grade-modifier g)))))
    (/ (accumulate + (every final-grade grades)) (count grades))))

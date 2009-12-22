; Write a better greet procedure that understands as many different kinds of names
; as you can think of:
;
; > (greet ’(john lennon))
; (HELLO JOHN)
;
; > (greet ’(dr marie curie))
; (HELLO DR CURIE)
;
; > (greet ’(dr martin luther king jr))
; (HELLO DR KING)
;
; > (greet ’(queen elizabeth))
; (HELLO YOUR MAJESTY)
;
; > (greet ’(david livingstone))
; (DR LIVINGSTONE I PRESUME?)
;
; Andy note: The plural precedure was presented during this chapters text. It was defined
; as:
;
; (define (greet name)
;   (se ’(pleased to meet you)
;       (if (equal? (first name) ’professor)
;           (se ’professor (last name))
;           (first name))
;       ’(-- how are you?)))

(define (known-doctor? name)
  (or (equal? name '(david livingstone))
      (equal? name '(james mcintire))
      (equal? name '(barry windicus))))

(define (credential? wd)
  (or (equal? wd 'dr) (equal? wd 'sir)
      (equal? wd 'ms) (equal? wd 'mrs)
      (equal? wd 'mr) (equal? wd 'bishop)))

(define (suffix? wd)
  (or (equal? wd 'jr) (equal? wd 'snr)))

(define (first-name name)
  (if (credential? (first name))
    (first (bf name))
    (first name)))

(define (last-name name)
  (if (suffix? (last name))
    (last (bl name))
    (last name)))

(define (greet name)
  (cond
    ((known-doctor? name) (se 'dr (last-name name) '(I presume?)))
    ((equal? (first name) 'dr) (se '(hello dr) (last-name name)))
    ((equal? (first name) 'queen) (se '(hello your majesty)))
    ((equal? (first name) 'king) (se '(yo king of rottingham)))
    (else (se 'hello (first-name name)))))

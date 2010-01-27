; Every time we want to know something about a function that the user typed in,
; such as its number of arguments or its domain-checking predicate, we have to do an
; assoc in *the-functions*. That’s inefficient. Instead, rewrite the program so that
; get-fn returns a function's entry from the a-list, instead of just its name. Then rename
; the variable fn-name to fn-entry in the functions-loop procedure, and rewrite
; the selectors scheme-procedure, arg-count, and so on, so that they don't invoke
; assoc.

(define (functions)
  ;; (read-line)
  (show "Welcome to the FUNCTIONS program.")
  (functions-loop))

(define (functions-loop)
  (let ((fn-entry (get-fn)))
    (if (equal? (first fn-entry) 'exit)
      "Thanks for using FUNCTIONS!"
      (let ((args (get-args (arg-count fn-entry))))
        (if (not (in-domain? args fn-entry))
           (show "Argument(s) not in domain.")
           (show-answer (apply (scheme-function fn-entry) args)))
        (functions-loop)))))

(define (get-fn)
  (display "Function: ")
  (let ((line (read-line)))
    (cond ((empty? line)
            (show "Please type a function!")
            (get-fn))
          ((not (= (count line) 1))
            (show "You typed more than one thing! Try again.")
            (get-fn))
          ((not (valid-fn-name? (first line)))
            (show "Sorry, that’s not a function.")
            (get-fn))
          (else (assoc (first line) *the-functions*)))))

(define (get-arg)
  (display "Argument: ")
  (let ((line (read-line)))
    (cond ((empty? line)
            (show "Please type an argument!")
            (get-arg))
          ((and (equal? "(" (first (first line)))
                (equal? ")" (last (last line))))
            (let ((sent (remove-first-paren (remove-last-paren line))))
              (if (any-parens? sent)
                (begin
                  (show "Sentences can’t have parentheses inside.")
                  (get-arg))
                (map booleanize sent))))
          ((any-parens? line)
            (show "Bad parentheses")
            (get-arg))
          ((empty? (bf line)) (booleanize (first line)))
          (else (show "You typed more than one argument! Try again.")
                (get-arg)))))

(define (get-args n)
  (if (= n 0)
    '()
    (let ((first (get-arg)))
      (cons first (get-args (- n 1))))))

(define (any-parens? line)
  (let ((letters (accumulate word line)))
    (or (member? "(" letters)
        (member? ")" letters))))

(define (remove-first-paren line)
  (if (equal? (first line) "(")
    (bf line)
    (se (bf (first line)) (bf line))))

(define (remove-last-paren line)
  (if (equal? (last line) ")")
    (bl line)
    (se (bl line) (bl (last line)))))

(define (booleanize x)
  (cond ((equal? x "#t") #t)
        ((equal? x "#f") #f)
        (else x)))

(define (show-answer answer)
  (newline)
  (display "The result is: ")
  (if (not answer)
    (show "#F")
    (show answer))
  (newline))

(define (scheme-function fn-entry)
  (cadr fn-entry))

(define (arg-count fn-entry)
  (caddr fn-entry))

(define (type-predicate fn-entry)
  (cadddr fn-entry))

(define (in-domain? args fn-entry)
  (apply (type-predicate fn-entry) args))


;; Type predicates

(define (word-or-sent? x)
  (or (word? x) (sentence? x)))

(define (not-empty? x)
  (and (word-or-sent? x) (not (empty? x))))

(define (two-numbers? x y)
  (and (number? x) (number? y)))

(define (two-reals? x y)
  (and (real? x) (real? y)))

(define (two-integers? x y)
  (and (integer? x) (integer? y)))

(define (can-divide? x y)
  (and (number? x) (number? y) (not (= y 0))))

(define (dividable-integers? x y)
  (and (two-integers? x y) (not (= y 0))))

(define (trig-range? x)
  (and (number? x) (<= (abs x) 1)))

(define (hof-types-ok? fn-name stuff range-predicate)
  (and (valid-fn-name? fn-name)
       (= 1 (arg-count fn-name))
       (word-or-sent? stuff)
       (empty? (keep (lambda (element)
                       (not ((type-predicate fn-name) element)))
                     stuff))
       (null? (filter (lambda (element)
                        (not (range-predicate element)))
                      (map (scheme-function fn-name)
                           (every (lambda (x) x) stuff))))))

(define (member-types-ok? small big)
  (and (word? small)
       (or (sentence? big) (and (word? big) (= (count small) 1)))))


;; Names of functions as functions

(define (named-every fn-name list)
  (every (scheme-function fn-name) list))

(define (named-keep fn-name list)
  (keep (scheme-function fn-name) list))

(define (valid-fn-name? name)
  (assoc name *the-functions*))


;; The list itself

(define *the-functions*
  (list (list '* * 2 two-numbers?)
        (list '+ + 2 two-numbers?)
        (list '- - 2 two-numbers?)
        (list '/ / 2 can-divide?)
        (list '< < 2 two-reals?)
        (list '<= <= 2 two-reals?)
        (list '= = 2 two-numbers?)
        (list '> > 2 two-reals?)
        (list '>= >= 2 two-reals?)
        (list 'abs abs 1 real?)
        (list 'acos acos 1 trig-range?)
        (list 'and (lambda (x y) (and x y)) 2
              (lambda (x y) (and (boolean? x) (boolean? y))))
        (list 'appearances appearances 2 member-types-ok?)
        (list 'asin asin 1 trig-range?)
        (list 'atan atan 1 number?)
        (list 'bf bf 1 not-empty?)
        (list 'bl bl 1 not-empty?)
        (list 'butfirst butfirst 1 not-empty?)
        (list 'butlast butlast 1 not-empty?)
        (list 'ceiling ceiling 1 real?)
        (list 'cos cos 1 number?)
        (list 'count count 1 word-or-sent?)
        (list 'equal? equal? 2 (lambda (x y) #t))
        (list 'even? even? 1 integer?)
        (list 'every named-every 2
              (lambda (fn stuff)
                (hof-types-ok? fn stuff word-or-sent?)))
        (list 'exit '() 0 '())     ; in case user applies number-of-arguments to exit
        (list 'exp exp 1 number?)
        (list 'expt expt 2
              (lambda (x y)
                (and (number? x) (number? y)
                     (or (not (real? x)) (>= x 0) (integer? y)))))
        (list 'first first 1 not-empty?)
        (list 'floor floor 1 real?)
        (list 'gcd gcd 2 two-integers?)
        (list 'if (lambda (pred yes no) (if pred yes no)) 3
              (lambda (pred yes no) (boolean? pred)))
        (list 'item item 2
              (lambda (n stuff)
                (and (integer? n) (> n 0)
                     (word-or-sent? stuff) (<= n (count stuff)))))
        (list 'keep named-keep 2
              (lambda (fn stuff)
                (hof-types-ok? fn stuff boolean?)))
        (list 'last last 1 not-empty?)
        (list 'lcm lcm 2 two-integers?)
        (list 'log log 1 (lambda (x) (and (number? x) (not (= x 0)))))
        (list 'max max 2 two-reals?)
        (list 'member? member? 2 member-types-ok?)
        (list 'min min 2 two-reals?)
        (list 'modulo modulo 2 dividable-integers?)
        (list 'not not 1 boolean?)
        (list 'number-of-arguments arg-count 1 valid-fn-name?)
        (list 'odd? odd? 1 integer?)
        (list 'or (lambda (x y) (or x y)) 2
              (lambda (x y) (and (boolean? x) (boolean? y))))
        (list 'quotient quotient 2 dividable-integers?)
        (list 'random random 1 (lambda (x) (and (integer? x) (> x 0))))
        (list 'remainder remainder 2 dividable-integers?)
        (list 'round round 1 real?)
        (list 'se se 2
              (lambda (x y) (and (word-or-sent? x) (word-or-sent? y))))
        (list 'sentence sentence 2
              (lambda (x y) (and (word-or-sent? x) (word-or-sent? y))))
        (list 'sentence? sentence? 1 (lambda (x) #t))
        (list 'sin sin 1 number?)
        (list 'sqrt sqrt 1 (lambda (x) (and (real? x) (>= x 0))))
        (list 'tan tan 1 number?)
        (list 'truncate truncate 1 real?)
        (list 'vowel? (lambda (x) (member? x '(a e i o u))) 1
              (lambda (x) #t))
        (list 'word word 2 (lambda (x y) (and (word? x) (word? y))))
        (list 'word? word? 1 (lambda (x) #t))))

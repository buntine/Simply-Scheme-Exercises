; Currently, the program always gives the message "argument(s) not in domain"
; when you try to apply a function to bad arguments. Modify the program so that each
; record in *the-functions* also contains a specific out-of-domain message like "both
; arguments must be numbers," then modify functions to look up and print this error
; message along with "argument(s) not in domain."

(define (functions)
  ;; (read-line)
  (show "Welcome to the FUNCTIONS program.")
  (functions-loop))

(define (functions-loop)
  (let ((fn-entry (get-fn)))
    (if (equal? (first fn-entry) 'exit)
      "Thanks for using FUNCTIONS!"
      (let ((args (get-args (arg-count fn-entry) 1)))
        (if (not (in-domain? args fn-entry))
          (begin
            (display "Argument(s) not in domain: ")
            (display (caddddr fn-entry))
            (newline))
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

(define (get-arg n)
  (if (> n 0)
    (begin
      (display (digit-to-position n))
      (display " ")))
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

(define (get-args n argno)
  (if (= n 0)
    '()
    (let ((first (get-arg (if (and (= n 1) (= argno 1))
                            0
                            argno))))
      (cons first (get-args (- n 1) (+ argno 1))))))

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


;; Generic helper procedures

(define (digit-to-position n)
  (if (and (> n 0) (> 10 n))
    (cadr
      (assoc n (list (list 1 "First") (list 2 "Second")
                     (list 3 "Third") (list 4 "Fourth")
                     (list 5 "Fifth") (list 6 "Sixth")
                     (list 7 "Seventh") (list 8 "Eighth")
                     (list 9 "Ninth") (list 10 "Tenth"))))
    "First"))

(define (caddddr lst)
  (cadr (cdddr lst)))

(define (err-message type)
  (cond ((equal? type 'num) "argument must be numeric")
        ((equal? type 'nums) "arguments must both be numeric")
        (else "fuck you")))


;; The list itself

(define *the-functions*
  (list (list '* * 2 two-numbers? (err-message 'nums))
        (list '+ + 2 two-numbers? (err-message 'nums))
        (list '- - 2 two-numbers? (err-message 'nums))
        (list '/ / 2 can-divide? (err-message 'divide))
        (list '< < 2 two-reals? (err-message 'reals))
        (list '<= <= 2 two-reals? (err-message 'reals))
        (list '= = 2 two-numbers? (err-message 'nums))
        (list '> > 2 two-reals? (err-message 'reals))
        (list '>= >= 2 two-reals? (err-message 'reals))
        (list 'abs abs 1 real? (err-message 'real))
        (list 'acos acos 1 trig-range? (err-message 'trig))
        (list 'and (lambda (x y) (and x y)) 2
              (lambda (x y) (and (boolean? x) (boolean? y))) (err-message 'bools))
        (list 'appearances appearances 2 member-types-ok? (err-message 'generic))
        (list 'asin asin 1 trig-range? (err-message 'trig))
        (list 'atan atan 1 number? (err-message 'num))
        (list 'bf bf 1 not-empty? (err-message 'nonempty))
        (list 'bl bl 1 not-empty? (err-message 'nonempty))
        (list 'butfirst butfirst 1 not-empty? (err-message 'nonempty))
        (list 'butlast butlast 1 not-empty? (err-message 'nonempty))
        (list 'ceiling ceiling 1 real? (err-message 'real))
        (list 'cos cos 1 number? (err-message 'num))
        (list 'count count 1 word-or-sent? (err-message 'wordorsent))
        (list 'equal? equal? 2 (lambda (x y) #t) "you have fucked it now")
        (list 'even? even? 1 integer? (err-message 'int))
        (list 'every named-every 2
              (lambda (fn stuff)
                (hof-types-ok? fn stuff word-or-sent?)) (err-message 'hoftypes))
        (list 'exit '() 0 '() "None")     ; in case user applies number-of-arguments to exit
        (list 'exp exp 1 number? (err-message 'num))
        (list 'expt expt 2
              (lambda (x y)
                (and (number? x) (number? y)
                     (or (not (real? x)) (>= x 0) (integer? y)))) (err-message 'nums))
        (list 'first first 1 not-empty? (err-message 'nonempty))
        (list 'floor floor 1 real? (err-message 'real))
        (list 'gcd gcd 2 two-integers? (err-message 'ints))
        (list 'if (lambda (pred yes no) (if pred yes no)) 3
              (lambda (pred yes no) (boolean? pred)) (err-message 'bool))
        (list 'item item 2
              (lambda (n stuff)
                (and (integer? n) (> n 0)
                     (word-or-sent? stuff) (<= n (count stuff)))) "item accepts an integer and a word or sentence")
        (list 'keep named-keep 2
              (lambda (fn stuff)
                (hof-types-ok? fn stuff boolean?)) (err-message 'wordorsent))
        (list 'last last 1 not-empty? (err-message 'nonempty))
        (list 'lcm lcm 2 two-integers? (err-message 'ints))
        (list 'log log 1 (lambda (x) (and (number? x) (not (= x 0)))) (err-message 'posint))
        (list 'max max 2 two-reals? (err-message 'reals))
        (list 'member? member? 2 member-types-ok? (err-message 'membertypes))
        (list 'min min 2 two-reals? (err-message 'reals))
        (list 'modulo modulo 2 dividable-integers? (err-message 'divint))
        (list 'not not 1 boolean? (err-message 'bool))
        (list 'number-of-arguments arg-count 1 valid-fn-name?)
        (list 'odd? odd? 1 integer? (err-message 'int))
        (list 'or (lambda (x y) (or x y)) 2
              (lambda (x y) (and (boolean? x) (boolean? y))) (err-message 'bools))
        (list 'quotient quotient 2 dividable-integers? (err-message 'divint))
        (list 'random random 1 (lambda (x) (and (integer? x) (> x 0))) (err-message 'posint))
        (list 'remainder remainder 2 dividable-integers? (err-message 'divint))
        (list 'round round 1 real? (err-message 'real))
        (list 'se se 2
              (lambda (x y) (and (word-or-sent? x) (word-or-sent? y))) (err-message 'wordorsents))
        (list 'sentence sentence 2
              (lambda (x y) (and (word-or-sent? x) (word-or-sent? y))) (err-message 'wordorsents))
        (list 'sentence? sentence? 1 (lambda (x) #t) "None")
        (list 'sin sin 1 number? (err-message 'num))
        (list 'sqrt sqrt 1 (lambda (x) (and (real? x) (>= x 0))) (err-message 'posreal))
        (list 'tan tan 1 number? (err-message 'num))
        (list 'truncate truncate 1 real? (err-message 'real))
        (list 'vowel? (lambda (x) (member? x '(a e i o u))) 1
              (lambda (x) #t) "None")
        (list 'word word 2 (lambda (x y) (and (word? x) (word? y))) (err-message 'words))
        (list 'word? word? 1 (lambda (x) #t) "None")))

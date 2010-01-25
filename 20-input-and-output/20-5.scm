; Our name-table procedure uses a fixed width for the column containing the last
; names of the people in the argument list. Suppose that instead of liking British-invasion
; music you are into late romantic Russian composers:
;
; > (name-table '((piotr tchaikovsky) (nicolay rimsky-korsakov)
;                 (sergei rachmaninov) (modest musorgsky)))
;
; Alternatively, perhaps you like jazz:
; > (name-table '((bill evans) (paul motian) (scott lefaro)))
;
; Modify name-table so that it figures out the longest last name in its argument list, adds
; two for spaces, and uses that number as the width of the first column.

(define (name-table names)
  (name-table-helper names
                     (+ (longest-surname names) 2)))

(define (longest-surname names)
  (if (null? (cdr names))
    (count (cadar names))
    (find-longest-surname (cdr names)
                          (count (cadar names)))))

(define (find-longest-surname names len)
  (if (null? names)
    len
    (let ((namelen (count (cadar names))))
      (find-longest-surname (cdr names)
                            (if (> namelen len)
                              namelen
                              len)))))

(define (name-table-helper names len)
  (if (null? names)
    'done
    (begin
      (display (align (cadar names) len))
      (show (caar names))
      (name-table-helper (cdr names) len))))

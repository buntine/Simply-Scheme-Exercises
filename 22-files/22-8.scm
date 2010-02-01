; A common operation in a database program is to join two databases, that is, to
; create a new database combining the information from the two given ones. There has
; to be some piece of information in common between the two databases. For example,
;
; suppose we have a class roster database in which each record includes a student’s name,
; student ID number, and computer account name, like this:
;
; ((john alec entwistle) 04397 john)
; ((keith moon) 09382 kmoon)
; ((peter townshend) 10428 pete)
; ((roger daltrey) 01025 roger)
;
; We also have a grade database in which each student's grades are stored according to
; computer account name:
;
; (john 87 90 76 68 95)
; (kmoon 80 88 95 77 89)
; (pete 100 92 80 65 72)
; (roger 85 96 83 62 74)
;
; We want to create a combined database like this:
;
; ((john alec entwistle) 04397 john 87 90 76 68 95)
; ((keith moon) 09382 kmoon 80 88 95 77 89)
; ((peter townshend) 10428 pete 100 92 80 65 72)
; ((roger daltrey) 01025 roger 85 96 83 62 74)
;
; in which the information from the roster and grade databases has been combined for
; each account name.
;
; Write a program join that takes five arguments: two input filenames, two numbers
; indicating the position of the item within each record that should overlap between the
; files, and an output filename. For our example, we'd say
;
; > (join "class-roster" "grades" 3 1 "combined-file")
;
; In our example, both files are in alphabetical order of computer account name, the
; account name is a word, and the same account name never appears more than once in
; each file. In general, you may assume that these conditions hold for the item that the
; two files have in common. Your program should not assume that every item in one file
; also appears in the other. A line should be written in the output file only for the items
; that do appear in both files.


; Andy note: Invoke it like this: (join "22-files/in6" "22-files/in7" 3 1 "22-files/out3")

(define (join infile-a infile-b pos-a pos-b outfile)
  (let ((data-a (read-file infile-a))
        (data-b (read-file infile-b)))
    (write-file (merge-by-field data-a data-b pos-a pos-b)
                outfile)))

; Reads each line of an input port into a list.
(define (read-file path)
  (let ((inport (open-input-file path)))
    (define lines (read-file-helper inport '()))
    (close-input-port inport)
    lines))

(define (read-file-helper inport lines)
  (let ((line (read inport)))
    (if (eof-object? line)
      lines
      (read-file-helper inport
                        (endcons line lines)))))

; Writes each item of lines into an output port.
(define (write-file lines path)
  (let ((outport (open-output-file path)))
    (for-each (lambda (line) (show-line line outport))
              lines)
    (close-output-port outport)
    'done))

; Merges two lists by a matching item denoted by pos-a and pos-b.
(define (merge-by-field data-a data-b pos-a pos-b)
  (if (or (null? data-a) (null? data-b))
    '()
    (merge-by-field-helper data-a data-b pos-a pos-b '())))

(define (merge-by-field-helper data-a data-b pos-a pos-b lst)
  (if (null? data-a)
    lst
    (let ((match (find-by-field data-b
                               pos-b
                               (item pos-a (car data-a)))))
      (if match
        (merge-by-field-helper (cdr data-a)
                               data-b pos-a pos-b
                               (endcons (join-item (car data-a) match)
                                        lst))
        (merge-by-field-helper (cdr data-a)
                               data-b pos-a pos-b
                               lst)))))

; Searches a list for a match at the correct position.
; Returns the list element if found, otherwise #f.
(define (find-by-field lst pos value)
  (cond ((null? lst) #f)
        ((equal? (item pos (car lst)) value) (car lst))
        (else (find-by-field (cdr lst) pos value))))

; Joins two lists by a matching field.
(define (join-item a b)
  '(1 2 3))

; Adds an item onto the end of a list
(define (endcons n lst)
  (append lst
          (cons n '())))

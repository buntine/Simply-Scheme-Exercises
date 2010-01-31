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


; Andy note: Invoke it like this: (join "22-files/in6" "22-files/in7" 3 1 "out3")

(define (join infile-a infile-b pos-a pos-b outfile)
  (let ((data-a (read-file infile-a))
        (data-b (read-file infile-b)))
    (write-file (join-by-field data-a data-b pos-a pos-b) outfile)))

(define (read-file path)
  )

(define (write-file lines path)
  )

(define (join-by-field data-a data-b pos-a pos-b)
  )

; We said in the recursion chapters that every recursive procedure has to have a base
; case and a recursive case, and that the recursive case has to somehow reduce the size
; of the problem, getting closer to the base case. How does the recursive call in get-fn
; reduce the size of the problem?


; Solution: The size of the problem is reduced on each recursion by causing a side-effect
;           which prints a helpful error message on the screen for the end-user.
;           It means the recursive invokation should be dealing with a smaller problem as 
;           the chance of the same input being entered is slim.

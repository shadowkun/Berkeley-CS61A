(define (deep-map fn s)
  (cond ((null? s) nil)
  		((list? (car s)) (cons (deep-map fn (car s)) (deep-map fn (cdr s))))
  		(else (cons (fn (car s)) (deep-map fn (cdr s)))) 
  	)
)

(define (substitute s old new)
  (cond ((null? s) nil)
  		((equal? (car s) old) (cons new (substitute (cdr s) old new)))
  		((list? (car s)) (cons (substitute (car s) old new) (substitute (cdr s) old new)))
  		(else (cons (car s)(substitute (cdr s) old new)))
  	)
)

(define (sub-all s olds news)
  (cond ((null? olds) s)
  		(else (sub-all (substitute s (car olds) (car news)) (cdr olds) (cdr news)))
  	)
)


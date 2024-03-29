(define (substitute s old new)
  (cond ((null? s) '())
        ((list? (car s)) (cons (substitute (car s) old new)
                              (substitute (cdr s) old new)))
        ((eq? (car s) old) (cons new (substitute (cdr s) old new)))
        (else (cons (car s) (substitute (cdr s) old new)))))

; Feel free to use these helper procedures in your solution
(define (map fn s)
  (if (null? s)
      nil
      (cons (fn (car s)) (map fn (cdr s)))))

(define (filter fn s)
  (cond 
    ((null? s)    nil)
    ((fn (car s)) (cons (car s) (filter fn (cdr s))))
    (else         (filter fn (cdr s)))))

(define (count x s)
  (if (null? s) 0
      (+ (if (eqv? x (car s)) 1 0)
         (count x (cdr s)))))


(define (unique s)
  (if (null? s) nil
      (cons (car s)
            (unique (filter (lambda (x) (not (eqv? (car s) x))) (cdr s)))))
)

(define (tally names)
  (if (null? names)
      '()
      (let ((un (unique names)))
        (map (lambda (name) (list name (count name names))) un))))

(define (tally names)
  (map (lambda (name) (list name (count name names))) (unique names))
)
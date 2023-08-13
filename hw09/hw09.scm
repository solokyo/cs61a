(define (ascending? lst)
    (or (<= (length lst) 1) (and (<= (car lst) (car (cdr lst))) (ascending? (cdr lst)))))

(define (my-filter pred s)
  (cond ((null? s) '())
        ((pred (car s)) (cons (car s) (my-filter pred (cdr s))))
        (else (my-filter pred (cdr s)))))

(define (interleave lst1 lst2)
  (cond ((null? lst1) lst2)
        ((null? lst2) lst1)
        (else (cons (car lst1) (interleave lst2 (cdr lst1))))))

(define member
  (lambda (elem lst)
    (cond ((null? lst) #f)
          ((eq? elem (car lst)) #t)
          (else (member elem (cdr lst))))))

(define (no-repeats lst)
  (cond ((null? lst) '())
        ((member (car lst) (cdr lst)) (no-repeats (cdr lst)))
        (else (cons (car lst) (no-repeats (cdr lst))))))

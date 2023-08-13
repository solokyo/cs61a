(define (square n) (* n n))

(define (pow base exp)
  (if (= exp 0)
      1
      (let ((half (quotient exp 2)))
        (if (even? exp)
            (let ((tmp (pow base half)))
              (* tmp tmp))
            (let ((tmp (pow base (- exp 1))))
              (* base tmp))
            )
        )
      )
  )

(define (repeatedly-cube n x)
  (if (zero? n)
      x
      (let (y (repeatedly-cube (- n 1) x))
        (* y y y))))

(define (cddr s) (cdr (cdr s)))

(define (cadr s) (car (cdr s)))
(define (caddr s) (car (cdr (cdr s)))) 
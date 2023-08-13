(define (over-or-under a b) 'YOUR-CODE-HERE
  (if (< a b) -1 (if(= a b) 0 1))
)

(define (make-adder num) 'YOUR-CODE-HERE
  (lambda (x) (+ x num))
)

(define (composed f g) 'YOUR-CODE-HERE
  (lambda (x) (f (g x)))
)

(define (repeat f n) 'YOUR-CODE-HERE
  (cond ((= n 0) (lambda (x) x))
        (else (lambda (x) (f ((repeat f (- n 1)) x)))))
) 


(define (max a b)
  (if (> a b)
      a
      b))

(define (min a b)
  (if (> a b)
      b
      a))

(define (gcd a b) 'YOUR-CODE-HERE
  (if (= b 0) a (gcd b (modulo a b)))
)

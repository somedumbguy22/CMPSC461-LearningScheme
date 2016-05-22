;;;Aakash Sham
;;;aks5378@psu.edu
;;;CMPSC 461
;;;Homework 2
;;; 30 Jan 2014


;;;Take-first and Skip first

(define (take-first n xs) (cond ((eq? xs '()) xs)
								((eq? n 0) '())
							(#t (cons (car xs) (take-first (- n 1) (cdr xs))))))

(define (skip-first n xs) (cond ((eq? xs '()) xs)
								((eq? n 0) xs)
							(#t (skip-first (- n 1) (cdr xs)))))


;;;Palindrome?

(define (palindrome? xs) (pal-alg xs (reverse xs)))

(define (pal-alg xs ys) (cond ((eq? xs '()) #t)
							(#t (if (not (eq? (car xs) (car ys))) #f
								(pal-alg (cdr xs) (cdr ys))))))


;;;I took these two functions from the lecture notes
(define (reverse xs)
  (if (null? xs) '()
      (append  (reverse (cdr xs)) (list (car xs)))))

(define (append xs ys)
  (if (null? xs) ys
      (cons (car xs) (append (cdr xs) ys))))


;;;Distinct

(define (distinct? xs ys) (if (eq? xs '()) (if (eq? ys '()) #f #t)
							(if (eq? ys '()) #t 
								(if (eq? (car xs) (car ys)) #f 
									(if (not (distinct? xs (cdr ys))) #f 
										(if (not (distinct? (cdr xs) ys)) #f #t))))))

;;;Better Distinct

(define (better-distinct? xs ys) (bd-alg (isort xs) (isort ys)))

(define (bd-alg xs ys) (if (eq? xs '()) (if (eq? ys '()) #f #t)
							(if (eq? ys '()) #t 
								(if (eq? (car xs) (car ys)) #f
									(if (< (car xs) (car ys)) #t ;;;this line takes advantage of the sorted lists
										(if (not (bd-alg xs (cdr ys))) #f 
											(if (not (bd-alg (cdr xs) ys)) #f #t)))))))

;;;I got this sorting algorithm from the lecture notes
(define (isort xs)
  (if (<= (length xs) 1) xs
      (let ((sorted-tail (isort (cdr xs)))
	    (first-element (car xs)))
	(insert first-element sorted-tail))))

(define (insert x xs)
  (cond ((null? xs) (list x))
	((<= x (car xs)) (cons x xs))
	(#t (cons (car xs) (insert x (cdr xs))))))

;;;Power set

(define (powerset xs) (if (eq? xs '()) '(()) 
 						(let ((tail (powerset (cdr xs)))) 
 					(append tail 
 				(map (lambda (smSet) (cons (car xs) smSet)) tail))))) 

;;;I got this function from the lecture notes
(define (map f xs)
  (if (null? xs) '()
      (cons (f (car xs))  (map f (cdr xs)))))
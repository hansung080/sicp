(load "../ch01/fixed-point.scm")

;; Newton's Method
;;
;;   This is a method for finding a root of the equation f(x) = 0 by finding a fixed point of the function g
;;   using the Newton transform.
;;
;;   Newton transform:
;;     g(x) = x - f(x) / f'(x)  (f'(x) != 0)
;;
;;     Note:
;;       The Newton transform converges rapidly to a fixed point because g'(r) = 0 at the fixed point r,
;;       allowing quadratic convergence near the fixed point.
;;       (Note that |g'(r)| < 1 must hold for the iteration to converge to the fixed point.)
;;
;;       g'(x) = 1 - {f'(x)f'(x) - f(x)f''(x)} / {f'(x)}^2
;;             = f(x)f''(x) / {f'(x)}^2
;;       g'(r) = 0  (because f(r) = 0)
;;
;; Newton's Method vs Gradient Descent
;;
;;   Newton's method for a root of f (an x such that f(x) = 0):
;;     x_(n+1) = x_n - f(x_n) / f'(x_n)
;;
;;   Newton's method for a stationary point of f (an x such that f'(x) = 0):
;;     x_(n+1) = x_n - f'(x_n) / f''(x_n)
;;
;;   Gradient descent for a stationary point of f (an x such that f'(x) = 0):
;;     x_(n+1) = x_n - η * f'(x_n)  (η is learning rate)
;;
;;   Notes:
;;     - Gradient descent uses a learning rate to control the update size without requiring
;;       the Hessian matrix (the matrix of second-order partial derivatives).
;;       This is because computing and storing the Hessian, as well as solving the resulting linear system,
;;       can be prohibitively expensive for deep learning models with large numbers of parameters.
;;     - A stationary point is a point at which a function's derivative is zero.
;;       It may be a local maximum, local minimum, or saddle point.
;;
(define (newton-transform f)
  (lambda (x) (- x (/ (f x)
                      ((deriv f) x)))))

(define (newton-method-with f guess close-enough?)
  (fixed-point-with (newton-transform f) guess close-enough?))

(define (newton-method f guess)
  (newton-method-with f guess close-abs-err?))

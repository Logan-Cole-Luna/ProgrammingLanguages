#lang racket ; Specify the language as Racket

;; Define the activation function, which acts as a simple threshold
;; It outputs 1 if the input is >= 0, otherwise it outputs 0
(define (activation x)
  (if (>= x 0) 1 0))

;; Define a structure for the perceptron, holding weights and a bias
(struct perceptron (weights bias))

;; Helper function to generate a random float between -1.0 and 1.0
;; This function multiplies a random float between 0 and 1 by 2, then shifts it to the range -1.0 to 1.0
(define (random-float)
  (- (* 2 (random)) 1.0))

;; Initialize the perceptron with random weights and a bias
;; `make-vector` creates a vector of size `num-inputs`, each initialized with a random float
(define (init-perceptron num-inputs)
  (perceptron (make-vector num-inputs (random-float)) ; Vector of random weights
              (random-float))) ; Random bias

;; Define the function to compute the perceptron's output (prediction)
;; `predict` computes the weighted sum of inputs plus bias and applies the activation function
(define (predict p inputs)
  (activation (+ (perceptron-bias p) ; Add bias
                 (apply + ; Sum all the weighted inputs
                        (for/list ([w (in-vector (perceptron-weights p))] ; Loop through weights
                                   [x inputs]) ; Loop through inputs
                          (* w x)))))) ; Multiply each weight with its corresponding input

;; Train the perceptron on a single data point by adjusting weights and bias based on the error
;; The `train` function returns a new perceptron with updated weights and bias
(define (train p inputs target learning-rate)
  (let* ([prediction (predict p inputs)] ; Compute prediction
         [error (- target prediction)] ; Calculate error (difference between target and prediction)
         [new-weights (vector-map (lambda (w x) (+ w (* learning-rate error x))) ; Update each weight
                                  (perceptron-weights p) ; Current weights
                                  (list->vector inputs))] ; Convert inputs to vector
         [new-bias (+ (perceptron-bias p) (* learning-rate error))]) ; Update bias
    (perceptron new-weights new-bias))) ; Return new perceptron with updated values

;; Train the perceptron over multiple epochs using the AND gate dataset
(define (train-perceptron p epochs learning-rate)
  ;; Define the AND gate dataset: each entry is a list (input1 input2 target)
  (define and-data '((0 0 0) (0 1 0) (1 0 0) (1 1 1)))
  ;; Loop over each epoch
  (for ([epoch (in-range epochs)])
    ;; Loop over each data point in the AND dataset
    (for ([data and-data])
      (define inputs (take data 2)) ; Get the first two elements (inputs)
      (define target (last data)) ; Get the last element (target output)
      (set! p (train p inputs target learning-rate)))) ; Update perceptron after training on this data point
  p) ; Return the trained perceptron

;; Initialize the perceptron with 2 inputs and train it on the AND dataset
(define my-perceptron (init-perceptron 2)) ; Perceptron with two random weights
(define trained-perceptron (train-perceptron my-perceptron 10 0.1)) ; Train over 10 epochs with a learning rate of 0.1

;; Test the perceptron by checking if it has learned the AND function
(define (test-perceptron p)
  ;; Loop over all possible inputs for the AND gate and print predictions
  (for ([inputs '((0 0) (0 1) (1 0) (1 1))])
    (printf "Input: ~a => Prediction: ~a\n" inputs (predict p inputs)))) ; Print input and prediction

(test-perceptron trained-perceptron) ; Run tests on the trained perceptron
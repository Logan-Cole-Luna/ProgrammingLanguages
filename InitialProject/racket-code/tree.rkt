#lang racket

;Implement the function for binary search tree.
;A tree is a graph, G = {N, E}, where
;1. Edges represent a parent-child relationship between nodes.
;2. There is a single node, the root, having no parent.
;3. All other nodes are involved in a parent-child relationship.
;4. Nodes have exactly one parent, except the root node.
;5. Nodes may have zero or more children.
;Binary search tree
;1. A binary search tree will have exactly two children, a left node and a right node. Note that the left
;node and/or right node might be null.
;2. The left child of any given node will be smaller than the given node.
;3. The right child of any given node will be greater than the given node.
;4. Assume that the are not repeated elements in the tree.
;5. Return true if the value exists in the tree, false otherwise.

; tree creation
;       4
;      / \
;     2   6
;    / \  / \
;   1  3 5  7
(define create-tree 
  (list 4
        (list 2 
              (list 1 '() '())
              (list 3 '() '()))
        (list 6
              (list 5 '() '())
              (list 7 '() '()))))

; tree will be represented as nested lists
;   first element of the list will be the root of node
;   second element will be the left child
;   third element will be the right child
(define (binary-search-tree tree value)
    (cond
        ; Base cases
        [(null? tree) #f]
        ; if found
        [(= value (first tree)) #t]

        ; Iterate tree
        [(< value (first tree))
            ; access second element
            (binary-search-tree (second tree) value)]
        [(> value (first tree))
            ; access third element
            (binary-search-tree (third tree) value)]
        ))

; Test cases
(binary-search-tree create-tree 3) ; #t
(binary-search-tree create-tree 8) ; #f
(binary-search-tree '(2 
                        (1 '() '()) 
                        (3 '() '())) 
                        3) ; #t
(binary-search-tree '(8 
                      (4 
                        (2 
                          (1 '() '()) 
                          '())
                        (6 
                          '()
                          (7 '() '())))
                      (12
                        (10 '() '())
                        (14 '() '()))) 
                        7) ; #t
(binary-search-tree '() 2) ; #f
(binary-search-tree '(4 '() (6 '() '())) 6) ; #t

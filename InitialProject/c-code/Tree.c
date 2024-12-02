#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

/*
Implement the function for binary search tree.
A tree is a graph, G = {N, E}, where
1. Edges represent a parent-child relationship between nodes.
2. There is a single node, the root, having no parent.
3. All other nodes are involved in a parent-child relationship.
4. Nodes have exactly one parent, except the root node.
5. Nodes may have zero or more children.
Binary search tree
1. A binary search tree will have exactly two children, a left node and a right node. Note that the left
node and/or right node might be null.
2. The left child of any given node will be smaller than the given node.
3. The right child of any given node will be greater than the given node.
4. Assume that the are not repeated elements in the tree.
5. Return true if the value exists in the tree, false otherwise.
*/

// Construct Tree:

// base node
struct Node {
    int data;
    struct Node* left;
    struct Node* right;
};

// Create node
struct Node* newNode(int value) {
    struct Node* node = (struct Node*)malloc(sizeof(struct Node));
    node->data = value;
    node->left = NULL;
    node->right = NULL;
    return node;
}

// Insert new node in BST
struct Node* insert(struct Node* root, int value) {
    if (root == NULL) {
        return newNode(value);
    }

    // Insery position based off current tree
    if (value < root->data) {
        root->left = insert(root->left, value);
    } else if (value > root->data) {
        root->right = insert(root->right, value);
    }

    return root;
}

// Search for value in BST:
void search(struct Node* root, int value) {
    struct Node* current = root;
    
    while (current != NULL) {
        if (value == current->data) {
            printf("%d: True\n", value);
            return;
        }
        
        // Move based off value
        if (value < current->data) {
            current = current->left;
        } else {
            current = current->right;
        }
    }
    
    printf("%d: False\n", value);
}

int main() {
    struct Node* root = NULL;
    
    // Create the tree
    root = insert(root, 5);
    insert(root, 2);
    insert(root, 1);
    insert(root, 3);
    insert(root, 12);
    insert(root, 9);
    insert(root, 21);
    insert(root, 19);
    insert(root, 25);

    // Test searches
    search(root, 24); // False
    search(root, 21); // True
    search(root, 4); // False
    search(root, 3); // True
    search(root, -3); // False

    return 0;
}


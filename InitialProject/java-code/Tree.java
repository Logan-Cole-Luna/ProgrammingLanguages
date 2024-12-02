import java.util.Random;

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
Figure 1: Example of a Binary Search Tree.
Taken from https://www.geeksforgeeks.org/largest-number-bst-less-equal-n/

Input : N = 24
Output :result = 21
(searching for 24 will be like-5->12->21)

Input  : N = 4
Output : result = 3
(searching for 4 will be like-5->2->3)

*/
// Java code to find the largest value smaller 
// than or equal to N 

public class Tree {

    // Construct Tree:

    // base node
    static class Node {
        int data;
        Node left, right;

        Node(int value) {
            data = value;
            left = right = null;
        }
    }

    // Insert new node in BST
    static Node insert(Node root, int value) {
        if (root == null) {
            return new Node(value);
        }

        // Insery position based off current tree
        if (value < root.data) {
            root.left = insert(root.left, value);
        } else if (value > root.data) {
            root.right = insert(root.right, value);
        }

        return root;
    }

    // Search for value in BST:

    // Search function
    static String search(Node root, int value) {
        StringBuilder path = new StringBuilder();
        int lastValue = search_helper(root, value, path);

        // If found
        if (lastValue == value) {
            return "\nInput:" + value + " \nFound: True \n(path taken: " 
                + path.toString().substring(0, path.length() - 2) + 
                ")";
        }

        // If not found
        return "\nInput: " + value + " \nFound: False \n(path taken: " 
                + path.toString().substring(0, path.length() - 2) +
                ", stopped at: " + lastValue + ")";
    }

    // Search helper function
    private static int search_helper(Node node, int value, StringBuilder path) {
        // if null return -1
        if (node == null) {
            return -1;
        }
        // Append path arrow for each loop
        path.append(node.data).append("->");

        // If found return value
        if (value == node.data) {
            return node.data;
        }

        // Recurse 
        
        // If value is less than current node, search left
        if (value < node.data) {
            return search_helper(node.left, value, path);
        }

        // If value is greater than current node, search right
        return search_helper(node.right, value, path);
    }

    public static void main(String[] args) {
        // Create the BST structure
        Node root = null;
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

        // Perform searches directly
        System.out.println(search(root, 24));
        System.out.println(search(root, 21));
        System.out.println(search(root, 4));
        System.out.println(search(root, 3));
        System.out.println(search(root, -3));


        // Test rand tree
        Random rand = new Random();

        int num_nodes = rand.nextInt(50);
        int num_search = rand.nextInt(10);

        for (int i = 0; i < num_nodes; i++){
            insert(root, rand.nextInt(50));
        }

        for (int i = 0; i < num_search; i++){
            System.out.println(search(root, rand.nextInt(50)));
            insert(root, rand.nextInt(50));
        }
    }
}

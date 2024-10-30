public class arr_swap {  // Class name should match the file name

    // Function to swap i & j values in an integer array
    public static int[] swap(int[] arr, int i, int j) {
        int temp = arr[i];  // Use int since array is of type int[]
        arr[i] = arr[j];
        arr[j] = temp;
        return arr;
    }

    public static void main(String[] args) {
        int i = 1;
        int j = 2;
        int[] arr = {0, 1, 2, 3};  // Correct array initialization

        arr = swap(arr, i, j);  // Pass the array directly

        // Print the swapped array
        for (int val : arr) {
            System.out.print(val + " ");
        }
    }
}



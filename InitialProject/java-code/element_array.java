import java.util.Random;

/*
Given a 1,000 element array,
build 100 threads to add all elements
 */

public class element_array extends Thread {
    private int[] arr;
    private int threadId; // ID used to calculate thread processes, which elements it gets
    private static int totalSum = 0;  // Shared sum
    private static int ARRAY_SIZE = 1000;  // Total elements
    private static int ELEMENTS_PER_THREAD = ARRAY_SIZE / 100;  // Each thread processes 10 elements

    // Constructor to initialize array and threadId
    public element_array(int[] arr, int threadId) {
        this.arr = arr;
        this.threadId = threadId;
    }

    public void run() {
        // Calculate this thread's segment
        int localSum = 0;
        int start = threadId * ELEMENTS_PER_THREAD;  // Starting index for thread
        int end = start + ELEMENTS_PER_THREAD;  // Ending index for thread
        
        // Sum the assigned segment
        for (int i = start; i < end; i++) {
            localSum += arr[i];
        }

        totalSum += localSum;
    }

    public static void main(String[] args) throws InterruptedException {
        // Initialize array and variables
        int[] arr = new int[ARRAY_SIZE];
        int num_threads = 100;
        Random rand = new Random();

        // Fill array with random values
        for (int i = 0; i < ARRAY_SIZE; i++) {
            arr[i] = rand.nextInt(50); // Output rand sum
            // Test:
            // arr[i] = 1; // Output sum 1000
            // arr[i] = 2; // Output sum 2000
        }

        // Array to store thread objects
        element_array[] threads = new element_array[num_threads];
        
        // Launch threads
        for (int i = 0; i < num_threads; i++) {
            threads[i] = new element_array(arr, i);
            threads[i].start();
        }

        // Wait for threads to finish
        for (int i = 0; i < num_threads; i++) {
            threads[i].join();
        }

        // Print the final sum
        System.out.println("Final Sum: " + totalSum);
    }
}

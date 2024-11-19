public class Threads extends Thread {
    private int[] arr;
    private int key;

    // Constructor to initialize array and key
    public Threads(int[] arr, int key) {
        this.arr = arr;
        this.key = key;
    }

    public void run() {
        if (key >= 0 && key < arr.length) {
            System.out.println("Element " + key + " of array is " + arr[key] + " for thread: "+ Thread.currentThread().getName());
        }
    }

    public static void main(String[] args) throws InterruptedException {
        int i = 1;
        int j = 2;
        int[] arr = {0, 1, 2, 3};

        // Create and start first thread
        Thread myTh1 = new Threads(arr, i);
        myTh1.start();

        System.out.println("Here ");


        // Create and start second thread
        Thread myTh2 = new Threads(arr, j);
        myTh2.start();
    }
}
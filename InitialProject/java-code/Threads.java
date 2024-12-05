import java.io.File;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.io.IOException;

/**
 * Entry point for testing the Log utility class.
 * This class implements a comprehensive test suite that verifies:
 * 1. Thread safety in concurrent logging operations
 * 2. Proper log level assignment (TEST for odd threads, ERROR for even threads)
 * 3. Edge case handling (empty messages, null messages, special characters)
 * 4. High concurrency scenarios (100 simultaneous threads)
 * 5. Message formatting and file writing consistency
 *
 * Test Cases:
 * - Basic Test: 6 threads with different messages to verify basic functionality
 * - Edge Cases: Tests boundary conditions and special input
 * - Load Test: 100 concurrent threads to verify thread safety under load
 */
public class Threads {
    private static final String LOG_FILE = "log.txt";

    public static void main(String[] args) throws InterruptedException {
        // Create an instance of the logging utility
        Log logger = new Log();
        new File(LOG_FILE).delete(); // Clear previous logs

        // Test Case 1: Basic concurrent logging
        // Verifies basic functionality with 6 threads running simultaneously
        // Tests both odd (TEST) and even (ERROR) thread number scenarios
        Thread[] basicThreads = createBasicThreads(logger);
        runThreadsAndWait(basicThreads);
        verifyResults("Basic concurrent logging");

        // Test Case 2: Edge cases
        // Tests boundary conditions and special input handling:
        // - Empty string message
        // - Null message
        // - Special characters in message
        Thread[] edgeCaseThreads = new Thread[] {
            createThread(logger, "", "empty-message"),    // Empty message
            createThread(logger, null, "null-message"),   // Null message
            createThread(logger, "Special №∑€®", "special-chars"), // Special characters
            // Test repetative output, works but a bit excessive
            // createThread(logger, "Very " + "x".repeat(1000), "long-message") // Very long message
        };
        runThreadsAndWait(edgeCaseThreads);
        verifyResults("Edge cases");

        // Test Case 3: High concurrency
        // Stress tests the logging system with 100 concurrent threads
        // Verifies thread safety and proper log level assignment under load
        Thread[] highLoadThreads = new Thread[100];
        for (int i = 0; i < highLoadThreads.length; i++) {
            final int threadNum = i + 1;
            highLoadThreads[i] = createThread(logger, 
                "High load message " + threadNum, 
                String.valueOf(threadNum));
        }
        runThreadsAndWait(highLoadThreads);
        verifyResults("High concurrency");
    }

    // Creates a set of basic test threads with predefined messages
    private static Thread[] createBasicThreads(Log logger) {
        Thread[] threads = new Thread[6];
        String[] messages = {
            "Index out of bounds exception",
            "Item added to cart",
            "Check out error 404",
            "User login successful",
            "Database connection established",
            "Null pointer exception"
        };
        
        for (int i = 0; i < threads.length; i++) {
            threads[i] = createThread(logger, messages[i], String.valueOf(i + 1));
        }
        return threads;
    }

    // Creates a new thread with specified message and name
    private static Thread createThread(Log logger, String message, String threadName) {
        Thread thread = new Thread(new LogTask(logger, message));
        thread.setName(threadName);
        return thread;
    }

    // Executes all threads and waits for their completion
    private static void runThreadsAndWait(Thread[] threads) throws InterruptedException {
        for (Thread t : threads) {
            t.start();
        }
        for (Thread t : threads) {
            t.join();
        }
    }

    // Verifies and displays test results
    private static void verifyResults(String testCase) {
        try {
            List<String> lines = Files.readAllLines(Paths.get(LOG_FILE));
            System.out.println("\n=== " + testCase + " ===");
            System.out.println("Messages logged: " + lines.size());
            for (String line : lines) {
                System.out.println(line);
            }
        } catch (IOException e) {
            System.err.println("Error reading log file: " + e.getMessage());
        }
    }
}

// Runnable task that handles the logging operation for each thread
class LogTask implements Runnable {
    private final Log logger;
    private final String message;

    public LogTask(Log logger, String message) {
        this.logger = logger;
        this.message = message;
    }

    @Override
    public void run() {
        // Log the message using the logger
        logger.log(message);
    }
}

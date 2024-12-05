import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Logging utility that provides thread-safe file logging with different log levels.
 * 
 * Key features:
 * - Synchronized file writing to prevent message jumbling
 * - Parallel message formatting
 * - Dynamic log level determination based on thread name
 * - Thread-safe implementation using synchronization block
 */
public class Log {
    // Log file path
    private static final String LOG_FILE = "log.txt";

    // Lock object for synchronization
    private static final Object lock = new Object();
    // Flag to determine if the log file should be wiped
    private static boolean firstWrite = true;

    public void log(String message) {
        // Current thread name
        String threadName = Thread.currentThread().getName();
        String logLevel = determineLogLevel(threadName);

        // Format the message with useful information
        String formattedMessage = String.format("Timestamp: %d - Thread: %s - Level: %s - Message: %s",
                System.currentTimeMillis(), threadName, logLevel, message);

        // Synchronize file writing to prevent message jumbling
        synchronized (lock) {
            try (FileWriter fw = new FileWriter(LOG_FILE, !firstWrite);
                 BufferedWriter bw = new BufferedWriter(fw);
                 PrintWriter out = new PrintWriter(bw)) {

                // Write the formatted message to the file
                out.println(formattedMessage);
                // Set flag after first write to clear log file
                firstWrite = false;  
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private String determineLogLevel(String threadName) {
        try {
            int threadNumber = Integer.parseInt(threadName);
            return threadNumber % 2 == 0 ? "ERROR" : "TEST";
        } catch (NumberFormatException e) {
            // Default case if thread name is not number, consider it an errot
            return "ERROR"; 
        }
    }
}

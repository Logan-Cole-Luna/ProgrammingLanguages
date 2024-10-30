#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>
#include <pthread.h>

#define LEARNING_RATE 0.1
#define MAX_ITERATIONS 1000
#define NUM_INPUTS 2
// Computer struggles at 200,000,000 concurrent perceptrons, doesn't run at 100,000,000
#define NUM_PERCEPTRONS 200000000

// Input & output for AND gate
long double inputArray[4][NUM_INPUTS];
long int y[4] = {0, 0, 0, 1};

// Perceptron struct
typedef struct {
    long double weights[NUM_INPUTS];
} Perceptron;

// Rand number generator
long double randDouble() {
    return (long double)rand() / (long double)RAND_MAX;
}

// Prediction function
long double predictOutput(Perceptron *perceptron, long double input[]) {
    long double weightedSum = 0;
    for (int i = 0; i < NUM_INPUTS; i++) {
        weightedSum += input[i] * perceptron->weights[i];
    }
    // tanh activation funct
    return tanhl(weightedSum);
}

// Perceptron training function
// called by every thread for inefficiency, simple training is not inefficient but doing it 10 million times is
void *trainPerceptron(void *arg) {
    Perceptron *perceptron = (Perceptron *)arg;
    // Training loop
    for (long int i = 0; i < MAX_ITERATIONS; i++) {
        long int correctPredictions = 0;
        for (long int j = 0; j < 4; j++) {
            // Perceptron predicting
            long double predictedOutput = predictOutput(perceptron, inputArray[j]);
            // Error calculation
            long int error = y[j] - (long int)roundl(predictedOutput);
            // Error correction for weights
            for (long int k = 0; k < NUM_INPUTS; k++) {
                perceptron->weights[k] += LEARNING_RATE * error * inputArray[j][k];
            }
            if (error == 0) {
                correctPredictions++;
            }
        }
        if (correctPredictions == 4) {
            printf("Thread %lu: Training complete after %ld iterations.\n", (unsigned long)pthread_self(), i + 1);
            break;
        }
    }
    return NULL;
}

int main() {
    srand(time(0));

    // Numerous threads so that perceptrons run in concurrency to slow processing
    // malloc to dynamically allocate memory for perceptrons & threads (stops seg fault)
    pthread_t *threads = (pthread_t *)malloc(NUM_PERCEPTRONS * sizeof(pthread_t));
    Perceptron *perceptrons = (Perceptron *)malloc(NUM_PERCEPTRONS * sizeof(Perceptron));

    // Initialize input array w/ random data
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < NUM_INPUTS; j++) {
            inputArray[i][j] = randDouble() * 2 - 1;
        }
    }

    printf("Beginning Training\n");
 

    // Create multiple perceptrons & threads
    for (long int i = 0; i < NUM_PERCEPTRONS; i++) {
        for (long int j = 0; j < NUM_INPUTS; j++) {
            // Randomizing weights
            perceptrons[i].weights[j] = randDouble() * 2 - 1;
        }
        // Creating threads
        pthread_create(&threads[i], NULL, trainPerceptron, &perceptrons[i]);
    }

    // Wait for all threads to finish
    for (long int i = 0; i < NUM_PERCEPTRONS; i++) {
        pthread_join(threads[i], NULL);
    }

    // Free allocated memory
    free(threads);
    free(perceptrons);

    return 0;
}

#include <iostream>
using namespace std;

int main() {
    // 1.) Print Hello World
    cout << "Hello, World!" << endl;

    // 2.) a + b (hardcoded)
    int a = 5;
    int b = 10;
    cout << "The sum of hardcoded a and b (5 + 10) is: " << a + b << endl;

    // 3.) a + b (input from user)
    cout << "\nNow let's add two numbers input by the user." << endl;
    cout << "Enter the value of a: ";
    cin >> a;
    cout << "Enter the value of b: ";
    cin >> b;
    cout << "The sum of user-inputted a and b is: " << a + b << endl;

    // 4.) If statement to check if a number is positive, negative, or zero
    int x;
    cout << "\nLet's check if a number is positive, negative, or zero." << endl;
    cout << "Enter an integer: ";
    cin >> x;

    if (x > 0) {
        cout << "The number is positive." << endl;
    } else if (x < 0) {
        cout << "The number is negative." << endl;
    } else {
        cout << "The number is zero." << endl;
    }

    return 0;
}
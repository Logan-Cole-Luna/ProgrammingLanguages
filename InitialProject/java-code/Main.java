// Base class Animal
class Animal {
   
    String name = "some animal";

    // Method to make a sound
    public void makeSound() {
        System.out.println("Animal makes a sound");
    }
}

// Dog class inheriting from Animal
class Dog extends Animal {

}

// Cat class inheriting from Animal
class Cat extends Animal {
    @Override
    public void makeSound() {
        super.makeSound();
        System.out.println("Meow!");
    }
}

// Main class to test the implementation
public class Main {
    public static void main(String[] args) {
        Animal myDog = new Dog();  // Dog object
        Animal myCat = new Cat();  // Cat object

        myDog.makeSound();
        myCat.makeSound();
       
        System.out.printf("Dog name: %s%n", myDog.name);
        String str1 = "dog";
        String str2 = "cat";
        String result;
        result = str1 + str2;
         System.out.printf("Dog name: %s%n", result);
    
    }
}



public class Main{
    public static void main(String[] args){
        
    }
}
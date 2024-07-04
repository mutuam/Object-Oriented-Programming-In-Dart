import 'dart:io';

// Step 1: Define an interface
abstract class Printable {
  void printDetails();
}

// Step 2: Create a base class
class Animal {
  String name;
  int age;

  Animal(this.name, this.age);

  void speak() {
    print('$name makes a noise.');
  }
}

// Step 3: Create a derived class that implements the interface and overrides an inherited method
class Dog extends Animal implements Printable {
  String breed;

  Dog(String name, int age, this.breed) : super(name, age);

  @override
  void speak() {
    print('$name barks.');
  }

  @override
  void printDetails() {
    print('Dog: $name, Age: $age, Breed: $breed');
  }
}

// Step 4: Create a method to read data from a file and initialize an instance of the class
Future<Dog> initializeDogFromFile(String filePath) async {
  final file = File(filePath);
  final contents = await file.readAsLines();

  // Assuming the file has three lines: name, age, breed
  String name = contents[0];
  int age = int.parse(contents[1]);
  String breed = contents[2];

  return Dog(name, age, breed);
}

// Step 5: A method that demonstrates the use of a loop
void listDogs(List<Dog> dogs) {
  for (var dog in dogs) {
    dog.printDetails();
  }
}

void main() async {
  // Assuming we have a file 'dog.txt' with the following content:
  // Max
  // 5
  // Golden Retriever

  Dog myDog = await initializeDogFromFile('dog.txt');
  myDog.speak();
  myDog.printDetails();

  // Demonstrating the use of a loop
  List<Dog> dogList = [myDog, Dog('Buddy', 3, 'Labrador'), Dog('Charlie', 2, 'Beagle')];
  listDogs(dogList);
}

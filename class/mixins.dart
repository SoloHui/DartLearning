// Define mixins
mixin Flyable {
  void fly() {
    print('Flying in the sky');
  }
}

mixin Swimmable {
  void swim() {
    print('Swimming in water');
  }
}

mixin Walkable {
  void walk() {
    print('Walking on ground');
  }
}

// Base class
class Animal {
  String name;
  Animal(this.name);

  void eat() {
    print('$name is eating');
  }
}

// Using mixins with 'with' keyword
class Duck extends Animal with Flyable, Swimmable, Walkable {
  Duck(String name) : super(name);
}

class Fish extends Animal with Swimmable {
  Fish(String name) : super(name);
}

class Bird extends Animal with Flyable {
  Bird(String name) : super(name);
}

void main() {
  var duck = Duck('Donald');
  duck.eat(); // From Animal
  duck.fly(); // From Flyable mixin
  duck.swim(); // From Swimmable mixin
  duck.walk(); // From Walkable mixin

  var fish = Fish('Nemo');
  fish.eat(); // From Animal
  fish.swim(); // From Swimmable mixin

  var bird = Bird('Tweety');
  bird.eat(); // From Animal
  bird.fly(); // From Flyable mixin
}

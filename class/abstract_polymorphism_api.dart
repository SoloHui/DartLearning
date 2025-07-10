// 抽象类 - 定义通用的动物行为
abstract class Animal {
  String name;

  Animal(this.name);

  // 抽象方法 - 子类必须实现
  void makeSound();

  // 具体方法 - 子类可以直接使用
  void sleep() {
    print('$name is sleeping...');
  }
}

// 接口 - 定义飞行能力
abstract class Flyable {
  void fly();
}

// 接口 - 定义游泳能力
abstract class Swimmable {
  void swim();
}

// 具体类 - 狗
class Dog extends Animal {
  Dog(String name) : super(name);

  @override
  void makeSound() {
    print('$name says: Woof! Woof!');
  }
}

// 具体类 - 猫
class Cat extends Animal {
  Cat(String name) : super(name);

  @override
  void makeSound() {
    print('$name says: Meow! Meow!');
  }
}

// 具体类 - 鸟（实现多个接口）
class Bird extends Animal implements Flyable {
  Bird(String name) : super(name);

  @override
  void makeSound() {
    print('$name says: Tweet! Tweet!');
  }

  @override
  void fly() {
    print('$name is flying in the sky!');
  }
}

// 具体类 - 鸭子（实现多个接口）
class Duck extends Animal implements Flyable, Swimmable {
  Duck(String name) : super(name);

  @override
  void makeSound() {
    print('$name says: Quack! Quack!');
  }

  @override
  void fly() {
    print('$name is flying low over the water!');
  }

  @override
  void swim() {
    print('$name is swimming gracefully!');
  }
}

// 演示多态的函数
void demonstratePolymorphism(List<Animal> animals) {
  print('\n=== 多态演示 ===');
  for (Animal animal in animals) {
    animal.makeSound(); // 多态 - 运行时决定调用哪个实现
    animal.sleep();
  }
}

void demonstrateInterfaces(List<Flyable> flyers) {
  print('\n=== 接口演示 ===');
  for (Flyable flyer in flyers) {
    flyer.fly(); // 接口方法调用
  }
}

void main() {
  // 创建不同类型的动物
  List<Animal> animals = [Dog('旺财'), Cat('咪咪'), Bird('小鸟'), Duck('唐老鸭')];

  // 多态演示
  demonstratePolymorphism(animals);

  // 接口演示
  List<Flyable> flyers = [Bird('老鹰'), Duck('野鸭')];
  demonstrateInterfaces(flyers);

  // 单独测试游泳接口
  print('\n=== 游泳演示 ===');
  Duck duck = Duck('游泳鸭');
  duck.swim();

  // 类型检查和转换
  print('\n=== 类型检查演示 ===');
  for (Animal animal in animals) {
    if (animal is Flyable) {
      print('${animal.name} 会飞！');
      (animal as Flyable).fly();
    }
    if (animal is Swimmable) {
      print('${animal.name} 会游泳！');
      (animal as Swimmable).swim();
    }
  }
}

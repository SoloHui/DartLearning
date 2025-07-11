# Dart 面向对象编程

这个目录包含了Dart面向对象编程的核心概念和实践示例。通过这些示例，您可以学习Dart中类与对象的定义、继承、多态、抽象类、接口、混入(Mixin)以及其他面向对象编程特性。

## 文件说明

### 1. `constructor_private_get_set.dart`

这个文件展示了Dart中类的基本构造方式和成员访问控制：

- **构造函数**：默认构造函数、命名构造函数、参数化构造函数
- **访问控制**：使用下划线(`_`)定义私有成员
- **getter/setter方法**：属性的读取和设置方法
- **库的封装**：使用`library`关键字定义模块化库

关键知识点：

- 使用下划线前缀创建私有变量和方法（仅在库内可见）
- 定义命名构造函数（`ClassName.constructorName()`）
- 使用getter和setter控制属性访问
- 参数化构造函数和可选参数

### 2. `immutable_person.dart`

这个文件演示了Dart中如何创建不可变类：

- **不可变数据**：使用`final`关键字定义不可变字段
- **常量构造函数**：使用`const`关键字创建编译时常量对象
- **对象复制**：通过`copyWith`方法实现不可变对象的更新
- **工厂构造函数**：使用`static`方法进行对象验证和创建

关键知识点：

- 常量构造函数（`const constructor`）的使用
- 不可变对象的优势和创建方式
- 使用`copyWith`模式实现状态更新
- 静态工厂方法进行对象验证

### 3. `abstract_polymorphism_api.dart`

这个文件展示了Dart中的抽象类、接口和多态性：

- **抽象类**：使用`abstract`关键字定义抽象类和方法
- **接口实现**：使用`implements`关键字实现接口
- **多态性**：对象可以表现出不同的形态
- **类型检查和转换**：使用`is`和`as`关键字

关键知识点：

- 定义抽象类和抽象方法
- 在Dart中使用类作为接口
- 实现多个接口
- 运行时多态（方法重写）

### 4. `mixins.dart`

这个文件介绍了Dart中的Mixin机制：

- **Mixin定义**：使用`mixin`关键字定义可复用的代码块
- **Mixin使用**：使用`with`关键字将mixin应用到类中
- **多重混入**：一个类可以使用多个mixin

关键知识点：

- Mixin的定义和使用
- 使用多个Mixin实现代码复用
- Mixin与继承的结合

### 5. `mutable_person.dart`

这个文件展示了可变类的实现，与不可变类形成对比。

### 6. `object_operator.dart`

这个文件介绍了对象操作符和方法：

- 运算符重载
- 相等性比较
- 字符串表示

### 7. `static_operator_extend.dart`

这个文件展示了静态成员、操作符重载和继承：

- **静态成员**：使用`static`关键字定义类级别的变量和方法
- **操作符重载**：自定义操作符行为
- **类的继承**：使用`extends`关键字扩展类

## 面向对象编程核心概念

### 类与对象

在Dart中，类是对象的蓝图，定义了对象的属性和行为。对象是类的实例，可以通过构造函数创建。

```dart
class Person {
  String name;
  Person(this.name);
}

var person = Person('张三');
```

### 封装

封装是隐藏对象内部实现细节的机制，通过私有成员和公共接口实现：

```dart
class Person {
  String _name; // 私有成员，只在库内可见
  String get name => _name; // 公共getter
  set name(String value) => _name = value; // 公共setter
}
```

### 继承

继承允许子类继承父类的属性和方法，实现代码复用：

```dart
class Animal {
  void makeSound() { ... }
}

class Dog extends Animal {
  @override
  void makeSound() {
    print('Woof!');
  }
}
```

### 多态

多态允许对象在运行时表现为不同的形态，通过方法重写实现：

```dart
void feedAnimal(Animal animal) {
  animal.eat(); // 根据实际对象类型调用不同的eat方法
}
```

### 抽象类与接口

Dart中没有专门的接口关键字，任何类都可以作为接口使用。抽象类用于定义不完整的类，不能被实例化：

```dart
abstract class Drawable {
  void draw(); // 抽象方法，子类必须实现
}

class Circle implements Drawable {
  @override
  void draw() { ... }
}
```

### Mixin

Mixin是一种代码复用机制，允许在不使用继承的情况下重用类中的代码：

```dart
mixin Logger {
  void log(String message) {
    print(message);
  }
}

class App with Logger {
  void run() {
    log('App is running'); // 使用mixin中的方法
  }
}
```

## 学习资源

要深入了解Dart的面向对象编程，可以参考以下资源：

- [Dart官方文档 - 类](https://dart.dev/language/classes)
- [Dart官方文档 - 混入](https://dart.dev/language/mixins)
- [Dart官方文档 - 扩展方法](https://dart.dev/language/extension-methods)
- [Dart官方文档 - 构造函数](https://dart.dev/language/constructors)

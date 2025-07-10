# Mixin 和 Abstract 的区别

Mixin 和 Abstract 类是 Dart 中两种不同的代码复用机制。让我通过代码示例来展示它们的区别：

````dart
// ======================= ABSTRACT 类 =======================

// 抽象类：定义契约和部分实现
abstract class Vehicle {
  String brand;
  int year;
  
  Vehicle(this.brand, this.year);
  
  // 抽象方法：必须被子类实现
  void startEngine();
  void stopEngine();
  
  // 具体方法：可以被继承使用
  void displayInfo() {
    print('品牌: $brand, 年份: $year');
  }
  
  // 受保护的方法
  void _performMaintenance() {
    print('$brand 正在进行维护...');
  }
}

// 抽象类只能被继承，不能被实例化
class Car extends Vehicle {
  int doors;
  
  Car(String brand, int year, this.doors) : super(brand, year);
  
  @override
  void startEngine() {
    print('$brand 汽车引擎启动：轰轰轰...');
  }
  
  @override
  void stopEngine() {
    print('$brand 汽车引擎关闭');
  }
  
  void openDoors() {
    print('打开 $doors 扇车门');
  }
}

// ======================= MIXIN =======================

// Mixin：提供可复用的功能片段
mixin Flyable {
  double altitude = 0;
  
  void takeOff() {
    altitude = 1000;
    print('起飞！当前高度: ${altitude}米');
  }
  
  void land() {
    altitude = 0;
    print('降落！当前高度: ${altitude}米');
  }
  
  void fly() {
    print('在 ${altitude}米 高度飞行');
  }
}

mixin Swimmable {
  double depth = 0;
  
  void dive() {
    depth = 10;
    print('潜水！当前深度: ${depth}米');
  }
  
  void surface() {
    depth = 0;
    print('浮出水面！当前深度: ${depth}米');
  }
  
  void swim() {
    print('在 ${depth}米 深度游泳');
  }
}

mixin Drivable {
  double speed = 0;
  
  void accelerate() {
    speed += 20;
    print('加速！当前速度: ${speed}km/h');
  }
  
  void brake() {
    speed = 0;
    print('刹车！当前速度: ${speed}km/h');
  }
  
  void drive() {
    print('以 ${speed}km/h 的速度行驶');
  }
}

// ======================= 组合使用 =======================

// 可以同时继承抽象类和使用多个 mixins
class AmphibiousCar extends Vehicle with Drivable, Swimmable {
  AmphibiousCar(String brand, int year) : super(brand, year);
  
  @override
  void startEngine() {
    print('$brand 水陆两栖车引擎启动');
  }
  
  @override
  void stopEngine() {
    print('$brand 水陆两栖车引擎关闭');
  }
  
  void switchToWaterMode() {
    print('切换到水上模式');
    dive();
  }
  
  void switchToLandMode() {
    print('切换到陆地模式');
    surface();
  }
}

// 飞行汽车：继承抽象类，使用多个 mixins
class FlyingCar extends Vehicle with Drivable, Flyable {
  FlyingCar(String brand, int year) : super(brand, year);
  
  @override
  void startEngine() {
    print('$brand 飞行汽车引擎启动');
  }
  
  @override
  void stopEngine() {
    print('$brand 飞行汽车引擎关闭');
  }
  
  void switchToFlyMode() {
    print('切换到飞行模式');
    takeOff();
  }
  
  void switchToDriveMode() {
    print('切换到驾驶模式');
    land();
  }
}

// ======================= 带约束的 MIXIN =======================

// Mixin 可以指定只能用于特定类型
mixin ElectricPowered on Vehicle {
  double batteryLevel = 100;
  
  void chargeBattery() {
    batteryLevel = 100;
    print('$brand 电池充电完成：${batteryLevel}%');
  }
  
  void usePower() {
    if (batteryLevel > 0) {
      batteryLevel -= 10;
      print('$brand 使用电力，剩余电量：${batteryLevel}%');
    } else {
      print('$brand 电量耗尽！');
    }
  }
  
  @override
  void startEngine() {
    print('$brand 电动引擎静音启动');
    usePower();
  }
}

class ElectricCar extends Vehicle with ElectricPowered, Drivable {
  ElectricCar(String brand, int year) : super(brand, year);
  
  @override
  void stopEngine() {
    print('$brand 电动引擎关闭');
  }
}

// ======================= 演示不同场景 =======================

void main() {
  print('=================== ABSTRACT 类演示 ===================');
  
  // var vehicle = Vehicle('Generic', 2023); // 错误！抽象类不能实例化
  
  var car = Car('Toyota', 2023, 4);
  car.displayInfo(); // 继承的方法
  car.startEngine(); // 必须实现的抽象方法
  car.openDoors(); // 自己的方法
  car.stopEngine();
  
  print('\n=================== MIXIN 基础使用 ===================');
  
  var amphibiousCar = AmphibiousCar('Tesla Boat', 2024);
  amphibiousCar.displayInfo();
  amphibiousCar.startEngine();
  
  // 使用陆地功能
  amphibiousCar.accelerate();
  amphibiousCar.drive();
  amphibiousCar.brake();
  
  // 切换到水上模式
  amphibiousCar.switchToWaterMode();
  amphibiousCar.swim();
  amphibiousCar.switchToLandMode();
  
  print('\n=================== 多重 MIXIN 使用 ===================');
  
  var flyingCar = FlyingCar('Future Car', 2025);
  flyingCar.displayInfo();
  flyingCar.startEngine();
  
  // 陆地驾驶
  flyingCar.accelerate();
  flyingCar.drive();
  
  // 切换到飞行模式
  flyingCar.switchToFlyMode();
  flyingCar.fly();
  flyingCar.switchToDriveMode();
  
  flyingCar.stopEngine();
  
  print('\n=================== 带约束的 MIXIN ===================');
  
  var electricCar = ElectricCar('Tesla', 2024);
  electricCar.displayInfo();
  electricCar.chargeBattery();
  electricCar.startEngine(); // 使用 mixin 重写的方法
  electricCar.accelerate();
  electricCar.drive();
  electricCar.usePower();
  electricCar.usePower();
  electricCar.stopEngine();
  
  print('\n=================== 总结对比 ===================');
  print('''
📝 ABSTRACT 类特点：
  ✓ 定义契约（抽象方法）
  ✓ 提供部分实现
  ✓ 只能单一继承
  ✓ 不能实例化
  ✓ 可以有构造函数
  ✓ 可以有实例变量
  
🧩 MIXIN 特点：
  ✓ 提供可复用功能
  ✓ 支持多重混入
  ✓ 不能实例化
  ✓ 不能有构造函数
  ✓ 可以有实例变量
  ✓ 可以指定使用约束

🎯 使用场景：
  • Abstract：定义类层次结构和契约
  • Mixin：提供跨类复用的功能片段
  ''');
}
````

## 主要区别总结

### **Abstract 类**

- **目的**：定义类的契约和部分实现
- **继承**：只能单一继承 (`extends`)
- **实例化**：不能直接实例化
- **构造函数**：可以有构造函数
- **抽象方法**：可以定义必须实现的抽象方法
- **使用场景**：建立类层次结构，定义共同接口

### **Mixin**

- **目的**：提供可复用的功能片段
- **混入**：支持多重混入 (`with`)
- **实例化**：不能实例化
- **构造函数**：不能有构造函数
- **约束**：可以用 `on` 指定使用条件
- **使用场景**：横切关注点，功能组合

### **组合使用**

可以同时继承抽象类和使用多个 mixins：

```dart
class MyClass extends AbstractClass with Mixin1, Mixin2, Mixin3
```

这样的设计让 Dart 既支持传统的继承模式，又支持灵活的功能组合！

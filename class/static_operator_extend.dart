// 演示静态成员的基础类
class Animal {
  String name;
  static int totalAnimals = 0; // 静态变量，记录创建的动物总数

  Animal(this.name) {
    totalAnimals++; // 每创建一个实例，总数加1
  }

  // 静态方法
  static void showTotalAnimals() {
    print('创建的动物总数: $totalAnimals');
  }

  void makeSound() {
    print('$name 发出声音');
  }

  // 重载相等运算符
  bool operator ==(Object other) {
    if (other is Animal) {
      return name == other.name;
    }
    return false;
  }

  @override
  int get hashCode => name.hashCode;
}

// 演示继承的派生类
class Dog extends Animal {
  String breed; // 品种

  /// 构造函数，使用super关键字调用父类构造函数
  ///
  /// super(name)的作用：
  /// 1. 调用父类Animal的构造函数
  /// 2. 将name参数传递给父类进行初始化
  /// 3. 确保父类的初始化逻辑得到执行（如totalAnimals++）
  /// 4. 必须在子类构造函数体执行之前完成
  Dog(String name, this.breed) : super(name);

  @override
  void makeSound() {
    print('$name 汪汪叫: 汪汪!');
  }

  void wagTail() {
    print('$name 开心地摇尾巴');
  }

  // 在派生类中重载运算符
  Dog operator +(Dog other) {
    return Dog('${name}-${other.name}', '$breed-${other.breed}');
  }
}

// 具有自定义运算符的向量类
class Vector {
  double x, y; // 向量的x和y坐标

  Vector(this.x, this.y);

  // 加法运算符
  Vector operator +(Vector other) {
    return Vector(x + other.x, y + other.y);
  }

  // 减法运算符
  Vector operator -(Vector other) {
    return Vector(x - other.x, y - other.y);
  }

  // 标量乘法运算符
  Vector operator *(double scalar) {
    return Vector(x * scalar, y * scalar);
  }

  // 索引运算符
  double operator [](int index) {
    if (index == 0) return x;
    if (index == 1) return y;
    throw RangeError('索引超出范围');
  }

  @override
  String toString() => 'Vector($x, $y)';
}

void main() {
  // 静态成员演示
  print('=== 静态成员演示 ===');
  Animal.showTotalAnimals(); // 0

  var animal1 = Animal('通用动物');
  // var animal2 = Animal('另一个动物');
  Animal.showTotalAnimals(); // 1 || 2

  // 继承演示
  print('\n=== 继承演示 ===');
  var dog1 = Dog('小白', '金毛寻回犬');
  var dog2 = Dog('小黑', '德国牧羊犬');

  dog1.makeSound(); // 重写的方法
  dog1.wagTail();

  Animal.showTotalAnimals(); // 3 (包括狗狗)

  // 运算符重载演示
  print('\n=== 运算符重载演示 ===');

  // 相等运算符
  var animal3 = Animal('通用动物');
  print('animal1 == animal3: ${animal1 == animal3}'); // true

  // Dog类中的自定义运算符
  var combinedDog = dog1 + dog2;
  print('合并的狗狗: ${combinedDog.name}, 品种: ${combinedDog.breed}');

  // 向量运算符
  var v1 = Vector(1.0, 2.0);
  var v2 = Vector(3.0, 4.0);

  var sum = v1 + v2;
  var diff = v2 - v1;
  var scaled = v1 * 2.0;

  print('\n=== 向量运算演示 ===');
  print('v1: $v1');
  print('v2: $v2');
  print('v1 + v2: $sum');
  print('v2 - v1: $diff');
  print('v1 * 2: $scaled');
  print('v1[0]: ${v1[0]}, v1[1]: ${v1[1]}');
}

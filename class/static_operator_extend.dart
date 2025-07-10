// 演示静态成员的基础类
class Animal {
  String name;
  String species; // 物种
  int age; // 年龄
  static int totalAnimals = 0; // 静态变量，记录创建的动物总数

  // 默认构造函数
  Animal(this.name, {this.species = '未知', this.age = 0}) {
    totalAnimals++; // 每创建一个实例，总数加1
  }

  // 命名构造函数：创建野生动物
  Animal.wild(this.name, this.species) : age = 0 {
    totalAnimals++;
  }

  // 命名构造函数：创建宠物
  Animal.pet(this.name, this.age) : species = '宠物' {
    totalAnimals++;
  }

  // 命名构造函数：创建成年动物
  Animal.adult(this.name, this.species) : age = 5 {
    totalAnimals++;
  }

  // 命名构造函数：从映射创建
  Animal.fromMap(Map<String, dynamic> map)
    : name = map['name'],
      species = map['species'] ?? '未知',
      age = map['age'] ?? 0 {
    totalAnimals++;
  }

  // 静态方法
  static void showTotalAnimals() {
    print('创建的动物总数: $totalAnimals');
  }

  void makeSound() {
    print('$name 发出声音');
  }

  void displayInfo() {
    print('动物信息 - 姓名: $name, 物种: $species, 年龄: $age');
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

  /// 默认构造函数，使用super关键字调用父类构造函数
  Dog(String name, this.breed, {String species = '犬科', int age = 0})
    : super(name, species: species, age: age);

  /// 使用父类的wild命名构造函数创建野生犬类
  Dog.wildDog(String name, this.breed) : super.wild(name, '野生犬科');

  /// 使用父类的pet命名构造函数创建宠物犬
  Dog.petDog(String name, this.breed, int age) : super.pet(name, age);

  /// 使用父类的adult命名构造函数创建成年犬
  Dog.adultDog(String name, this.breed) : super.adult(name, '成年犬科');

  /// 使用父类的fromMap命名构造函数创建犬类
  Dog.fromMap(Map<String, dynamic> map)
    : breed = map['breed'] ?? '混种',
      super.fromMap(map);

  /// 创建小狗的命名构造函数
  Dog.puppy(String name, this.breed) : super(name, species: '幼犬', age: 1);

  @override
  void makeSound() {
    print('$name 汪汪叫: 汪汪!');
  }

  void wagTail() {
    print('$name 开心地摇尾巴');
  }

  @override
  void displayInfo() {
    print('狗狗信息 - 姓名: $name, 品种: $breed, 物种: $species, 年龄: $age');
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

  // 使用不同的Animal构造函数
  var animal1 = Animal('通用动物');
  var wildAnimal = Animal.wild('老虎', '猫科');
  var petAnimal = Animal.pet('小鸟', 2);
  var adultAnimal = Animal.adult('大象', '象科');

  Animal.showTotalAnimals(); // 4

  print('\n=== Animal信息展示 ===');
  animal1.displayInfo();
  wildAnimal.displayInfo();
  petAnimal.displayInfo();
  adultAnimal.displayInfo();

  // 继承和命名构造函数演示
  print('\n=== 继承和命名构造函数演示 ===');
  var dog1 = Dog('小白', '金毛寻回犬', age: 3);
  var wildDog = Dog.wildDog('狼狗', '德国牧羊犬');
  var petDog = Dog.petDog('小黑', '拉布拉多', 2);
  var adultDog = Dog.adultDog('大黄', '中华田园犬');
  var puppyDog = Dog.puppy('小可爱', '比熊');

  // 从映射创建狗狗
  var mapDog = Dog.fromMap({
    'name': '小花',
    'breed': '边境牧羊犬',
    'species': '牧羊犬科',
    'age': 4,
  });

  print('\n=== 狗狗信息展示 ===');
  dog1.displayInfo();
  wildDog.displayInfo();
  petDog.displayInfo();
  adultDog.displayInfo();
  puppyDog.displayInfo();
  mapDog.displayInfo();

  dog1.makeSound(); // 重写的方法
  dog1.wagTail();

  Animal.showTotalAnimals(); // 显示总的动物数量

  // 运算符重载演示
  print('\n=== 运算符重载演示 ===');

  // 相等运算符
  var animal3 = Animal('通用动物');
  print('animal1 == animal3: ${animal1 == animal3}'); // true

  // Dog类中的自定义运算符
  var combinedDog = dog1 + petDog;
  print('合并的狗狗: ${combinedDog.name}, 品种: ${combinedDog.breed}');
  combinedDog.displayInfo();

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

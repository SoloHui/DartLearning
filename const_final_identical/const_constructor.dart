// const_constructor.dart
// 本文件详细演示常量构造函数的定义和使用

void main() {
  print('==== 常量构造函数基本用法 ====');

  // 使用常量构造函数创建对象
  const circle1 = Circle(radius: 5.0);
  const circle2 = Circle(radius: 5.0);

  print('circle1: $circle1');
  print('circle2: $circle2');

  // 检查是否是同一个实例
  print('circle1 与 circle2 是否为同一实例: ${identical(circle1, circle2)}'); // true

  // 非常量方式创建
  final circle3 = Circle(radius: 5.0);
  final circle4 = Circle(radius: 5.0);

  print('\ncircle3: $circle3');
  print('circle4: $circle4');
  print('circle3 与 circle4 是否为同一实例: ${identical(circle3, circle4)}'); // false
  print('circle1 与 circle3 是否为同一实例: ${identical(circle1, circle3)}'); // false

  print('\n==== 常量构造函数与对象缓存 ====');

  // 编译时创建多个相同的常量实例，实际只会有一个实例被缓存
  const rect1 = Rectangle(width: 10.0, height: 20.0);
  const rect2 = Rectangle(width: 10.0, height: 20.0);
  const rect3 = Rectangle(width: 10.0, height: 20.0);

  print('rect1、rect2、rect3 是否都是同一个实例:');
  print('identical(rect1, rect2): ${identical(rect1, rect2)}'); // true
  print('identical(rect2, rect3): ${identical(rect2, rect3)}'); // true

  print('\n==== 嵌套常量对象 ====');

  // 常量构造函数可以嵌套使用
  // Circle 类实现了 Shape 接口
  const Circle circleShape = Circle(radius: 15.0);

  const position = Position(x: 100.0, y: 200.0, shape: circleShape);

  const position2 = Position(x: 100.0, y: 200.0, shape: circleShape);

  print('嵌套常量对象:');
  print('position: $position');
  print('position2: $position2');
  print(
    'identical(position, position2): ${identical(position, position2)}',
  ); // true
  print(
    'identical(position.shape, position2.shape): ${identical(position.shape, position2.shape)}',
  ); // true

  print('\n==== 常量对象集合 ====');

  // 常量对象可以在常量集合中使用
  const shapes = [
    Circle(radius: 3.0),
    Triangle(base: 4.0, height: 6.0),
    Rectangle(width: 2.0, height: 8.0),
  ];

  print('常量形状集合:');
  for (final shape in shapes) {
    print('${shape.runtimeType}: 面积 = ${shape.area}');
  }

  print('\n==== 常量构造函数的限制 ====');

  // 1. 所有实例变量必须是 final
  // 2. 构造函数必须是 const
  // 3. 初始化列表中只能使用常量表达式
  // 4. 父类构造函数必须是 const
  // 5. 常量构造函数不能有函数体，只能有初始化列表

  // 使用 const 构造函数但不使用 const 关键字创建对象
  final triangle1 = Triangle(base: 10, height: 5); // 非常量对象
  final triangle2 = Triangle(base: 10, height: 5); // 另一个非常量对象

  // 使用 const 关键字创建常量对象
  const triangle3 = Triangle(base: 10, height: 5); // 常量对象
  const triangle4 = Triangle(base: 10, height: 5); // 同一个常量对象

  print('非 const 方式创建常量构造函数对象:');
  print(
    'identical(triangle1, triangle2): ${identical(triangle1, triangle2)}',
  ); // false

  print('const 方式创建常量构造函数对象:');
  print(
    'identical(triangle3, triangle4): ${identical(triangle3, triangle4)}',
  ); // true

  print('\n==== 命名常量构造函数 ====');

  // 使用命名常量构造函数
  const redColor = Color.rgb(255, 0, 0, name: 'red');
  const greenColor = Color.rgb(0, 255, 0, name: 'green');

  print('命名常量构造函数创建的对象:');
  print('redColor: $redColor');
  print('greenColor: $greenColor');
}

// 具有常量构造函数的圆形类，实现 Shape 接口
class Circle implements Shape {
  // 所有实例变量必须使用 final
  final double radius;

  // 常量构造函数，注意 const 关键字
  const Circle({required this.radius});

  // 计算面积
  @override
  double get area => 3.14159 * radius * radius;

  @override
  String toString() =>
      'Circle(radius: $radius, area: ${area.toStringAsFixed(2)})';
}

// 具有常量构造函数的矩形类，实现 Shape 接口
class Rectangle implements Shape {
  final double width;
  final double height;

  const Rectangle({required this.width, required this.height});

  @override
  double get area => width * height;

  @override
  String toString() => 'Rectangle(width: $width, height: $height, area: $area)';
}

// 抽象形状接口
abstract class Shape {
  const Shape(); // 抽象类也可以有常量构造函数

  double get area;
}

// 带形状的位置类，演示嵌套常量对象
class Position {
  final double x;
  final double y;
  final Shape shape; // 嵌套另一个具有常量构造函数的类

  const Position({required this.x, required this.y, required this.shape});

  @override
  String toString() => 'Position(x: $x, y: $y, shape: $shape)';
}

// 三角形类，演示常量构造函数的初始化列表
class Triangle implements Shape {
  final double base;
  final double height;
  final double _area; // 预计算的面积

  // 常量构造函数使用初始化列表预计算面积
  const Triangle({required this.base, required this.height})
    : _area = base * height / 2;

  @override
  double get area => _area;

  @override
  String toString() => 'Triangle(base: $base, height: $height, area: $area)';
}

// 颜色类，演示命名常量构造函数
class Color {
  final int red;
  final int green;
  final int blue;
  final String name;

  // 常量构造函数
  const Color({
    required this.red,
    required this.green,
    required this.blue,
    required this.name,
  });

  // 命名常量构造函数 - RGB颜色
  const Color.rgb(this.red, this.green, this.blue, {required this.name});

  // 命名常量构造函数 - 预定义颜色
  const Color.predefined(String colorName)
    : red = colorName == 'red' ? 255 : (colorName == 'green' ? 0 : 0),
      green = colorName == 'green' ? 255 : (colorName == 'blue' ? 0 : 0),
      blue = colorName == 'blue' ? 255 : 0,
      name = colorName;

  @override
  String toString() => 'Color(name: $name, R: $red, G: $green, B: $blue)';
}

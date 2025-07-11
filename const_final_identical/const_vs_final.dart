// const_vs_final.dart
// 本文件演示 const 和 final 的区别和用法

void main() {
  print('==== const 和 final 的基本区别 ====');

  // const: 编译时常量，必须在编译时就能确定值
  const int a = 10;
  const String name = 'Dart';
  // 以下代码会报错，因为 DateTime.now() 是运行时才能确定的值
  // const time = DateTime.now(); // 错误

  // final: 运行时常量，值一旦被初始化后就不能再改变
  final int b = 20;
  final String language = 'Dart';
  final time = DateTime.now(); // 可以使用运行时表达式

  print('const 常量: a = $a, name = $name');
  print('final 常量: b = $b, language = $language, time = $time');

  print('\n==== const 和 final 变量修改尝试 ====');
  // 两者一旦初始化后都不能修改值
  // a = 100; // 错误: 常量不能被赋值
  // b = 200; // 错误: final 变量只能被赋值一次

  print('\n==== const 和 final 与集合 ====');
  // const 集合的元素也必须是编译时常量
  const List<int> constList = [1, 2, 3];
  // constList.add(4); // 错误: 不能修改 const 集合

  // final 集合本身不能改变引用，但其内容可以修改
  final List<int> finalList = [4, 5, 6];
  finalList.add(7); // 可以修改 final 集合的内容
  // finalList = [1, 2, 3]; // 错误: final 变量只能被赋值一次

  print('const 列表: $constList (不可修改内容)');
  print('final 列表: $finalList (可以修改内容)');

  // 如果想让 final 列表的内容也不可修改，可以结合 const 使用
  final List<int> immutableList = const [7, 8, 9];
  // immutableList.add(10); // 错误: 不能修改 const 集合
  print('不可变列表 (final const): $immutableList');

  print('\n==== const 在不同实例中的表现 ====');
  // const 相同值的对象实际上是同一个实例
  const p1 = Point(2, 3);
  const p2 = Point(2, 3);
  print('identical(p1, p2): ${identical(p1, p2)}'); // true，它们是同一个实例

  // 非 const 对象，即使值相同也是不同实例
  final p3 = Point(2, 3);
  final p4 = Point(2, 3);
  print('identical(p3, p4): ${identical(p3, p4)}'); // false，它们是不同实例
}

// 具有常量构造函数的类
class Point {
  // 成员变量必须是 final
  final int x;
  final int y;

  // 常量构造函数
  const Point(this.x, this.y);

  @override
  String toString() => 'Point($x, $y)';
}

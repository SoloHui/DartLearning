// identical_function.dart
// 本文件演示 identical 函数的用法和原理

void main() {
  print('==== identical 函数基本用法 ====');

  // identical 函数用于检查两个对象是否是同一个实例
  // 返回 true 表示两个引用指向内存中的同一个对象

  // 基本类型比较
  int a = 10;
  int b = 10;
  int c = a;

  print(
    'identical(a, b): ${identical(a, b)}',
  ); // 对于相同值的数字，可能返回 true（Dart 可能内部优化）
  print('identical(a, c): ${identical(a, c)}'); // true，c 引用与 a 相同

  print('\n==== 对象实例比较 ====');

  // 非常量对象 - 即使内容相同也是不同实例
  var obj1 = Person('张三', 30);
  var obj2 = Person('张三', 30);
  print('相同内容的非常量对象:');
  print('obj1: $obj1');
  print('obj2: $obj2');
  print('identical(obj1, obj2): ${identical(obj1, obj2)}'); // false，不同实例
  print('obj1 == obj2: ${obj1 == obj2}'); // 默认比较引用，false（除非重写 == 操作符）

  // 相同引用
  var obj3 = obj1;
  print('\n相同引用:');
  print('obj3 = obj1');
  print('identical(obj1, obj3): ${identical(obj1, obj3)}'); // true，相同实例

  print('\n==== 常量对象比较 ====');

  // 常量对象 - 相同值的常量对象是同一个实例
  const p1 = ImmutablePoint(5, 10);
  const p2 = ImmutablePoint(5, 10);
  print('相同内容的常量对象:');
  print('p1: $p1');
  print('p2: $p2');
  print('identical(p1, p2): ${identical(p1, p2)}'); // true，相同实例

  print('\n==== identical 与 == 的区别 ====');

  // 创建两个相等但不是同一个实例的对象
  var customObj1 = CustomObject(100);
  var customObj2 = CustomObject(100);

  print('customObj1: $customObj1');
  print('customObj2: $customObj2');
  print(
    'identical(customObj1, customObj2): ${identical(customObj1, customObj2)}',
  ); // false，不同实例
  print(
    'customObj1 == customObj2: ${customObj1 == customObj2}',
  ); // true，因为重写了 == 操作符

  print('\n==== 字符串特殊情况 ====');

  // 字符串字面量优化
  var str1 = 'hello';
  var str2 = 'hello';
  print('字符串字面量:');
  print('identical(str1, str2): ${identical(str1, str2)}'); // 通常为 true，Dart 会优化

  // 运行时构建的字符串
  var str3 = 'he' + 'llo';
  var str4 = 'h' + 'ello';
  print('运行时构建的字符串:');
  print('str3: $str3, str4: $str4');
  print('str3 == str4: ${str3 == str4}'); // true，内容相等
  print('identical(str3, str4): ${identical(str3, str4)}'); // 编译器优化可能使其为 true

  // 通过构造函数创建的字符串
  var str5 = String.fromCharCodes([104, 101, 108, 108, 111]); // "hello"
  print('通过构造函数创建的字符串:');
  print('str5: $str5');
  print('str1 == str5: ${str1 == str5}'); // true，内容相等
  print(
    'identical(str1, str5): ${identical(str1, str5)}',
  ); // 可能为 false，因为是不同方式创建的
}

// 普通类
class Person {
  String name;
  int age;

  Person(this.name, this.age);

  @override
  String toString() => 'Person(name: $name, age: $age)';
}

// 带有常量构造函数的类
class ImmutablePoint {
  final int x;
  final int y;

  const ImmutablePoint(this.x, this.y);

  @override
  String toString() => 'ImmutablePoint($x, $y)';
}

// 重写 == 操作符的类
class CustomObject {
  final int value;

  CustomObject(this.value);

  // 重写 == 操作符，使得基于值比较而非引用比较
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CustomObject && other.value == value;
  }

  // 重写 == 时必须重写 hashCode
  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'CustomObject(value: $value)';
}

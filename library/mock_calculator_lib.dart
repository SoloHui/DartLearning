/// 模拟计算器库
///
/// 这个库提供与custom.dart中相同名称的类和函数，用于演示冲突解决

// 常量
const String libraryVersion = '2.0.0';

// 与custom.dart中同名的计算器类，但实现不同
class Calculator {
  // 加法方法 - 实现不同，返回结果加10
  num add(num a, num b) => a + b + 10;

  // 减法方法 - 实现不同
  num subtract(num a, num b) => a - b - 5;

  // 乘法方法 - 实现不同
  num multiply(num a, num b) => a * b * 2;

  // 除法方法 - 实现不同
  num divide(num a, num b) {
    if (b == 0) throw ArgumentError('除数不能为零');
    return a / b / 2;
  }
}

// 与custom.dart中同名的函数，但实现不同
String greet(String name) {
  return '模拟库向$name问好！';
}

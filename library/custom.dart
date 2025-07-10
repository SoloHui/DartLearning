/// 这是一个自定义库示例
library custom_lib;

// 导出其他文件（如果有的话）
// export 'other_file.dart';

// 常量
const String libraryVersion = '1.0.0';
const String libraryAuthor = 'DartLearning';

// 类
class Calculator {
  // 加法方法
  num add(num a, num b) => a + b;

  // 减法方法
  num subtract(num a, num b) => a - b;

  // 乘法方法
  num multiply(num a, num b) => a * b;

  // 除法方法
  num divide(num a, num b) {
    if (b == 0) throw ArgumentError('除数不能为零');
    return a / b;
  }
}

// 公共函数
String greet(String name) {
  return '你好，$name！欢迎使用自定义库';
}

// 私有变量（以下划线开头）
final _privateValue = '这是库的私有变量';

// 私有函数（以下划线开头）
void _privateFunction() {
  print('这是库的私有函数，只能在库内部使用');
}

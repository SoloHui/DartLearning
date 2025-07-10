/// 此文件演示Dart中三种不同类型库的使用

// 1. 导入自定义库
import 'custom.dart';

// 2. 导入Dart内置库
import 'dart:math' as math;
import 'dart:convert';
import 'dart:io';

// 3. 导入Pub包管理系统中的库 (注释掉的代码，需要先配置pubspec.yaml)
// import 'package:http/http.dart' as http;

void main() async {
  print('=== Dart库的使用示例 ===\n');

  // 1. 使用自定义库
  print('【1】使用自定义库示例:');
  final calculator = Calculator();
  print('  加法: ${calculator.add(10, 5)}');
  print('  减法: ${calculator.subtract(10, 5)}');
  print('  乘法: ${calculator.multiply(10, 5)}');
  print('  除法: ${calculator.divide(10, 5)}');
  print('  问候: ${greet("张三")}\n');

  // 2. 使用Dart内置库
  print('【2】使用Dart内置库示例:');

  // 使用 dart:math
  print('  dart:math - 随机数: ${math.Random().nextInt(100)}');
  print('  dart:math - π值: ${math.pi}');
  print('  dart:math - 2的平方根: ${math.sqrt(2)}');

  // 使用 dart:convert
  final jsonString = '{"name": "李四", "age": 30}';
  final decodedJson = jsonDecode(jsonString);
  print('  dart:convert - JSON解析: $decodedJson');
  print('  dart:convert - 获取JSON值: ${decodedJson["name"]}');

  // 使用 dart:io (简单文件操作)
  final file = File('example.txt');
  try {
    await file.writeAsString('Hello Dart IO!');
    print('  dart:io - 写入文件成功');
    final content = await file.readAsString();
    print('  dart:io - 读取文件内容: $content');
    await file.delete();
    print('  dart:io - 删除文件成功\n');
  } catch (e) {
    print('  dart:io - 文件操作失败: $e\n');
  }

  // 3. 使用Pub包管理系统中的库 (注释掉的代码)
  print('【3】使用Pub包示例 (需要先配置pubspec.yaml):');
  print('  示例代码 (需要取消注释):');
  print('''
  // 发起HTTP请求
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
  if (response.statusCode == 200) {
    print('  HTTP请求成功: \${response.body}');
  } else {
    print('  HTTP请求失败，状态码: \${response.statusCode}');
  }
  ''');
}

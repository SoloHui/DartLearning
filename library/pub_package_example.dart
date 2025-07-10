/// 此文件演示如何使用Pub包管理系统中的库
///
/// 注意: 在运行此代码前，请先执行以下步骤:
/// 1. 确保项目根目录有pubspec.yaml文件
/// 2. 在终端中执行 `dart pub get` 或 `flutter pub get`(Flutter项目)命令获取依赖

import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  print('=== Pub包管理系统库使用示例 ===\n');

  try {
    // 使用http包发起GET请求
    print('发起HTTP GET请求...');
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));

    if (response.statusCode == 200) {
      // 请求成功，解析JSON数据
      final data = jsonDecode(response.body);
      print('请求成功! 数据:');
      print('  - 任务ID: ${data['id']}');
      print('  - 标题: ${data['title']}');
      print('  - 是否完成: ${data['completed']}');
    } else {
      // 请求失败
      print('请求失败，HTTP状态码: ${response.statusCode}');
    }

    // POST请求示例
    print('\n发起HTTP POST请求...');
    final postResponse = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'title': 'Dart HTTP示例',
        'body': '这是使用http包发送的POST请求',
        'userId': 1,
      }),
    );

    if (postResponse.statusCode == 201) {
      final postData = jsonDecode(postResponse.body);
      print('POST请求成功! 创建的数据:');
      print('  - ID: ${postData['id']}');
      print('  - 标题: ${postData['title']}');
    } else {
      print('POST请求失败，HTTP状态码: ${postResponse.statusCode}');
    }
  } catch (e) {
    print('发生错误: $e');
    print('\n注意: 请确保已运行 "dart pub get" 命令安装依赖！');
  }

  print('\n要使用Pub包，请按照以下步骤操作:');
  print('1. 在项目根目录创建pubspec.yaml文件');
  print('2. 在pubspec.yaml中配置依赖:');
  print('''
  dependencies:
    http: ^0.13.4
  ''');
  print('3. 运行 "dart pub get" 命令获取依赖');
  print('4. 在代码中导入包: import \'package:http/http.dart\' as http;');
}

/// Dart中异步编程: async和await关键字详细示例
///
/// 本文件专门演示Dart中异步编程的各种场景和用法

import 'dart:async';
import 'dart:io';

void main() async {
  print('===== Dart异步编程: async和await关键字详解 =====\n');

  // 1. 基础概念
  print('【1】基础概念:');
  print('  • Future: Dart中表示异步操作的对象，类似于JavaScript中的Promise');
  print('  • async: 标记函数为异步函数，该函数将自动返回Future');
  print('  • await: 暂停异步函数执行，等待Future完成后继续执行\n');

  // 2. 基本示例
  print('【2】基本用法示例:');
  print('  开始异步操作...');

  // 使用await等待异步操作完成
  String message = await getDelayedMessage();
  print('  接收到消息: $message\n');

  // 3. 串行执行多个异步任务
  print('【3】串行执行多个异步任务:');
  await serialTasks();
  print('  所有串行任务已完成\n');

  // 4. 并行执行多个异步任务
  print('【4】并行执行多个异步任务:');
  await parallelTasks();
  print('  所有并行任务已完成\n');

  // 5. 错误处理
  print('【5】异步操作的错误处理:');
  await errorHandling();
  print('  错误处理示例完成\n');

  // 6. 超时处理
  print('【6】异步操作超时处理:');
  await timeoutExample();
  print('  超时处理示例完成\n');

  // 7. Future API示例
  print('【7】Future API示例:');
  await futureApiExamples();
  print('  Future API示例完成\n');

  // 8. 实际应用场景
  print('【8】实际应用场景:');
  await practicalExamples();
  print('  实际应用场景示例完成\n');

  // 9. 异步生成器
  print('【9】异步生成器 (Stream):');
  await streamExamples();
  print('  异步生成器示例完成\n');

  // 10. 比较: async/await vs 回调
  print('【10】比较: async/await vs 回调:');
  print('  执行回调方式...');
  await callbackStyle(() {
    print('  回调方式执行完成');

    print('  执行async/await方式...');
    asyncAwaitStyle().then((_) {
      print('  async/await方式执行完成');
      print('  对比已完成 - async/await代码更清晰、更易于维护和理解\n');
    });
  });
}

// 简单的异步函数
Future<String> getDelayedMessage() async {
  // 模拟网络延迟
  await Future.delayed(Duration(seconds: 1));
  return '这是一条异步消息';
}

// 串行执行多个异步任务
Future<void> serialTasks() async {
  print('  开始串行执行任务...');

  print('  执行任务1');
  final result1 = await performTask(1, 1);
  print('  任务1结果: $result1');

  print('  执行任务2');
  final result2 = await performTask(2, 1);
  print('  任务2结果: $result2');

  print('  执行任务3');
  final result3 = await performTask(3, 1);
  print('  任务3结果: $result3');
}

// 并行执行多个异步任务
Future<void> parallelTasks() async {
  print('  开始并行执行任务...');

  // 启动多个任务但不等待
  final future1 = performTask(1, 2);
  final future2 = performTask(2, 1);
  final future3 = performTask(3, 3);

  // 方法1: 使用Future.wait等待所有任务完成
  print('  使用Future.wait等待所有任务完成');
  final results = await Future.wait([future1, future2, future3]);
  print('  所有结果: $results');

  // 方法2: 单独等待每个Future (已经在运行中)
  print('  单独等待每个Future');
  final task4 = performTask(4, 2);
  final task5 = performTask(5, 1);

  final result4 = await task4;
  print('  任务4结果: $result4');

  final result5 = await task5;
  print('  任务5结果: $result5');
}

// 异步错误处理
Future<void> errorHandling() async {
  // 1. 使用try-catch捕获异步操作错误
  print('  1. 使用try-catch捕获异步操作错误:');
  try {
    await failingTask();
    print('  这一行不会执行');
  } catch (e) {
    print('  捕获到错误: $e');
  }

  // 2. 使用Future API处理错误
  print('  2. 使用Future API处理错误:');
  await failingTask()
      .then((value) => print('  这一行不会执行'))
      .catchError((error) => print('  捕获到错误: $error'))
      .whenComplete(() => print('  操作完成 (相当于finally)'));

  // 3. 错误传播
  print('  3. 错误传播:');
  try {
    await errorPropagation();
  } catch (e) {
    print('  最外层捕获到错误: $e');
  }
}

// 超时处理
Future<void> timeoutExample() async {
  // 1. 使用Future.timeout处理超时
  print('  1. 使用Future.timeout:');
  try {
    final result =
        await longRunningTask().timeout(Duration(seconds: 2), onTimeout: () {
      return '操作超时，返回默认值';
    });
    print('  结果: $result');
  } catch (e) {
    print('  捕获到错误: $e');
  }

  // 2. 使用竞态条件实现超时
  print('  2. 使用竞态条件:');
  final result = await Future.any([
    longRunningTask(),
    Future.delayed(Duration(seconds: 2))
        .then((_) => throw TimeoutException('操作超时')),
  ]).catchError((e) {
    print('  操作超时: $e');
    return '超时后的默认结果';
  });

  print('  结果: $result');
}

// Future API示例
Future<void> futureApiExamples() async {
  // 1. Future.value - 立即完成的Future
  print('  1. Future.value:');
  final immediate = Future.value('立即值');
  print('  结果: ${await immediate}');

  // 2. Future.error - 立即失败的Future
  print('  2. Future.error:');
  try {
    await Future.error('立即错误');
  } catch (e) {
    print('  捕获错误: $e');
  }

  // 3. Future.delayed - 延迟执行
  print('  3. Future.delayed:');
  final delayed = await Future.delayed(Duration(seconds: 1), () => '延迟1秒后的值');
  print('  结果: $delayed');

  // 4. Future.forEach - 对集合中的每个元素执行异步操作
  print('  4. Future.forEach:');
  final items = [1, 2, 3];
  await Future.forEach(items, (int item) async {
    final result = await performTask(item, 1);
    print('  处理项目 $item: $result');
  });

  // 5. Future.microtask - 使用微任务队列
  print('  5. Future.microtask:');
  await Future.microtask(() => print('  在微任务队列中执行'));

  // 6. Future.sync - 同步执行函数并包装结果为Future
  print('  6. Future.sync:');
  try {
    final sync = await Future.sync(() {
      print('  同步执行函数');
      return '同步函数的结果';
    });
    print('  结果: $sync');
  } catch (e) {
    print('  错误: $e');
  }
}

// 实际应用场景
Future<void> practicalExamples() async {
  // 1. 文件操作
  print('  1. 文件操作:');
  final tempFile = File('temp_example.txt');

  try {
    // 写入文件
    await tempFile.writeAsString('这是测试内容\n第二行内容');
    print('  文件写入成功');

    // 读取文件
    final content = await tempFile.readAsString();
    print('  文件内容: $content');

    // 删除文件
    await tempFile.delete();
    print('  文件删除成功');
  } catch (e) {
    print('  文件操作错误: $e');
  }

  // 2. 模拟HTTP请求
  print('  2. 模拟HTTP请求:');
  try {
    final jsonData = await simulateHttpRequest();
    print('  HTTP响应数据: $jsonData');
    print('  用户名: ${jsonData['name']}');
    print('  年龄: ${jsonData['age']}');
  } catch (e) {
    print('  HTTP请求错误: $e');
  }

  // 3. 延迟初始化
  print('  3. 延迟初始化:');
  final service = await initializeService();
  final result = service.getData();
  print('  服务返回数据: $result');
}

// 异步生成器示例
Future<void> streamExamples() async {
  // 1. 创建和使用Stream
  print('  1. 基本Stream使用:');

  // 使用async*创建Stream
  Stream<int> numberStream = generateNumbers();

  // 监听Stream
  print('  开始接收数据流...');
  await for (final number in numberStream) {
    print('  收到数字: $number');
  }
  print('  数据流结束');

  // 2. Stream转换
  print('  2. Stream转换:');
  Stream<int> numbers = generateNumbers(5);

  // 使用map转换Stream中的值
  Stream<String> stringStream = numbers.map((number) => '数字: $number');

  await for (final str in stringStream) {
    print('  $str');
  }

  // 3. Stream过滤
  print('  3. Stream过滤:');
  Stream<int> allNumbers = generateNumbers(10);

  // 只保留偶数
  Stream<int> evenNumbers = allNumbers.where((number) => number % 2 == 0);

  await for (final even in evenNumbers) {
    print('  偶数: $even');
  }

  // 4. 处理Stream错误
  print('  4. 处理Stream错误:');
  try {
    await for (final item in errorStream()) {
      print('  接收到: $item');
    }
  } catch (e) {
    print('  Stream错误: $e');
  }
}

// 回调方式实现异步
Future<void> callbackStyle(Function callback) {
  print('  回调方式开始任务1');
  return Future.delayed(Duration(seconds: 1), () {
    print('  任务1完成');

    print('  回调方式开始任务2');
    Future.delayed(Duration(seconds: 1), () {
      print('  任务2完成');

      print('  回调方式开始任务3');
      Future.delayed(Duration(seconds: 1), () {
        print('  任务3完成');
        callback();
      });
    });
  });
}

// async/await方式实现异步
Future<void> asyncAwaitStyle() async {
  print('  async/await方式开始任务1');
  await Future.delayed(Duration(seconds: 1));
  print('  任务1完成');

  print('  async/await方式开始任务2');
  await Future.delayed(Duration(seconds: 1));
  print('  任务2完成');

  print('  async/await方式开始任务3');
  await Future.delayed(Duration(seconds: 1));
  print('  任务3完成');
}

//=== 辅助函数 ===

// 执行任务并返回结果
Future<String> performTask(int taskId, int seconds) async {
  print('  任务 $taskId 开始执行, 预计耗时 $seconds 秒');
  await Future.delayed(Duration(seconds: seconds));
  return '任务 $taskId 完成';
}

// 模拟失败的任务
Future<String> failingTask() async {
  await Future.delayed(Duration(seconds: 1));
  throw Exception('任务执行失败');
}

// 错误传播示例
Future<void> errorPropagation() async {
  try {
    await innerFunction();
  } catch (e) {
    print('  中间层捕获错误: $e');
    throw Exception('重新包装的错误'); // 重新抛出错误
  }
}

Future<void> innerFunction() async {
  await Future.delayed(Duration(milliseconds: 500));
  throw Exception('内部函数错误');
}

// 长时间运行的任务
Future<String> longRunningTask() async {
  await Future.delayed(Duration(seconds: 5));
  return '长时间运行的任务完成';
}

// 模拟HTTP请求
Future<Map<String, dynamic>> simulateHttpRequest() async {
  await Future.delayed(Duration(seconds: 2));

  // 模拟JSON响应
  return {'name': '张三', 'age': 30, 'email': 'zhangsan@example.com'};
}

// 模拟服务初始化
Future<Service> initializeService() async {
  print('  初始化服务中...');
  await Future.delayed(Duration(seconds: 1));
  print('  服务初始化完成');
  return Service();
}

// 生成数字流
Stream<int> generateNumbers([int count = 3]) async* {
  for (int i = 1; i <= count; i++) {
    // 模拟异步操作的延迟
    await Future.delayed(Duration(milliseconds: 500));
    yield i; // 产生一个值
  }
}

// 产生错误的Stream
Stream<int> errorStream() async* {
  yield 1;
  yield 2;
  await Future.delayed(Duration(milliseconds: 500));
  throw Exception('Stream中的错误');
  // 这之后的代码不会执行
}

// 简单服务类
class Service {
  String getData() {
    return '服务数据';
  }
}

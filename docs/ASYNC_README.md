# Dart异步编程: async和await关键字

这个文件`async_await_example.dart`是一个全面的Dart异步编程教程，详细演示了`async`和`await`关键字的各种用法和应用场景。

## 文件内容

该文件涵盖以下主题：

1. **基础概念**
   - Future对象的基本概念
   - async和await关键字的作用

2. **基本用法**
   - 简单异步函数示例
   - 等待异步操作完成

3. **串行与并行执行**
   - 按顺序执行多个异步任务
   - 同时执行多个异步任务并等待所有结果

4. **错误处理**
   - 使用try-catch捕获异步操作中的错误
   - 使用Future API处理错误
   - 错误传播机制

5. **超时处理**
   - 为异步操作设置超时
   - 使用竞态条件实现超时控制

6. **Future API示例**
   - Future.value, Future.error
   - Future.delayed
   - Future.forEach
   - Future.microtask
   - Future.sync

7. **实际应用场景**
   - 文件操作
   - HTTP请求模拟
   - 服务初始化

8. **异步生成器 (Stream)**
   - 创建和使用Stream
   - Stream转换和过滤
   - 处理Stream错误

9. **编程风格对比**
   - 回调方式 vs async/await方式
   - 代码可读性和维护性比较

## 运行示例

可以通过以下命令运行这个示例：

```bash
cd /Users/tonature/Workspace/DartLearning
dart library/async_await_example.dart
```

## 关键点

1. **异步函数定义**

   ```dart
   Future<String> functionName() async {
     // 异步操作
     return result;
   }
   ```

2. **等待异步结果**

   ```dart
   final result = await someAsyncFunction();
   ```

3. **并行执行多个异步操作**

   ```dart
   final results = await Future.wait([
     operation1(),
     operation2(),
     operation3(),
   ]);
   ```

4. **异步生成器**

   ```dart
   Stream<int> generateNumbers() async* {
     for (int i = 1; i <= 3; i++) {
       yield i;
     }
   }
   ```

5. **异步操作中的错误处理**

   ```dart
   try {
     final result = await riskyOperation();
   } catch (e) {
     print('Error: $e');
   }
   ```

## Future

`Future` 在 Dart 语言中不是关键字，而是一个类型。它是 Dart 中用于处理异步操作的核心类。

在 Dart 中，与异步编程相关的关键字实际上是：

1. `async` - 用于标记一个函数是异步函数
2. `await` - 用于等待一个 Future 完成
3. `yield` - 用在异步生成器函数中产生值

`Future` 本身是 Dart 标准库中定义的一个类，类似于 JavaScript 中的 Promise。它表示一个可能尚未完成的异步操作，这个操作将在未来的某个时间点完成并产生一个值或错误。

例如，在您的代码中：

```dart
Future<String> getDelayedMessage() async {
  await Future.delayed(Duration(seconds: 1));
  return '这是一条异步消息';
}
```

这里 `Future<String>` 是返回类型，表示这个函数会返回一个 Future 对象，该对象最终会解析为一个字符串值。

`Future` 类提供了多种方法来处理异步操作的结果，如 `then()`, `catchError()`, `whenComplete()` 等，以及静态方法如 `Future.wait()`, `Future.delayed()` 等。

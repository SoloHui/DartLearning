# Dart 函数

这个目录包含了Dart函数相关的代码示例，包括函数定义、参数类型、作用域、返回值、闭包等内容。通过这些示例，您可以学习Dart中函数的各种特性和使用方法。

## 函数基础

Dart是一种真正的面向对象语言，所以即使是函数也是对象，它们的类型是`Function`。这意味着函数可以被赋值给变量，作为参数传递给其他函数，或者从其他函数返回。

### 函数定义

[`define_param_scope.dart`](./define_param_scope.dart)文件演示了Dart中不同类型的函数定义：

```dart
// 基本函数定义
void greet() {
  print("Hello, World!");
}

// 带返回值的函数
int add(int a, int b) {
  return a + b;
}

// 箭头函数（表达式函数）
int multiply(int a, int b) => a * b;
```

关键知识点：

- 函数声明包括返回类型、函数名、参数列表和函数体
- `void`表示函数不返回值
- 箭头函数(`=>`)是单表达式函数的简写形式
- 所有函数都有返回值，如果没有指定，默认返回`null`（在非空安全之前）或返回类型的默认值（在空安全之后）

## 函数参数

### 必选参数

```dart
void greetWithName(String name) {
  print("Hello, $name!");
}
```

### 可选参数

Dart提供了两种类型的可选参数：

#### 1. 位置可选参数

使用`[]`括起来的参数是位置可选参数：

```dart
void greetOptional(String name, [String? title]) {
  if (title != null) {
    print("Hello, $title $name!");
  } else {
    print("Hello, $name!");
  }
}

// 调用方式
greetOptional("Bob");         // 不提供可选参数
greetOptional("Bob", "Mr.");  // 提供可选参数
```

#### 2. 命名可选参数

使用`{}`括起来的参数是命名可选参数：

```dart
void createUser({required String name, int age = 18}) {
  print("User: $name, Age: $age");
}

// 调用方式
createUser(name: "Charlie");             // 只提供必需参数
createUser(name: "David", age: 30);      // 提供所有参数
```

关键知识点：

- `required`关键字用于标记必需的命名参数
- 可选参数可以有默认值
- 使用`?`表示参数可以接受`null`值（空安全）
- 命名参数提高了代码的可读性，特别是当函数有多个参数时

## 作用域和变量

Dart中的变量遵循词法作用域，这意味着变量的可见性由其在源代码中的位置决定：

```dart
// 全局变量
String globalVar = "I'm a global variable";

void scopeExample() {
  String localVar = "I'm a local variable";

  // 嵌套作用域
  if (true) {
    String blockVar = "I'm in a block";
    print(localVar);  // 可以访问外层作用域
    print(blockVar);  // 可以访问当前作用域
    print(globalVar); // 可以访问全局作用域
  }
  
  // print(blockVar); // 错误：无法访问块级作用域变量
}
```

关键知识点：

- 变量的可见性取决于其声明的位置
- 内部作用域可以访问外部作用域的变量
- 外部作用域不能访问内部作用域的变量
- 全局变量在整个程序中可见

## 高阶函数

在Dart中，函数是一等公民，这意味着函数可以：

- 赋值给变量
- 作为参数传递给其他函数
- 从其他函数返回

```dart
// 函数作为参数
void executeFunction(void Function() fn) {
  fn();
}

// 使用
executeFunction(() => print("Anonymous function executed"));
```

## 匿名函数和闭包

### 匿名函数

匿名函数（lambda表达式）是没有名称的函数：

```dart
// 匿名函数语法
() {
  // 函数体
}

// 带参数的匿名函数
(param1, param2) {
  // 函数体
}

// 箭头语法
(param) => expression;
```

### 闭包

闭包是一个函数对象，它可以访问其词法作用域中的变量，即使这个函数在其原始作用域之外被调用：

```dart
// 闭包示例
int Function() createCounter() {
  int count = 0;
  return () {
    count++;
    return count;
  };
}

// 使用闭包
var counter = createCounter();
print(counter()); // 1
print(counter()); // 2
print(counter()); // 3
```

关键知识点：

- 闭包可以"记住"其创建时的环境
- 每个闭包实例都有自己的变量副本
- 闭包对于实现数据封装和私有状态很有用

## 函数返回值

Dart函数可以返回任何类型的值：

```dart
// 返回基本类型
int add(int a, int b) {
  return a + b;
}

// 返回集合
List<int> getNumbers() {
  return [1, 2, 3, 4, 5];
}

// 返回复杂对象
Map<String, dynamic> getUserInfo() {
  return {'name': 'John', 'age': 25, 'email': 'john@example.com'};
}

// 返回函数
Function getOperation(String type) {
  if (type == 'add') {
    return (a, b) => a + b;
  } else {
    return (a, b) => a * b;
  }
}
```

## 实际应用场景

### 1. 事件处理器

```dart
button.onClick.listen((event) {
  // 这是一个匿名函数作为事件处理器
  print('Button clicked!');
});
```

### 2. 集合处理

```dart
List<int> numbers = [1, 2, 3, 4, 5];
var doubled = numbers.map((n) => n * 2).toList();
var sum = numbers.fold(0, (prev, element) => prev + element);
```

### 3. 回调函数

```dart
void fetchData(void Function(String) onSuccess, void Function(String) onError) {
  try {
    // 模拟数据获取
    String data = "Success data";
    onSuccess(data);
  } catch (e) {
    onError(e.toString());
  }
}

// 使用
fetchData(
  (data) => print("Got data: $data"),
  (error) => print("Error: $error")
);
```

### 4. 构建器模式

```dart
class QueryBuilder {
  List<String> conditions = [];
  
  QueryBuilder where(String condition) {
    conditions.add(condition);
    return this;
  }
  
  String build() {
    return "SELECT * FROM table WHERE ${conditions.join(' AND ')}";
  }
}

// 链式调用
var query = QueryBuilder()
  .where("age > 18")
  .where("status = 'active'")
  .build();
```

## 函数式编程

Dart支持函数式编程范式，提供了许多内置的高阶函数：

- `map()`: 转换元素
- `where()`: 过滤元素
- `reduce()`: 将集合归约为单一值
- `fold()`: 使用初始值归约集合
- `forEach()`: 遍历每个元素

示例：

```dart
List<int> numbers = [1, 2, 3, 4, 5];
var evenNumbers = numbers.where((n) => n % 2 == 0);
var evenSquares = evenNumbers.map((n) => n * n);
var sum = evenSquares.fold(0, (total, value) => total + value);

// 链式调用
var result = numbers
    .where((n) => n % 2 == 0)
    .map((n) => n * n)
    .fold(0, (total, value) => total + value);
```

## 学习资源

- [Dart官方文档 - 函数](https://dart.dev/language/functions)
- [Dart官方文档 - 词法作用域](https://dart.dev/language/variables#lexical-scope)
- [Dart官方文档 - 闭包](https://dart.dev/language/functions#lexical-closures)
- [Dart官方文档 - 函数式编程](https://dart.dev/language/functions#functional-programming)

# Dart 基础语法

本文件夹包含Dart编程语言的基础知识点示例代码，适合Dart初学者入门学习。

## 文件说明

- **[main.dart](./main.dart)**：展示了最基本的Dart程序结构和`main()`函数
- **[variables.dart](./variables.dart)**：展示Dart中的各种数据类型和变量声明方式
- **[string.dart](./string.dart)**：展示Dart中字符串的操作和处理方法
- **[list.dart](./list.dart)**：展示Dart中列表的创建与操作方法
- **[map.dart](./map.dart)**：展示Dart中映射(键值对)的创建与操作方法
- **[bool.dart](./bool.dart)**：展示Dart中布尔值与类型判断相关操作

## 关键知识点

### 1. 程序入口与基本结构

```dart
void main() {
  // 代码写在这里
  print('Hello, Dart!');
}
```

- Dart程序的入口是`main()`函数
- 语句末尾需要用分号(`;`)结束
- 使用`print()`函数进行控制台输出

### 2. 变量与数据类型

Dart是强类型语言，但支持类型推断：

```dart
// 明确指定类型
int age = 30;
String name = "张三";
bool isActive = true;

// 使用var让编译器推断类型
var score = 95; // 推断为int类型
var message = "Hello"; // 推断为String类型

// 动态类型
dynamic value = "字符串";
value = 100; // 可以更改类型

// 常量
final birthday = "2000-01-01"; // 运行时常量，只能赋值一次
const PI = 3.14159; // 编译时常量
```

Dart支持的基本数据类型：

- `int`：整数
- `double`：浮点数
- `num`：数字(可以是整数或浮点数)
- `String`：字符串
- `bool`：布尔值
- `List`：列表
- `Set`：集合
- `Map`：映射(键值对)
- `Symbol`：符号
- `dynamic`：动态类型

### 3. 字符串操作

Dart提供了丰富的字符串操作方法：

```dart
// 字符串定义方式
String s1 = 'Hello'; // 单引号
String s2 = "Hello"; // 双引号
String s3 = '''多行
字符串'''; // 三个单引号，支持多行
String s4 = """多行
字符串"""; // 三个双引号，支持多行

// 字符串插值
String name = "Dart";
print("Hello $name"); // 使用$变量名插入变量
print("Hello ${name.toUpperCase()}"); // 使用${}插入表达式

// 字符串拼接
String result = "Hello" + " " + "Dart";
```

### 4. 列表操作

```dart
// 创建列表
List<int> numbers = [1, 2, 3, 4, 5];
var names = ['张三', '李四', '王五'];

// 访问元素
print(numbers[0]); // 索引从0开始
print(numbers.first); // 第一个元素
print(numbers.last); // 最后一个元素

// 添加元素
numbers.add(6);
numbers.addAll([7, 8, 9]);

// 其他操作
int length = numbers.length;
bool contains3 = numbers.contains(3);
List<int> subList = numbers.sublist(1, 3); // [2, 3]
```

### 5. Map操作

```dart
// 创建Map
Map<String, int> scores = {
  'math': 95,
  'english': 85,
  'history': 90
};

// 访问元素
print(scores['math']); // 95

// 添加或修改元素
scores['science'] = 88;
scores['math'] = 98;

// 其他操作
print(scores.keys); // 所有键
print(scores.values); // 所有值
scores.forEach((key, value) {
  print('$key: $value');
});
```

### 6. 类型判断与布尔操作

```dart
var value = 42;

// 类型判断
if (value is int) {
  print('value是整数');
}

// 布尔操作符
bool result = value > 30 && value < 50;
```

## 学习资源

- [Dart官方文档](https://dart.dev/guides)
- [DartPad在线编辑器](https://dartpad.dev)
- [Dart语言之旅](https://dart.dev/guides/language/language-tour)

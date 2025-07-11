# Dart 运算符、判断和类型转换

这个目录包含了Dart语言中的运算符(Operators)、判断语句(Conditionals)和类型转换(Type Conversion)相关的代码示例。掌握这些基础知识点对于编写高效且可靠的Dart代码至关重要。

## 文件说明

### 1. `operator.dart`

这个文件演示了Dart中的各种运算符：

- **算术运算符**：用于执行基本的数学运算
- **关系运算符**：用于比较两个值
- **逻辑运算符**：用于组合布尔表达式
- **赋值运算符**：用于给变量赋值

```dart
// 算术运算符示例
int a = 10;
int b = 3;
print('a + b = ${a + b}');    // 加法: 13
print('a - b = ${a - b}');    // 减法: 7
print('a * b = ${a * b}');    // 乘法: 30
print('a / b = ${a / b}');    // 除法: 3.3333...
print('a ~/ b = ${a ~/ b}');  // 整除: 3
print('a % b = ${a % b}');    // 取余: 1
```

### 2. `judge.dart`

这个文件演示了Dart中的条件判断语句和表达式：

- **if-else 语句**：基于条件执行不同的代码块
- **switch-case 语句**：多条件分支判断
- **三目运算符**：简洁的条件表达式
- **空值处理运算符**：安全地处理可能为空的值

```dart
// 三目运算符示例
int score = 85;
String result = score >= 60 ? '及格' : '不及格';

// 空值合并运算符示例
String? name = null;
String displayName = name ?? '未知用户';  // 如果name为null，使用'未知用户'
```

### 3. `convert.dart`

这个文件演示了Dart中不同类型之间的转换：

- **字符串转其他类型**：将字符串转换为数字、布尔值等
- **数字和布尔值转字符串**：将其他类型转换为字符串
- **数值类型之间转换**：在int和double之间转换
- **安全类型转换**：使用异常处理和tryParse方法

```dart
// 字符串转其他类型
String numStr = "123";
int intFromString = int.parse(numStr);  // 123

// 安全转换
int? safeInt = int.tryParse("invalid");  // null，而不是抛出异常
```

## Dart运算符详解

### 1. 算术运算符

| 运算符 | 描述 | 示例 |
| ------ | ---- | ---- |
| `+` | 加法 | `a + b` |
| `-` | 减法 | `a - b` |
| `*` | 乘法 | `a * b` |
| `/` | 除法（返回double） | `a / b` |
| `~/` | 整除（返回int） | `a ~/ b` |
| `%` | 取余 | `a % b` |

### 2. 递增和递减运算符

```dart
int a = 5;
a++;  // 后置递增：a = a + 1
++a;  // 前置递增：a = a + 1
a--;  // 后置递减：a = a - 1
--a;  // 前置递减：a = a - 1
```

前置和后置的区别在于表达式的返回值：

- 前置运算符会先修改变量值，然后返回修改后的值
- 后置运算符会先返回变量的当前值，然后再修改变量值

### 3. 关系运算符

所有关系运算符都返回布尔值：

| 运算符 | 描述 | 示例 |
| ------ | ---- | ---- |
| `==` | 等于 | `a == b` |
| `!=` | 不等于 | `a != b` |
| `>` | 大于 | `a > b` |
| `<` | 小于 | `a < b` |
| `>=` | 大于等于 | `a >= b` |
| `<=` | 小于等于 | `a <= b` |

### 4. 逻辑运算符

用于组合或修改布尔表达式：

| 运算符 | 描述 | 示例 |
| ------ | ---- | ---- |
| `&&` | 逻辑与：两边都为true才返回true | `a && b` |
| OR | 逻辑或：两边任意一个为true就返回true | `a OR b` |
| `!` | 逻辑非：反转布尔值 | `!a` |

注意：表格中的"OR"代表双竖线逻辑或运算符(`||`)，因为Markdown表格中竖线是特殊字符。

### 5. 赋值运算符

| 运算符 | 描述 | 等价于 |
| ------ | ---- | ------ |
| `=` | 赋值 | `a = b` |
| `+=` | 加法赋值 | `a = a + b` |
| `-=` | 减法赋值 | `a = a - b` |
| `*=` | 乘法赋值 | `a = a * b` |
| `/=` | 除法赋值 | `a = a / b` |
| `~/=` | 整除赋值 | `a = a ~/ b` |
| `%=` | 取余赋值 | `a = a % b` |

### 6. 条件表达式

Dart提供了三种特殊的运算符用于简洁表示条件：

- **三目运算符** `condition ? expr1 : expr2`

  ```dart
  int a = 10;
  int b = 5;
  int max = a > b ? a : b;  // 10
  ```

- **空合并运算符** `??`

  ```dart
  String? name;
  String displayName = name ?? 'Guest';  // 'Guest'
  ```

- **空赋值运算符** `??=`

  ```dart
  String? name;
  name ??= 'Guest';  // 如果name为null，则赋值'Guest'
  ```

## 条件语句详解

### 1. if-else 语句

最基本的条件判断结构：

```dart
if (condition) {
  // 当条件为真时执行
} else if (anotherCondition) {
  // 当另一个条件为真时执行
} else {
  // 当所有条件都为假时执行
}
```

### 2. switch-case 语句

用于多条件分支判断：

```dart
switch (variable) {
  case value1:
    // 当variable等于value1时执行
    break;
  case value2:
    // 当variable等于value2时执行
    break;
  default:
    // 当variable不匹配任何case时执行
}
```

在Dart中，switch语句可以用于判断：

- 整数
- 字符串
- 编译时常量
- 枚举值

## 类型转换详解

### 1. 字符串与其他类型的转换

```dart
// 字符串转数字
int age = int.parse('30');
double price = double.parse('19.99');

// 数字转字符串
String ageStr = 30.toString();
String priceStr = 19.99.toString();
```

### 2. 数值类型之间的转换

```dart
// int转double
int intValue = 10;
double doubleValue = intValue.toDouble();  // 10.0

// double转int
double pi = 3.14;
int intPi = pi.toInt();  // 3 (截断小数部分)
```

### 3. 安全的类型转换

处理可能失败的转换：

```dart
// 使用try-catch
try {
  int value = int.parse('not a number');
} catch (e) {
  print('转换失败：$e');
}

// 使用tryParse (更推荐)
int? value = int.tryParse('not a number');  // 返回null
if (value == null) {
  print('转换失败');
}
```

### 4. 动态类型与类型检查

Dart提供了类型检查和类型转换的运算符：

```dart
// is运算符：检查对象是否为指定类型
if (value is int) {
  // 在这个作用域内，编译器知道value是int类型
  print(value + 10);
}

// as运算符：类型转换
var value = jsonData['amount'] as double;
```

## 最佳实践

### 1. 运算符使用

- **优先使用简洁表达式**：使用`??`、`??=`等运算符简化空值处理
- **注意运算符优先级**：使用括号明确运算优先级，提高代码可读性
- **避免过度复杂的表达式**：将复杂表达式拆分为多个简单语句

### 2. 条件判断

- **避免嵌套过深的if-else**：考虑使用提前返回或switch语句
- **善用三目运算符**：简单条件可以用三目运算符使代码更简洁
- **注意switch语句中的break**：忘记break可能导致意外的"穿透"行为

### 3. 类型转换

- **优先使用tryParse**：处理可能失败的转换，而不是依赖异常处理
- **显式转换**：在不确定类型时使用显式转换，而不是依赖自动转换
- **验证转换后的值**：转换后检查值是否在预期范围内

## 学习资源

- [Dart官方文档 - 运算符](https://dart.dev/language/operators)
- [Dart官方文档 - 控制流语句](https://dart.dev/language/branches)
- [Dart官方文档 - 内置类型](https://dart.dev/language/built-in-types)
- [Dart API参考 - 类型转换方法](https://api.dart.dev/stable/dart-core/num-class.html)

# Dart 库与包管理

这个目录包含了Dart语言中库(Libraries)和包管理(Package Management)相关的代码示例与最佳实践。Dart库系统是代码组织和重用的基础，掌握库的使用与创建对于开发高质量的Dart应用至关重要。

## 文件说明

### 1. [`custom.dart`](./custom.dart)

这个文件展示了如何创建自定义库：

- **库声明**：使用`library`关键字定义库
- **公共API**：定义可供外部使用的类、函数和常量
- **私有成员**：使用下划线前缀定义库的私有成员
- **基本组件**：创建一个计算器类及其方法

### 2. [`library_usage_example.dart`](./library_usage_example.dart)

这个文件演示了Dart中三种不同类型库的使用：

- **自定义库**：导入和使用项目内部创建的库
- **Dart内置库**：使用Dart SDK提供的标准库
  - dart:math - 数学运算
  - dart:convert - 数据编解码
  - dart:io - 文件和网络操作
- **Pub包管理系统库**：使用第三方库的基本流程

### 3. [`library_rename_example.dart`](./library_rename_example.dart)

这个文件展示了库重命名和解决名称冲突的技术：

- **库别名**：使用`as`关键字给库取别名
- **选择性导入**：使用`show`关键字只导入特定内容
- **排除性导入**：使用`hide`关键字排除特定内容
- **解决名称冲突**：处理多个库中存在相同名称的情况

### 4. [`mock_calculator_lib.dart`](./mock_calculator_lib.dart)

这个文件是一个模拟库，用于演示名称冲突的解决：

- **同名类**：定义与`custom.dart`中相同名称但实现不同的类
- **冲突解决**：展示如何处理多个库中的同名元素

### 5. [`async_await_example.dart`](./async_await_example.dart)

这个文件详细介绍了Dart中的异步编程：

- **Future基础**：异步操作的表示和处理
- **async/await**：简化异步代码的语法糖
- **并发控制**：串行和并行执行异步任务
- **错误处理**：异步操作中的异常捕获和处理
- **超时控制**：为异步操作设置超时限制
- **Stream**：处理异步数据流

### 6. [`pub_package_example.dart`](./pub_package_example.dart)

这个文件展示了如何使用Pub包管理系统中的库：

- **导入第三方库**：使用`package:`前缀导入外部包
- **HTTP请求**：使用http包发起网络请求
- **JSON处理**：处理API返回的JSON数据

### 7. [`pubspec.yaml`](./pubspec.yaml)

项目的包管理配置文件：

- **项目信息**：名称、描述等元数据
- **环境约束**：支持的Dart SDK版本范围
- **依赖管理**：项目的依赖项及其版本
- **开发依赖**：仅在开发环境使用的依赖

## Dart库系统详解

### 1. 库的类型

在Dart中，库可以分为三种主要类型：

1. **自定义库**：开发者自己创建的库
2. **内置库**：Dart SDK提供的标准库
3. **第三方库**：通过Pub包管理系统分发的库

### 2. 创建自定义库

定义库的基本语法：

```dart
/// 库的文档注释
library my_library;

// 导出其他库中的内容
export 'other_file.dart';

// 公共API
class MyClass { ... }
void publicFunction() { ... }
const publicConstant = 42;

// 私有成员 (使用下划线前缀)
class _PrivateClass { ... }
void _privateFunction() { ... }
final _privateVariable = 'hidden';
```

### 3. 导入库

导入库的各种方式：

```dart
// 基本导入
import 'dart:math';
import 'package:my_package/my_library.dart';
import 'relative/path/to/local_library.dart';

// 使用别名
import 'dart:math' as math;
print(math.pi); // 使用别名访问

// 选择性导入
import 'dart:math' show Random, min, max;

// 排除性导入
import 'dart:math' hide Random;
```

### 4. 库冲突解决

解决库中的命名冲突：

```dart
// 使用库别名区分同名元素
import 'package1.dart';
import 'package2.dart' as pkg2;

// 使用第一个库中的Element
var element1 = Element();

// 使用第二个库中的Element
var element2 = pkg2.Element();
```

### 5. Pub包管理

使用Dart的包管理系统：

**使用Pub包管理的步骤**：

步骤1: **创建pubspec.yaml**：

```yaml
name: my_app
description: A sample application
version: 1.0.0

environment:
  sdk: '>=2.12.0 <3.0.0'

dependencies:
  http: ^0.13.4
  path: ^1.8.0
  
dev_dependencies:
  test: ^1.16.0
```

步骤2: **安装依赖**：

```bash
dart pub get
```

步骤3: **使用依赖库**：

```dart
import 'package:http/http.dart' as http;
```

### 6. 异步编程

Dart中的异步库支持：

```dart
// 异步函数定义
Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 1));
  return 'Data loaded';
}

// 使用异步函数
void main() async {
  print('Loading...');
  String data = await fetchData();
  print(data);
}
```

## 库的最佳实践

### 1. API设计

- **最小化公共API**：只导出真正需要对外公开的内容
- **使用文档注释**：为公共API提供清晰的文档
- **遵循命名约定**：使用lowerCamelCase命名方法和变量
- **版本控制**：语义化版本号管理库版本

### 2. 组织结构

- **按功能分组**：将相关功能组织在同一个库中
- **避免循环依赖**：库之间的依赖应形成有向无环图
- **适当拆分**：过大的库应拆分为更小的、功能单一的库

### 3. 导入策略

- **明确导入**：使用show明确导入需要的内容
- **别名使用**：使用as为频繁使用的库指定简短别名
- **避免通配符**：避免导入过多不必要的内容

## 实际应用场景

### 1. 模块化应用架构

使用库系统构建模块化应用：

```text
my_app/
  ├── lib/
  │   ├── src/
  │   │   ├── api/
  │   │   ├── models/
  │   │   └── utils/
  │   ├── api.dart    (导出api/)
  │   ├── models.dart (导出models/)
  │   └── utils.dart  (导出utils/)
  └── pubspec.yaml
```

### 2. 创建可重用组件库

发布可供其他项目使用的库：

```dart
// 定义库API
library my_widgets;

export 'src/button.dart';
export 'src/textfield.dart';
export 'src/checkbox.dart';
```

### 3. 平台特定代码隔离

使用条件导入处理不同平台：

```dart
// 根据平台导入不同实现
import 'dart:io' if (dart.library.html) 'dart:html';
```

## 学习资源

- [Dart官方文档 - 库和可见性](https://dart.dev/language/libraries)
- [Dart官方文档 - 创建包](https://dart.dev/guides/libraries/create-library-packages)
- [Pub网站 - Dart和Flutter包](https://pub.dev/)
- [Effective Dart: 设计指南](https://dart.dev/guides/language/effective-dart/design)

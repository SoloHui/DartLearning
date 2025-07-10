# Dart库的使用

Dart中的库主要有三种类型：

## 1. 自定义库

这是我们自己创建的库文件，可以在项目中直接导入使用。

**导入方式**:

```dart
import 'lib/xxx.dart';
```

**示例**:

- [custom.dart](library/custom.dart): 自定义库示例
- [library_usage_example.dart](library/library_usage_example.dart): 使用自定义库的示例

## 2. 系统内置库

Dart提供的标准库，无需额外安装即可使用。

**常用内置库**:

```dart
import 'dart:math';     // 数学运算
import 'dart:io';       // 文件和网络I/O操作
import 'dart:convert';  // 编码和解码(JSON, UTF-8等)
```

**示例**:

- [library_usage_example.dart](library/library_usage_example.dart): 使用Dart内置库的示例

## 3. Pub包管理系统中的库

来自Pub包管理系统的第三方库。

**官方包仓库**:

- [pub.dev/packages](https://pub.dev/packages)
- [pub.flutter-io.cn/packages](https://pub.flutter-io.cn/packages) (中国镜像)
- [pub.dartlang.org/flutter](https://pub.dartlang.org/flutter/)

**使用步骤**:

1. 在项目根目录创建`pubspec.yaml`文件
2. 在`pubspec.yaml`中配置名称、描述、依赖等信息
3. 运行`dart pub get`或`flutter pub get`命令获取包
4. 在代码中导入库: `import 'package:http/http.dart' as http;`

**示例**:

- [pubspec.yaml](pubspec.yaml): 项目依赖配置示例
- [pub_package_example.dart](library/pub_package_example.dart): 使用第三方包的示例

## 运行示例

运行自定义库和内置库示例:

```bash
dart library/library_usage_example.dart
```

运行第三方库示例(需要先安装依赖):

```bash
# 先安装依赖
dart pub get

# 然后运行示例
dart library/pub_package_example.dart
```

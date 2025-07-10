# Dart库重命名和冲突解决技术

Dart提供了多种机制来处理库的导入、重命名以及解决名称冲突问题。本文档将详细说明这些技术以及它们的使用场景。

## 基本导入

最简单的导入方式是直接使用`import`语句：

```dart
import 'dart:math';
import 'custom.dart';
```

这种方式会将库中所有公开的类、函数和变量导入到当前作用域。

## 库重命名 (as关键字)

当需要导入两个包含同名元素的库时，可以使用`as`关键字为库指定别名：

```dart
import 'package1.dart';
import 'package2.dart' as pkg2;

// 使用默认导入的元素
var obj1 = SomeClass();

// 使用重命名库中的元素
var obj2 = pkg2.SomeClass();
```

这是解决名称冲突最常用的方法。

## 选择性导入 (show关键字)

如果只需要库中的特定元素，可以使用`show`关键字：

```dart
// 只导入Random和min函数
import 'dart:math' show Random, min;
```

这样可以减少命名空间污染，并且提高代码的清晰度。

## 排除性导入 (hide关键字)

如果想导入库中除了某些特定元素之外的所有内容，可以使用`hide`关键字：

```dart
// 导入除了max之外的所有内容
import 'dart:math' hide max;
```

## 组合使用

这些技术可以组合使用，例如：

```dart
// 重命名并只导入部分内容
import 'dart:math' as math show Random, min, max;
```

## 常见使用场景

1. **处理同名类**

   当两个库中有相同名称的类时，使用`as`重命名是最佳实践：

   ```dart
   import 'package:lib1/lib1.dart';
   import 'package:lib2/lib2.dart' as lib2;
   
   // 使用lib1中的Element
   var element1 = Element();
   
   // 使用lib2中的Element
   var element2 = lib2.Element();
   ```

2. **避免命名空间污染**

   当只需要库中的少量功能时，使用`show`可以避免引入过多不需要的名称：

   ```dart
   // 只导入需要的功能
   import 'package:large_library/large_library.dart' show SpecificClass, specificFunction;
   ```

3. **解决特定冲突**

   当库中某个名称与本地名称冲突时，可以使用`hide`排除它：

   ```dart
   // 如果本地代码中已经有了"Element"类
   import 'package:html/html.dart' hide Element;
   ```

## 最佳实践

- 当导入整个库且没有命名冲突时，使用默认导入
- 当有命名冲突时，优先考虑使用`as`重命名冲突的库
- 当只需要库中的少量元素时，使用`show`
- 当库中的大部分内容都需要，只有少量元素冲突时，使用`hide`

遵循这些原则可以使代码更易于理解和维护。

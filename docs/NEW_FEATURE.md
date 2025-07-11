# Dart 新特性示例

目录`new_feature`包含了 Dart 语言中的一些重要新特性示例代码。

## 文件列表

1. **null_safety.dart** - 空安全特性
   - 非可空类型声明
   - 可空类型声明
   - 空值判断
   - 空感知操作符（?.、??、??=）

2. **late_keyword.dart** - late 关键字
   - 延迟初始化变量
   - 惰性初始化
   - late final 组合使用
   - 在类中的应用

3. **nullable_type_operator.dart** - 空类型声明符 ?
   - 可空类型声明
   - 可空类型的赋值和重置
   - 可空函数参数和返回值
   - 可空泛型
   - 类中的可空属性

4. **non_null_assertion.dart** - 非空断言操作符 !
   - 基本用法
   - 安全的使用场景
   - 链式调用中使用
   - 危险用法警告

5. **required_keyword.dart** - required 关键字
   - 标记必需的命名参数
   - 在类构造函数中使用
   - 与可空类型结合使用
   - 在接口中使用

## 运行方式

可以通过以下命令运行示例：

```bash
dart run <文件名>
```

例如：

```bash
dart run null_safety.dart
```

## 注意事项

这些特性需要 Dart 2.12 或更高版本才能支持。确保您的 Dart SDK 是最新版本。

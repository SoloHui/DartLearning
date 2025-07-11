// Dart 空安全（Null Safety）演示
// 空安全是 Dart 2.12 版本引入的重要特性

void main() {
  // 1. 非可空类型 (Non-nullable types)
  String nonNullableString = 'Hello'; // 必须初始化，不能为 null
  int nonNullableInt = 42; // 必须初始化，不能为 null

  // 以下代码在空安全下会报错
  // String willError = null;
  // int anotherError;  // 未初始化的非空类型

  print('非空字符串: $nonNullableString');
  print('非空整数: $nonNullableInt');

  // 2. 可空类型 (Nullable types)
  String? nullableString = 'Hello'; // 可以为 null
  nullableString = null; // 合法操作

  int? nullableInt; // 未初始化默认为 null

  print('可空字符串: $nullableString');
  print('可空整数: $nullableInt');

  // 3. 空值判断 (Null check)
  String? maybeString = getStringOrNull();

  // 使用条件判断处理可能为空的值
  if (maybeString != null) {
    print('字符串长度: ${maybeString.length}'); // 安全地访问 length
  }

  // 4. 空感知操作符 (Null-aware operators)

  // ?. 空感知访问操作符
  int? length = maybeString?.length; // 如果 maybeString 为空，则 length 为 null
  print('可能为空的长度: $length');

  // ?? 空合并操作符
  String result = maybeString ?? 'Default value';
  print('结果: $result'); // 如果 maybeString 为空，则使用默认值

  // ??= 空赋值操作符
  String? anotherString;
  anotherString ??= 'Default if null'; // 只有当变量为 null 时才赋值
  print('另一个字符串: $anotherString');
}

// 返回一个可能为空的字符串
String? getStringOrNull() {
  // 模拟随机返回 null 或 字符串
  return DateTime.now().millisecond.isEven ? 'A string' : null;
}

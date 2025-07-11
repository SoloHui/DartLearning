// Dart 空类型声明符 ? 演示
// ? 操作符用于声明可空类型

void main() {
  // 1. 可空类型声明
  int? nullableInt; // 可以为 null，默认值为 null
  String? nullableString; // 可以为 null，默认值为 null
  bool? nullableBool; // 可以为 null，默认值为 null

  print('可空整数: $nullableInt');
  print('可空字符串: $nullableString');
  print('可空布尔: $nullableBool');

  // 2. 为可空类型赋值
  nullableInt = 42;
  nullableString = 'Hello';
  nullableBool = true;

  print('\n赋值后:');
  print('可空整数: $nullableInt');
  print('可空字符串: $nullableString');
  print('可空布尔: $nullableBool');

  // 3. 重新赋值为 null
  nullableInt = null;
  nullableString = null;
  nullableBool = null;

  print('\n重新赋值为 null:');
  print('可空整数: $nullableInt');
  print('可空字符串: $nullableString');
  print('可空布尔: $nullableBool');

  // 4. 可空类型用于函数参数和返回值
  print('\n函数参数和返回值:');
  String? result1 = processName('张三');
  String? result2 = processName(null);

  print('结果1: $result1');
  print('结果2: $result2');

  // 5. 可空类型用于泛型
  print('\n可空类型用于泛型:');
  List<int?> listWithNullableItems = [1, 2, null, 4, null];
  print('包含空值的列表: $listWithNullableItems');

  List<int>? nullableList; // 整个列表可以为 null
  print('可空列表: $nullableList');

  // 6. 类中的可空属性
  print('\n类中的可空属性:');
  final user = User(id: 1, name: '李四');
  print('用户: ${user.id}, ${user.name}, ${user.email}');

  final anonymousUser = User(id: 2);
  print(
    '匿名用户: ${anonymousUser.id}, ${anonymousUser.name}, ${anonymousUser.email}',
  );
}

// 可空参数和可空返回值
String? processName(String? name) {
  if (name == null) {
    return null;
  }
  return '处理后的名字: $name';
}

// 类中使用可空类型
class User {
  int id;
  String? name; // 可空属性
  String? email; // 可空属性

  User({required this.id, this.name, this.email});
}

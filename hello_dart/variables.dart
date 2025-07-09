void main() {
  // 基本数据类型
  int intValue = 42;
  double doubleValue = 3.14;
  num numValue = 100;
  String stringValue = "Hello Dart";
  bool boolValue = true;

  // 集合类型
  List<int> listValue = [1, 2, 3, 4, 5];
  Set<String> setValue = {'apple', 'banana', 'orange'};
  Map<String, int> mapValue = {'a': 1, 'b': 2, 'c': 3};

  // 特殊类型
  dynamic dynamicValue = "可以是任何类型";
  Object objectValue = "所有类型的基类";
  var varValue = "类型推断";

  // Null 安全类型
  String? nullableString = null;
  late String lateString;
  lateString = "延迟初始化";

  // 常量
  const String constValue = "编译时常量";
  final String finalValue = "运行时常量";

  // 符号类型
  Symbol symbolValue = #mySymbol;

  // 函数类型
  Function() functionValue = () => "我是一个函数";

  // 打印输出
  print('int: $intValue');
  print('double: $doubleValue');
  print('num: $numValue');
  print('String: $stringValue');
  print('bool: $boolValue');
  print('List: $listValue');
  print('Set: $setValue');
  print('Map: $mapValue');
  print('dynamic: $dynamicValue');
  print('Object: $objectValue');
  print('var: $varValue');
  print('nullable String: $nullableString');
  print('late String: $lateString');
  print('const: $constValue');
  print('final: $finalValue');
  print('Symbol: $symbolValue');
  print('Function: ${functionValue()}');
}

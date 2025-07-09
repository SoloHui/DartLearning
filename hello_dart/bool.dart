void main() {
  // 声明不同类型的变量
  var intVar = 42;
  var doubleVar = 3.14;
  var stringVar = "Hello";
  var boolVar = true;
  var listVar = [1, 2, 3];
  var mapVar = {'key': 'value'};

  // 类型判断
  print('intVar is int: ${intVar is int}');
  print('doubleVar is double: ${doubleVar is double}');
  print('stringVar is String: ${stringVar is String}');
  print('boolVar is bool: ${boolVar is bool}');
  print('listVar is List: ${listVar is List}');
  print('mapVar is Map: ${mapVar is Map}');

  // 值的比较 `==`, `>`, `<`, `>=`, `<=`
  print('intVar == 42: ${intVar == 42}');
  print('doubleVar > 3: ${doubleVar > 3}');
  print('stringVar.length == 5: ${stringVar.length == 5}');
  print('boolVar == true: ${boolVar == true}');

  // 运行时类型获取
  print('intVar runtime type: ${intVar.runtimeType}');
  print('stringVar runtime type: ${stringVar.runtimeType}');
}

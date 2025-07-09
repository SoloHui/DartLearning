void main() {
  // 常用属性演示
  print('=== List 常用属性 ===');
  List<int> numbers = [1, 2, 3, 4, 5];

  print('length: ${numbers.length}'); // 长度
  print('reversed: ${numbers.reversed.toList()}'); // 翻转
  print('isEmpty: ${numbers.isEmpty}'); // 是否为空
  print('isNotEmpty: ${numbers.isNotEmpty}'); // 是否不为空

  List<int> emptyList = [];
  print('empty list isEmpty: ${emptyList.isEmpty}');

  print('\n=== List 常用方法 ===');

  // add - 增加
  List<String> fruits = ['apple', 'banana'];
  fruits.add('orange');
  print('add: $fruits');

  // addAll - 拼接数组
  fruits.addAll(['grape', 'kiwi']);
  print('addAll: $fruits');

  // indexOf - 查找 传入具体值
  int index = fruits.indexOf('banana');
  print('indexOf banana: $index');

  // remove - 删除 传入具体值
  fruits.remove('apple');
  print('remove apple: $fruits');

  // removeAt - 删除 传入索引值
  fruits.removeAt(0);
  print('removeAt 0: $fruits');

  // fillRange - 修改
  List<int> nums = [1, 2, 3, 4, 5];
  nums.fillRange(1, 3, 0);
  print('fillRange: $nums');

  // insert - 指定位置插入
  List<String> colors = ['red', 'blue'];
  colors.insert(1, 'green');
  print('insert: $colors');

  // insertAll - 指定位置插入List
  colors.insertAll(2, ['yellow', 'purple']);
  print('insertAll: $colors');

  // toList - 其他类型转换成List
  var iterable = {1, 2, 3, 4, 5};
  List<int> converted = iterable.toList();
  print('toList: $converted');

  // join - List转换成字符串
  String joined = colors.join(', ');
  print('join: $joined');

  // split - 字符串转化成List
  String sentence = 'hello,world,dart';
  List<String> words = sentence.split(',');
  print('split: $words');

  print('\n=== 高阶方法 ===');

  List<int> testNumbers = [1, 2, 3, 4, 5, 6];

  // forEach - 遍历
  print('forEach:');
  testNumbers.forEach((element) => print('  $element'));

  // map - 映射转换
  List<int> doubled = testNumbers.map((e) => e * 2).toList();
  print('map (doubled): $doubled');

  // where - 过滤
  List<int> evenNumbers = testNumbers.where((e) => e % 2 == 0).toList();
  print('where (even): $evenNumbers');

  // any - 是否存在满足条件的元素
  bool hasEven = testNumbers.any((e) => e % 2 == 0);
  print('any (has even): $hasEven');

  // every - 是否所有元素都满足条件
  bool allPositive = testNumbers.every((e) => e > 0);
  print('every (all positive): $allPositive');
}

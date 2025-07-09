void main() {
  // 四种list定义方式

  // 1. 指定类型
  List<int> numbers = [1, 2, 3, 4, 5];
  List<String> names = ['Alice', 'Bob', 'Charlie'];

  // 2. 不指定类型
  var mixedList = [1, 'hello', 3.14, true];
  List dynamicList = [1, 'world', 2.71];

  // 3. 空集合add
  List<int> emptyList = [];
  emptyList.add(10);
  emptyList.add(20);
  emptyList.addAll([30, 40]);

  // 4. 固定长度filled
  List<int> fixedList = List.filled(5, 0);
  fixedList[0] = 100;
  fixedList[1] = 200;

  // 元素获取方式
  print('获取元素:');
  print('numbers[0]: ${numbers[0]}');
  print('numbers.first: ${numbers.first}');
  print('numbers.last: ${numbers.last}');
  print('names.elementAt(1): ${names.elementAt(1)}');

  // list操作函数
  print('\nlist操作函数:');
  print('numbers.length: ${numbers.length}');
  print('numbers.isEmpty: ${numbers.isEmpty}');
  print('numbers.contains(3): ${numbers.contains(3)}');
  print('numbers.indexOf(4): ${numbers.indexOf(4)}');
  print('numbers.sublist(1, 3): ${numbers.sublist(1, 3)}');

  // 遍历
  print('\n遍历:');
  numbers.forEach((item) => print('Item: $item'));

  // 转换
  List<String> stringNumbers = numbers.map((e) => e.toString()).toList();
  print('转换后: $stringNumbers');

  // 过滤
  List<int> evenNumbers = numbers.where((e) => e % 2 == 0).toList();
  print('偶数: $evenNumbers');

  // 排序
  List<int> unsorted = [3, 1, 4, 1, 5];
  unsorted.sort();
  print('排序后: $unsorted');

  // 反转
  List<int> reversed = numbers.reversed.toList();
  print('反转后: $reversed');

  // 清空
  numbers.clear();
  print('清空后 numbers: $numbers');
}

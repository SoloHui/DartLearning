void main() {
  /// 创建集合(不能有重复元素)
  ///
  /// Set 是无序的集合类型，元素不能重复且不能通过索引获取值。
  /// 功能: 去除重复元素，集合操作如并集、交集等。
  Set<int> numbers = {1, 2, 3, 4, 5};
  // Set<String> fruits = {'apple', 'banana', 'orange'};
  Set<int> emptySet = <int>{};

  // 属性
  print('\n空集合: $emptySet'); // {}
  print('空集合长度: ${emptySet.length}'); // 0
  print('空集合是否为空: ${emptySet.isEmpty}'); // true

  print('\n集合`numbers`: $numbers'); // {1, 2, 3, 4, 5}
  print('长度: ${numbers.length}'); // 5
  print('是否为空: ${numbers.isEmpty}'); // false
  print('是否不为空: ${numbers.isNotEmpty}'); // true
  print('第一个元素: ${numbers.first}'); // 1
  print('最后一个元素: ${numbers.last}'); // 5

  // 添加元素
  numbers.add(6);
  numbers.addAll([7, 8, 9]);
  print('添加后: $numbers');

  // 移除元素
  numbers.remove(9);
  numbers.removeWhere((x) => x > 7);
  print('移除后: $numbers');

  // 检查成员关系
  print('包含3: ${numbers.contains(3)}'); // true
  print('包含所有[1,2]: ${numbers.containsAll([1, 2])}'); // true

  // 集合操作
  Set<int> other = {4, 5, 6, 7};
  print('并集: ${numbers.union(other)}');
  print('交集: ${numbers.intersection(other)}');
  print('差集: ${numbers.difference(other)}');

  // 迭代
  numbers.forEach((element) => print('元素: $element'));

  // 转换 (list -> set 去除重复元素)
  // List<int> list = numbers.toList();
  // Set<int> copy = numbers.toSet();

  // 清空所有元素
  Set<int> temp = {1, 2, 3};
  temp.clear();
  print('清空后: ${temp.isEmpty}'); // true
}

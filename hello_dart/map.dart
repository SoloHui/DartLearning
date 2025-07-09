void main() {
  // 两种定义maps方式

  // 1. 初始化定义
  Map<String, int> map1 = {'apple': 10, 'banana': 20, 'orange': 15};

  // 2. new后赋值
  Map<String, int> map2 = Map<String, int>();
  map2['apple'] = 10;
  map2['banana'] = 20;
  map2['orange'] = 15;

  print('Map1: $map1');
  print('Map2: $map2');

  // 元素获取
  print('\n--- 元素获取 ---');
  print('Apple count: ${map1['apple']}');
  print('Keys: ${map1.keys}');
  print('Values: ${map1.values}');
  print('Length: ${map1.length}');

  // 操作函数
  print('\n--- 操作函数 ---');

  // 添加元素
  map1['grape'] = 25;
  print('After adding grape: $map1');

  // 更新元素
  map1['apple'] = 30;
  print('After updating apple: $map1');

  // 移除元素
  map1.remove('banana');
  print('After removing banana: $map1');

  // 检查是否包含
  print('Contains apple: ${map1.containsKey('apple')}');
  print('Contains value 25: ${map1.containsValue(25)}');

  // 遍历
  print('\n--- 遍历 ---');
  map1.forEach((key, value) {
    print('$key: $value');
  });

  // 清空
  Map<String, int> tempMap = Map.from(map1);
  tempMap.clear();
  print('After clear: $tempMap');
}

void main() {
  // Map 的创建方式

  // 1. 字面量创建
  Map<String, int> ages = {'张三': 25, '李四': 30, '王五': 28};

  // 2. 构造函数创建
  Map<String, String> cities = Map<String, String>();
  cities['北京'] = '中国';
  cities['东京'] = '日本';

  // 3. Map.from() 创建
  // Map<String, int> copyAges = Map.from(ages);

  print('=== Map 常用属性 ===');

  // length: 获取 Map 中键值对的数量
  print('ages 的长度: ${ages.length}');

  // isEmpty: 判断 Map 是否为空
  print('ages 是否为空: ${ages.isEmpty}');

  // isNotEmpty: 判断 Map 是否不为空
  print('ages 是否不为空: ${ages.isNotEmpty}');

  // keys: 获取所有的键
  print('所有的键: ${ages.keys}');

  // values: 获取所有的值
  print('所有的值: ${ages.values}');

  // entries: 获取所有的键值对
  print('所有的键值对: ${ages.entries}');

  print('\n=== Map 常用方法 ===');

  // [] 操作符: 根据键获取值
  print('张三的年龄: ${ages['张三']}');

  // []= 操作符: 设置键值对
  ages['赵六'] = 35;
  print('添加赵六后: $ages');

  // putIfAbsent: 如果键不存在则添加
  ages.putIfAbsent('孙七', () => 40);
  print('putIfAbsent 后: $ages');

  // containsKey: 判断是否包含指定的键
  print('是否包含张三: ${ages.containsKey('张三')}');

  // containsValue: 判断是否包含指定的值
  print('是否包含年龄25: ${ages.containsValue(25)}');

  // remove: 根据键移除键值对
  int? removedAge = ages.remove('李四');
  print('移除李四，返回值: $removedAge，剩余: $ages');

  // clear: 清空所有键值对
  Map<String, int> tempMap = Map.from(ages);
  tempMap.clear();
  print('清空后的 tempMap: $tempMap');

  print('\n=== Map 遍历方法 ===');

  // forEach: 遍历每个键值对
  print('使用 forEach 遍历:');
  ages.forEach((key, value) {
    print('  $key: $value 岁');
  });

  // for-in 遍历键
  print('遍历所有键:');
  for (String name in ages.keys) {
    print('  键: $name');
  }

  // for-in 遍历值
  print('遍历所有值:');
  for (int age in ages.values) {
    print('  值: $age');
  }

  // for-in 遍历键值对
  print('遍历所有键值对:');
  for (MapEntry<String, int> entry in ages.entries) {
    print('  ${entry.key}: ${entry.value}');
  }

  print('\n=== Map 转换方法 ===');

  // map: 转换 Map 的键值对
  Map<String, String> ageStrings = ages.map((key, value) {
    return MapEntry(key, '$value岁');
  });
  print('转换为字符串: $ageStrings');

  // where: 过滤键值对（返回 Iterable<MapEntry>）
  var adults = ages.entries.where((entry) => entry.value >= 30);
  Map<String, int> adultMap = Map.fromEntries(adults);
  print('年龄>=30的人: $adultMap');

  // any: 检查是否有任何一个键值对满足条件
  bool hasYoungPeople = ages.entries.any((entry) => entry.value < 30);
  print('是否有人年龄<30: $hasYoungPeople');

  bool hasOldPeople = ages.entries.any((entry) => entry.value > 50);
  print('是否有人年龄>50: $hasOldPeople');

  // every: 检查是否所有键值对都满足条件
  bool allAdults = ages.entries.every((entry) => entry.value >= 18);
  print('是否所有人都>=18岁: $allAdults');

  bool allYoung = ages.entries.every((entry) => entry.value < 40);
  print('是否所有人都<40岁: $allYoung');

  // 实际应用示例
  Map<String, int> scores = {'数学': 85, '语文': 92, '英语': 78};

  // 检查是否有及格的科目
  bool hasPassingGrade = scores.entries.any((entry) => entry.value >= 60);
  print('是否有及格科目: $hasPassingGrade');

  // 检查是否所有科目都及格
  bool allPassing = scores.entries.every((entry) => entry.value >= 60);
  print('是否所有科目都及格: $allPassing');

  print('\n=== Map 其他实用方法 ===');

  // addAll: 添加另一个 Map 的所有键值对
  Map<String, int> newPeople = {'小明': 22, '小红': 24};
  ages.addAll(newPeople);
  print('addAll 后: $ages');

  // addEntries: 添加键值对条目
  ages.addEntries([MapEntry('小刚', 26)]);
  print('addEntries 后: $ages');

  // removeWhere: 根据条件移除键值对
  ages.removeWhere((key, value) => value < 25);
  print('移除年龄<25的人后: $ages');

  // update: 更新指定键的值
  ages.update('张三', (value) => value + 1, ifAbsent: () => 0);
  print('张三年龄+1后: $ages');

  // updateAll: 更新所有值
  ages.updateAll((key, value) => value + 1);
  print('所有人年龄+1后: $ages');

  print('\n=== 不同类型的 Map ===');

  // LinkedHashMap: 保持插入顺序（默认）
  Map<String, int> linkedMap = <String, int>{'c': 3, 'a': 1, 'b': 2};
  print('LinkedHashMap (保持插入顺序): $linkedMap');

  // HashMap: 不保证顺序，查找更快
  // 注意：在 Dart 中，默认的 Map 实现已经是 LinkedHashMap

  // SplayTreeMap: 按键排序
  // 需要 import 'dart:collection';

  print('\n=== Map 的实际应用示例 ===');

  // 统计字符出现次数
  String text = 'hello world';
  Map<String, int> charCount = {};
  for (int i = 0; i < text.length; i++) {
    String char = text[i];
    if (char != ' ') {
      charCount[char] = (charCount[char] ?? 0) + 1;
    }
  }
  print('字符统计: $charCount');

  // 分组数据
  List<Map<String, dynamic>> students = [
    {'name': '张三', 'grade': 'A', 'score': 95},
    {'name': '李四', 'grade': 'B', 'score': 85},
    {'name': '王五', 'grade': 'A', 'score': 92},
  ];

  Map<String, List<Map<String, dynamic>>> groupedByGrade = {};
  for (var student in students) {
    String grade = student['grade'];
    groupedByGrade.putIfAbsent(grade, () => []);
    groupedByGrade[grade]!.add(student);
  }
  print('按年级分组: $groupedByGrade');
}

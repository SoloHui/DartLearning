# Dart 集合与高阶函数

这个目录包含了Dart中常见集合类型（List、Map、Set）以及它们相关的高阶函数（forEach、map、where、any、every）的示例代码。通过这些示例，您可以了解如何在Dart中有效地使用集合以及如何利用函数式编程特性来处理数据。

## 文件说明

### 1. `list.dart`

这个文件介绍了Dart中List（列表/数组）的操作和相关高阶函数：

- **List的基本属性**：length、reversed、isEmpty、isNotEmpty
- **基础操作方法**：add、addAll、indexOf、remove、removeAt、insert等
- **高阶函数**：forEach、map、where、any、every

关键知识点：

- List是有序的、可重复的集合
- 可以通过索引直接访问元素
- 支持添加、删除、查找和修改操作
- 可与其他可迭代对象（如Set）相互转换
- 高阶函数允许简洁地实现复杂的数据处理逻辑

### 2. `map.dart`

这个文件展示了Dart中Map（字典/键值对）的用法和相关操作：

- **Map的创建方式**：字面量、构造函数、Map.from()
- **基本属性**：keys、values、entries、length等
- **常用方法**：访问与修改、查找与检查、添加与删除等
- **遍历方式**：forEach、for-in循环等
- **转换方法**：map、where（entries）、any、every
- **实际应用示例**：字符统计、数据分组

关键知识点：

- Map是键值对的无序集合，键必须唯一
- 多种遍历方式可以访问键、值或键值对
- 可以使用条件过滤、转换和检查Map中的元素
- 支持复杂的嵌套结构，适合表示层次化数据
- 处理Map的高阶函数通常与entries配合使用

### 3. `set.dart`

这个文件介绍了Dart中Set（集合）的特性和操作：

- **Set的基本概念**：无序、唯一元素的集合
- **基本属性和方法**：length、isEmpty、add、remove等
- **集合运算**：union（并集）、intersection（交集）、difference（差集）
- **成员检查**：contains、containsAll
- **其他操作**：forEach、转换等

关键知识点：

- Set中的元素不能重复，常用于去重操作
- 不支持索引访问，元素无序
- 提供高效的元素存在性检查
- 支持数学集合运算（并集、交集、差集）
- 可与List互相转换

## 高阶函数详解

Dart的集合类型支持多种高阶函数，这些函数接受其他函数作为参数，大大简化了集合处理代码。

### forEach

`forEach` 方法用于遍历集合中的每个元素，并对每个元素执行指定的操作。

```dart
List<int> numbers = [1, 2, 3, 4, 5];
numbers.forEach((n) => print(n)); // 打印每个元素

Map<String, int> ages = {'张三': 30, '李四': 25};
ages.forEach((name, age) => print('$name: $age岁')); // 打印每个键值对
```

### map

`map` 方法将集合中的每个元素转换为另一种形式，生成一个新的集合。

```dart
List<int> numbers = [1, 2, 3, 4, 5];
List<int> squared = numbers.map((n) => n * n).toList(); // [1, 4, 9, 16, 25]

Map<String, int> prices = {'苹果': 5, '香蕉': 3};
Map<String, String> priceLabels = prices.map(
  (item, price) => MapEntry(item, '¥$price')
); // {'苹果': '¥5', '香蕉': '¥3'}
```

### where

`where` 方法用于筛选集合中符合特定条件的元素，返回一个新的集合。

```dart
List<int> numbers = [1, 2, 3, 4, 5];
List<int> evens = numbers.where((n) => n % 2 == 0).toList(); // [2, 4]

// 对于Map，需要使用entries先转换为可迭代的键值对
Map<String, int> ages = {'张三': 30, '李四': 25, '王五': 18};
var adults = ages.entries.where((entry) => entry.value >= 18);
Map<String, int> adultMap = Map.fromEntries(adults); // {'张三': 30, '李四': 25, '王五': 18}
```

### any

`any` 方法检查集合中是否至少有一个元素满足指定条件，返回布尔值。

```dart
List<int> numbers = [1, 2, 3, 4, 5];
bool hasEven = numbers.any((n) => n % 2 == 0); // true

Map<String, int> scores = {'数学': 95, '英语': 85, '物理': 55};
bool hasFailingScore = scores.values.any((score) => score < 60); // true
```

### every

`every` 方法检查集合中是否所有元素都满足指定条件，返回布尔值。

```dart
List<int> numbers = [2, 4, 6, 8];
bool allEven = numbers.every((n) => n % 2 == 0); // true

Map<String, int> ages = {'张三': 25, '李四': 30, '王五': 17};
bool allAdults = ages.values.every((age) => age >= 18); // false
```

## 集合类型比较

| 特性 | List | Map | Set |
|------|------|-----|-----|
| 有序性 | 有序 | 无序（但LinkedHashMap保留插入顺序） | 无序 |
| 元素唯一性 | 可重复 | 键必须唯一 | 唯一 |
| 访问方式 | 索引 | 键 | 迭代/contains |
| 主要用途 | 顺序集合 | 键值映射 | 唯一性集合、集合运算 |
| 常用场景 | 保持顺序、简单集合 | 字典、配置、复杂对象 | 去重、成员检查、集合运算 |

## 函数式编程链式调用

Dart支持函数式编程风格的链式调用，可以将多个高阶函数组合使用，实现复杂的数据处理逻辑：

```dart
// 从列表中筛选出大于10的偶数，然后将它们乘以2
List<int> numbers = [5, 12, 8, 15, 20, 25];
List<int> result = numbers
    .where((n) => n > 10)     // 筛选大于10的数: [12, 15, 20, 25]
    .where((n) => n % 2 == 0) // 筛选偶数: [12, 20]
    .map((n) => n * 2)        // 每个数乘以2: [24, 40]
    .toList();                // 转换为List
```

## 性能考虑

- **懒计算**：Dart的许多高阶函数（如`map`和`where`）返回的是`Iterable`对象，它们采用懒计算模式，仅在访问元素时才执行转换。如果需要立即计算结果，可以调用`.toList()`或`.toSet()`。

- **内存使用**：链式调用创建中间集合可能增加内存使用。对于大型数据集，考虑使用循环或`fold`方法进行累积计算。

- **时间复杂度**：
  - `List`: 按索引访问O(1)，查找元素O(n)
  - `Map`: 查找键O(1)（平均情况）
  - `Set`: 成员检查O(1)（平均情况）

## 实际应用示例

1. **数据过滤和转换**：使用`where`和`map`处理数据集
2. **数据统计和汇总**：使用`forEach`或`fold`累积计算
3. **数据分组**：使用Map存储分组结果
4. **数据验证**：使用`every`或`any`检查数据是否符合条件
5. **数据去重**：使用Set移除重复元素

## 学习资源

- [Dart官方文档 - List](https://api.dart.dev/stable/dart-core/List-class.html)
- [Dart官方文档 - Map](https://api.dart.dev/stable/dart-core/Map-class.html)
- [Dart官方文档 - Set](https://api.dart.dev/stable/dart-core/Set-class.html)
- [Dart官方文档 - Iterable](https://api.dart.dev/stable/dart-core/Iterable-class.html)（所有集合的基础接口）
- [Dart语言之旅 - 集合](https://dart.dev/guides/language/language-tour#collections)

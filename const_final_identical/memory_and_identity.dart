// memory_and_identity.dart
// 本文件详细讲解 identical 函数和 Dart 内存管理的关系

void main() {
  print('===== identical 与 Dart 内存管理 =====\n');
  
  print('==== 1. 基本类型的内存管理 ====');
  
  // Dart 中的整数处理
  int a = 100;
  int b = 100;
  int c = 100;
  
  print('数值 a, b, c 都等于 100');
  print('identical(a, b): ${identical(a, b)}'); // 通常是 true
  print('identical(b, c): ${identical(b, c)}'); // 通常是 true
  
  // 小整数通常在 Dart VM 中被缓存(-40 到 2047 之间)
  int smallInt1 = 42;
  int smallInt2 = 42;
  print('\n小整数池: identical(smallInt1, smallInt2): ${identical(smallInt1, smallInt2)}'); // true
  
  // 大整数可能不会被缓存
  int largeInt1 = 999999999;
  int largeInt2 = 999999999;
  print('大整数: identical(largeInt1, largeInt2): ${identical(largeInt1, largeInt2)}');
  
  print('\n==== 2. 字符串的内部处理 ====');
  
  // 字符串字面量会被内部化(interning)处理
  String s1 = 'hello';
  String s2 = 'hello';
  print('字符串字面量: identical(s1, s2): ${identical(s1, s2)}'); // true
  
  // 动态构建的字符串可能不会被内部化
  String s3 = 'hel' + 'lo';
  print('拼接字符串: identical(s1, s3): ${identical(s1, s3)}'); // 可能 true 也可能 false
  
  // 通过构造函数创建的字符串通常不会被内部化
  String s4 = String.fromCharCodes([104, 101, 108, 108, 111]); // "hello"
  print('通过构造函数创建: identical(s1, s4): ${identical(s1, s4)}'); // 通常是 false
  
  print('\n==== 3. const 对象与内存 ====');
  
  // const 对象在编译时创建并缓存
  const point1 = Point(1, 2);
  const point2 = Point(1, 2);
  
  // 相同值的常量构造的对象引用相同实例
  print('常量对象: identical(point1, point2): ${identical(point1, point2)}'); // true
  
  // 非常量对象总是创建新实例
  final point3 = Point(1, 2);
  final point4 = Point(1, 2);
  print('非常量对象: identical(point3, point4): ${identical(point3, point4)}'); // false
  
  print('\n==== 4. identical 与 == 操作符 ====');
  
  // identical 用于比较对象身份（引用相等）
  // == 操作符默认比较对象身份，但可以被重载为值比较
  
  // 默认情况下，== 等同于 identical
  final box1 = Box('物品');
  final box2 = Box('物品');
  print('默认 == 操作符:');
  print('box1 == box2: ${box1 == box2}'); // false
  print('identical(box1, box2): ${identical(box1, box2)}'); // false
  
  // 重载 == 后，会比较值而非引用
  final valBox1 = ValueBox('物品');
  final valBox2 = ValueBox('物品');
  print('\n重载 == 操作符:');
  print('valBox1 == valBox2: ${valBox1 == valBox2}'); // true，值相等
  print('identical(valBox1, valBox2): ${identical(valBox1, valBox2)}'); // false，引用不同
  
  print('\n==== 5. 垃圾回收与对象标识 ====');
  
  // Dart 的垃圾回收器会回收不再被引用的对象
  // 对象的标识(identity)在其生命周期内是唯一的
  // 通过 identical 可以判断两个引用是否指向同一个对象
  
  print('演示对象生命周期:');
  
  // 创建一个对象并保存其哈希值
  Object? original = Object();
  var hashCodeOriginal = original.hashCode;
  print('原始对象的哈希值: $hashCodeOriginal');
  
  // 将原始引用置为 null，使对象可能被垃圾回收
  original = null;
  
  // 强制垃圾回收 (注意：这只是为了演示，实际代码中不应该手动触发 GC)
  // 实际上 Dart 不保证 GC 会立即执行，下面代码只是模拟释放内存的效果
  print('释放原始对象...');
  
  // 创建一个新对象，它可能会重用被回收对象的内存
  var newObject = Object();
  print('新对象的哈希值: ${newObject.hashCode}');
  print('注意：哈希值不同证明这是完全不同的对象实例，即使内存位置可能被复用');
  
  print('\n==== 6. 实际应用总结 ====');
  
  print('''
  1. 使用 const 常量构造函数：
     - 创建不可变对象
     - 提高内存效率（相同值的对象只存储一次）
     - 提高性能（避免重复创建对象）
  
  2. 使用 identical 函数：
     - 检查两个引用是否指向同一个对象实例
     - 在某些性能关键的场景比 == 更有效（因为 == 可能有额外的逻辑）
  
  3. 重写 == 操作符：
     - 实现值相等性检查
     - 确保语义上相等的对象被视为相等
     - 记得同时重写 hashCode
  
  4. 内存优化：
     - 常量对象减少内存使用
     - 对象内部化减少重复对象
     - 注意内存泄漏（不要保留不需要的对象引用）
  ''');
}

// 具有常量构造函数的点类
class Point {
  final int x;
  final int y;
  
  const Point(this.x, this.y);
  
  @override
  String toString() => 'Point($x, $y)';
}

// 未重载 == 的普通类
class Box {
  final String content;
  
  Box(this.content);
  
  @override
  String toString() => 'Box($content)';
}

// 重载了 == 的值相等类
class ValueBox {
  final String content;
  
  ValueBox(this.content);
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ValueBox && other.content == content;
  }
  
  @override
  int get hashCode => content.hashCode;
  
  @override
  String toString() => 'ValueBox($content)';
}

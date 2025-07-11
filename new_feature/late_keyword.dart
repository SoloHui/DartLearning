// Dart late 关键字演示
// late 关键字是 Dart 2.12 版本引入的新特性，用于延迟初始化变量

void main() {
  // 1. 延迟初始化变量
  late String lateInitialized;

  print('变量已声明但尚未初始化');

  // 初始化 late 变量
  lateInitialized = 'Now initialized';

  // 使用 late 变量
  print('late 变量的值: $lateInitialized');

  // 2. late 与惰性初始化
  print('\n演示 late 的惰性初始化:');
  late String expensiveValue = getExpensiveValue(); // 直到使用时才会调用函数
  print('expensiveValue 已声明，但 getExpensiveValue 尚未执行');

  print('现在访问 expensiveValue: $expensiveValue'); // 此时 getExpensiveValue 才会执行

  // 3. late final 组合使用
  late final int onlyOnce;
  onlyOnce = 42; // 可以初始化一次

  print('\nlate final 变量: $onlyOnce');

  // 以下代码会报错，因为 final 变量只能赋值一次
  // onlyOnce = 43;

  // 4. late 在类中的应用
  print('\n在类中使用 late:');
  final person = Person();
  // 访问 name 时才会执行初始化代码
  print('Person 名字: ${person.name}');
}

String getExpensiveValue() {
  print('执行耗时操作...');
  // 模拟耗时操作
  return '耗时操作的结果';
}

class Person {
  // late 允许我们声明非空字段，但延迟其初始化
  late String name = initializeName();

  String initializeName() {
    print('初始化 Person 名字...');
    return '张三';
  }
}

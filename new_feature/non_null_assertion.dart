// Dart 非空断言操作符 ! 演示
// ! 操作符用于告诉编译器某个可能为空的表达式在运行时一定不为空

void main() {
  // 1. 基本用法
  String? nullableString = getValue();

  // 使用非空断言告诉编译器 nullableString 在此处不为空
  // 警告：如果实际上是 null，将抛出运行时异常
  print('使用非空断言访问 length: ${nullableString!.length}');

  // 2. 在条件检查后使用（安全的用法）
  String? anotherString = getValue();

  if (anotherString != null) {
    // 此处已经检查了 null，编译器已经知道 anotherString 不为 null
    // 所以不需要使用非空断言
    int length = anotherString.length;
    print('已经检查过 null: $length');
  }

  // 3. 变量赋值时使用
  String? possibleNull = "Hello";
  // 如果 possibleNull 的值可能来自外部输入或其他不确定源，可以使用非空断言
  // 在这个例子中我们演示语法，但由于 possibleNull 明确不为 null，所以编译器会提示无需使用 !
  String definitelyNotNull = possibleNull; // 编译器已能推断这里不会是 null
  print('转换为非空类型: $definitelyNotNull');

  // 4. 链式调用中使用
  Person? person = getPerson();
  // 非空断言告诉编译器 person 不为 null
  String? upperName = person!.name?.toUpperCase();
  print('链式调用中使用非空断言: $upperName');

  // 5. 函数返回值使用
  int? result = calculate(10, 5);
  // 断言返回值不为空
  int nonNullResult = result!;
  print('函数返回值使用非空断言: $nonNullResult');

  // 6. 危险用法演示（注释掉以避免实际运行时崩溃）
  // String? willBeNull = null;
  // 以下代码将导致运行时异常: Null check operator used on a null value
  // print(willBeNull!.length);

  print('\n警告：非空断言 (!) 应谨慎使用，它告诉编译器"相信我，这不会是 null"');
  print('如果实际上是 null，程序将在运行时崩溃');
}

String? getValue() {
  // 返回一个非 null 值用于演示
  return "Hello World";
}

class Person {
  String? name;

  Person(this.name);
}

Person? getPerson() {
  // 返回一个 Person 对象用于演示
  return Person('张三');
}

int? calculate(int a, int b) {
  // 简单计算，返回非空值
  return a + b;
}

// 函数的定义、变量、作用域、返回值示例

// 全局变量
String globalVar = "I'm a global variable";

// 1. 基本函数定义
void greet() {
  print("Hello, World!");
}

// 2. 带参数的函数
void greetWithName(String name) {
  print("Hello, $name!");
}

// 3. 带返回值的函数
int add(int a, int b) {
  return a + b;
}

/// 4. 可选参数函数
///
/// 可选参数可以是位置参数或命名参数。
/// 可选位置参数使用方括号 [] 包裹，
/// 可选命名参数使用花括号 {} 包裹。
/// 可选位置参数可以有默认值。
/// ? 符号表示参数可以为 null。
void greetOptional(String name, [String? title]) {
  if (title != null) {
    print("Hello, $title $name!");
  } else {
    print("Hello, $name!");
  }
}

/// 5. 命名参数函数
///
/// required 关键字用于指定命名参数是必需的。
/// 如果没有提供必需的参数，编译器会报错。
/// 可选的命名参数可以有默认值。
void createUser({required String name, int age = 18}) {
  print("User: $name, Age: $age");
}

// 6. 箭头函数（表达式函数）
int multiply(int a, int b) => a * b;

// 7. 作用域示例
void scopeExample() {
  String localVar = "I'm a local variable";

  // 嵌套作用域
  if (true) {
    String blockVar = "I'm in a block";
    print(localVar); // 可以访问外层作用域
    print(blockVar); // 可以访问当前作用域
    print(globalVar); // 可以访问全局作用域
  }

  // print(blockVar); // 错误：无法访问块级作用域变量
}

// 8. 返回不同类型的函数
List<int> getNumbers() {
  return [1, 2, 3, 4, 5];
}

Map<String, dynamic> getUserInfo() {
  return {'name': 'John', 'age': 25, 'email': 'john@example.com'};
}

// 9. 高阶函数（函数作为参数）
void executeFunction(void Function() fn) {
  fn();
}

// 10. 匿名函数和闭包
Function createCounter() {
  int count = 0;
  return () {
    count++;
    return count;
  };
}

void main() {
  // 调用各种函数
  greet();
  greetWithName("Alice");

  int result = add(5, 3);
  print("5 + 3 = $result");

  greetOptional("Bob");
  greetOptional("Bob", "Mr.");

  createUser(name: "Charlie");
  createUser(name: "David", age: 30);

  print("4 * 6 = ${multiply(4, 6)}");

  scopeExample();

  List<int> numbers = getNumbers();
  print("Numbers: $numbers");

  Map<String, dynamic> user = getUserInfo();
  print("User info: $user");

  /// 使用匿名函数
  ///
  /// 在 Dart 中，匿名函数（或称为 Lambda 函数）是一种没有名称的函数。
  /// 它可以作为参数传递给其他函数或直接执行。
  executeFunction(() => print("Anonymous function executed"));

  /// 闭包示例
  ///
  /// 闭包是一个函数，它可以捕获其所在作用域中的变量。
  /// 在这个例子中，`createCounter` 函数返回一个匿名函数
  /// 这个匿名函数可以访问 `count` 变量，即使在 `createCounter` 函数执行完毕后。
  /// 每次调用返回的函数时，`count` 变量都会增加。
  /// 这使得我们可以创建一个计数器
  /// 每次调用计数器函数时，它都会返回当前的计数值。
  /// 这是一个闭包的典型用法。
  /// 创建一个计数器函数
  var counter = createCounter();
  print("Counter: ${counter()}"); // 1
  print("Counter: ${counter()}"); // 2
  print("Counter: ${counter()}"); // 3
}

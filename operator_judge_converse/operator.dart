void main() {
  // 算术运算符 (Arithmetic Operators)
  int a = 10;
  int b = 3;

  print('算术运算符:');
  print('a + b = ${a + b}'); // 加法
  print('a - b = ${a - b}'); // 减法
  print('a * b = ${a * b}'); // 乘法
  print('a / b = ${a / b}'); // 除法
  print('a ~/ b = ${a ~/ b}'); // 整除
  print('a % b = ${a % b}'); // 取余
  print('');

  // 关系运算符 (Relational Operators)
  print('关系运算符:');
  print('a > b = ${a > b}'); // 大于
  print('a < b = ${a < b}'); // 小于
  print('a >= b = ${a >= b}'); // 大于等于
  print('a <= b = ${a <= b}'); // 小于等于
  print('a == b = ${a == b}'); // 等于
  print('a != b = ${a != b}'); // 不等于
  print('');

  // 逻辑运算符 (Logical Operators)
  bool x = true;
  bool y = false;

  print('逻辑运算符:');
  print('x && y = ${x && y}'); // 逻辑与
  print('x || y = ${x || y}'); // 逻辑或
  print('!x = ${!x}'); // 逻辑非
  print('');

  // 赋值运算符 (Assignment Operators)
  int c = 5;
  print('赋值运算符:');
  print('c = $c');

  c += 2; // c = c + 2
  print('c += 2: $c');

  c -= 1; // c = c - 1
  print('c -= 1: $c');

  c *= 3; // c = c * 3
  print('c *= 3: $c');

  c ~/= 2; // c = c ~/ 2
  print('c ~/= 2: $c');

  c %= 3; // c = c % 3
  print('c %= 3: $c');
}

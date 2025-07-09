void main() {
  print('=== Increment (++) Operator ===');

  // Prefix increment (++variable)
  int a = 5;
  print('Original a: $a');
  print('++a: ${++a}'); // Increments first, then returns value
  print('a after ++a: $a');

  print('\n--- Postfix increment (variable++) ---');
  int b = 5;
  print('Original b: $b');
  print('b++: ${b++}'); // Returns value first, then increments
  print('b after b++: $b');

  print('\n=== Decrement (--) Operator ===');

  // Prefix decrement (--variable)
  int c = 5;
  print('Original c: $c');
  print('--c: ${--c}'); // Decrements first, then returns value
  print('c after --c: $c');

  print('\n--- Postfix decrement (variable--) ---');
  int d = 5;
  print('Original d: $d');
  print('d--: ${d--}'); // Returns value first, then decrements
  print('d after d--: $d');

  print('\n=== Comparison in expressions ===');
  int x = 10;
  int y = 10;

  print('x = $x, y = $y');
  print('++x + y--: ${++x + y--}'); // 11 + 10 = 21
  print('x = $x, y = $y'); // x = 11, y = 9
}

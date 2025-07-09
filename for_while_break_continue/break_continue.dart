void main() {
  print('=== BREAK Examples ===');

  // Break in for loop
  print('\n1. Break in for loop:');
  for (int i = 1; i <= 10; i++) {
    if (i == 5) {
      print('Breaking at i = $i');
      break;
    }
    print('i = $i');
  }

  // Break in while loop
  print('\n2. Break in while loop:');
  int count = 0;
  while (true) {
    count++;
    if (count > 3) {
      print('Breaking at count = $count');
      break;
    }
    print('count = $count');
  }

  // Break in nested loops
  print('\n3. Break in nested loops:');
  outer: // 这是一个标签，名字可以自定义
  for (int i = 1; i <= 3; i++) {
    for (int j = 1; j <= 3; j++) {
      if (i == 2 && j == 2) {
        print('Breaking outer loop at i=$i, j=$j');
        break outer; // 跳出标签为outer的循环
      }
      print('i=$i, j=$j');
    }
  }

  print('\n=== CONTINUE Examples ===');

  // Continue in for loop
  print('\n4. Continue in for loop (skip even numbers):');
  for (int i = 1; i <= 8; i++) {
    if (i % 2 == 0) {
      continue;
    }
    print('Odd number: $i');
  }

  // Continue in while loop
  print('\n5. Continue in while loop (skip multiples of 3):');
  int num = 0;
  while (num < 10) {
    num++;
    if (num % 3 == 0) {
      continue;
    }
    print('Not divisible by 3: $num');
  }

  // Continue in nested loops
  print('\n6. Continue in nested loops:');
  for (int i = 1; i <= 3; i++) {
    for (int j = 1; j <= 3; j++) {
      if (j == 2) {
        continue;
      }
      print('i=$i, j=$j');
    }
  }
}

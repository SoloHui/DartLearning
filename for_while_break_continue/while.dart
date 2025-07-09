void main() {
  // While loop example
  int i = 0;
  while (i < 5) {
    print('While loop iteration: $i');
    i++;
  }

  print('---');

  // Do-while loop example
  int j = 0;
  do {
    print('Do-while loop iteration: $j');
    j++;
  } while (j < 5);

  print('---');

  // Do-while executes at least once, even if condition is false
  int k = 10;
  do {
    print('This will execute once even though k >= 10: $k');
  } while (k < 10);
}

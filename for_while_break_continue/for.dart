void main() {
  // Basic for loop
  for (int i = 0; i < 5; i++) {
    print('Iteration: $i');
  }

  // For loop with a list
  List<String> fruits = ['apple', 'banana', 'orange'];
  for (int i = 0; i < fruits.length; i++) {
    print('Fruit $i: ${fruits[i]}');
  }

  // Enhanced for loop (for-in)
  for (String fruit in fruits) {
    print('I like $fruit');
  }

  // For loop with step
  for (int i = 0; i <= 10; i += 2) {
    print('Even number: $i');
  }
}

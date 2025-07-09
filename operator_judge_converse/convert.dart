void main() {
  // String to other types
  String numStr = "123";
  String doubleStr = "45.67";
  String boolStr = "true";

  int intFromString = int.parse(numStr);
  double doubleFromString = double.parse(doubleStr);
  bool boolFromString = boolStr.toLowerCase() == 'true';

  print("String to int: $intFromString");
  print("String to double: $doubleFromString");
  print("String to bool: $boolFromString");

  // Number to String
  int num = 42;
  double decimal = 3.14;
  bool flag = true;

  String numToString = num.toString();
  String decimalToString = decimal.toString();
  String boolToString = flag.toString();

  print("Int to string: $numToString");
  print("Double to string: $decimalToString");
  print("Bool to string: $boolToString");

  // int to double and vice versa
  int intVal = 10;
  double doubleVal = 20.5;

  double intToDouble = intVal.toDouble();
  int doubleToInt = doubleVal.toInt(); // truncates decimal

  print("Int to double: $intToDouble");
  print("Double to int: $doubleToInt");

  // Safe parsing with try-catch
  String invalidNum = "abc";
  try {
    int result = int.parse(invalidNum);
    print("Parsed: $result");
  } catch (e) {
    print("Parse error: $e");
  }

  // Using tryParse for safe conversion
  int? safeInt = int.tryParse(invalidNum);
  double? safeDouble = double.tryParse("invalid");

  print("Safe int parse: $safeInt"); // null
  print("Safe double parse: $safeDouble"); // null
}

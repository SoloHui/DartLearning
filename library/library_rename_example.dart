/// Dart库重命名和冲突解决示例
///
/// 本文件展示如何使用库重命名(as关键字)和冲突解决技术

// 1. 基础库导入
import 'dart:math'; // 导入标准数学库
import 'dart:convert' as convert; // 使用as给库取别名

// 2. 导入自定义库，使用相对路径
import 'custom.dart'; // 导入自定义库
// 假设存在另一个Calculator类的库
import 'mock_calculator_lib.dart' as mock; // 使用as避免冲突

// 3. 使用show仅导入需要的部分
import 'dart:collection' show HashMap, LinkedHashMap; // 只导入指定类

// 4. 使用hide排除不需要的部分
import 'dart:async' hide Stream; // 导入除Stream外的所有内容

void main() {
  print('===== Dart库重命名和冲突解决示例 =====\n');

  // 1. 使用库重命名后的调用方式
  print('【1】使用库重命名:');

  // 直接导入的库可以直接使用其内容
  final randomNumber = Random().nextInt(100);
  print('  dart:math直接导入 - 随机数: $randomNumber');

  // 使用as重命名后的库需要通过别名访问
  final jsonStr = '{"name": "张三", "age": 30}';
  final jsonData = convert.jsonDecode(jsonStr);
  print('  dart:convert使用别名 - 解析JSON: $jsonData');

  // 使用别名可以解决相同名称的冲突
  print('\n【2】解决名称冲突:');

  // 使用默认导入的Calculator
  final calculator1 = Calculator();
  print('  原始Calculator加法结果: ${calculator1.add(5, 3)}');

  // 使用重命名后库中的Calculator
  final calculator2 = mock.Calculator();
  print('  mock库Calculator加法结果: ${calculator2.add(5, 3)}');

  // 3. 使用show限制导入
  print('\n【3】使用show限制导入:');

  // 我们只导入了HashMap和LinkedHashMap，可以使用它们
  final hashMap = HashMap<String, int>();
  hashMap['one'] = 1;
  hashMap['two'] = 2;
  print('  HashMap示例: $hashMap');

  final linkedHashMap = LinkedHashMap<String, int>();
  linkedHashMap['first'] = 1;
  linkedHashMap['second'] = 2;
  print('  LinkedHashMap示例: $linkedHashMap');

  // 下面的代码将导致错误，因为我们没有导入Queue
  // Queue queue = Queue<int>();  // 这会报错

  // 4. 使用hide排除部分
  print('\n【4】使用hide排除部分导入:');

  // 我们可以使用Future，因为它没有被hide
  Future<String> futureValue = Future.value('异步值');
  futureValue.then((value) => print('  Future示例: $value'));

  // 下面的代码将导致错误，因为我们hide了Stream
  // Stream<int> stream;  // 这会报错

  // 5. 其他冲突解决方法
  print('\n【5】解决函数名冲突:');
  demonstrateNameConflict();
}

// 模拟名称冲突的解决方法
void demonstrateNameConflict() {
  // 假设有两个库中都有print函数，我们可以通过完全限定来访问
  // 在真实场景中，多个库可能有同名函数
  print('  通过库前缀调用同名函数:');

  // 通过库前缀明确指定要使用哪个库的函数
  convert.base64Encode([65, 66, 67]); // 使用convert库的函数

  // 对于类似方法名冲突，使用库别名是最佳实践
  print('  通过as别名区分同名方法:');
  print('  - 原始库: ${greet("李四")}');
  print('  - mock库: ${mock.greet("李四")}');
}

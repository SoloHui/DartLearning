// Dart required 关键字演示
// required 关键字用于标记命名参数为必需参数

void main() {
  // 1. 使用有必需参数的函数
  print('创建用户:');
  createUser(id: 1, name: '张三', email: 'zhangsan@example.com');

  // 省略可选参数 bio
  createUser(id: 2, name: '李四', email: 'lisi@example.com');

  // 如果省略必需参数，编译器会报错
  // createUser(id: 3, email: 'wangwu@example.com'); // 错误：缺少必需参数 name

  // 2. 创建对象
  print('\n创建对象:');
  final product = Product(id: 101, name: '手机', price: 3999);
  print(
    '产品信息: ${product.id}, ${product.name}, ${product.price}元, ${product.description ?? '无描述'}',
  );

  // 3. 使用 required 与 nullable 类型结合
  print('\nrequired 与 nullable 类型结合:');
  printUserData(
    userId: 1001,
    username: 'admin',
    email: null, // email 是必需的参数，但可以是 null
  );

  // 4. 使用接口
  print('\n实现接口:');
  final dataProvider = MockDataProvider();
  final data = dataProvider.fetchData(
    endpoint: '/users',
    parameters: {'role': 'admin'},
  );
  print('获取的数据: $data');
}

// 使用 required 标记必需的命名参数
void createUser({
  required int id,
  required String name,
  required String email,
  String? bio,
}) {
  print('创建用户: $id, $name, $email, ${bio ?? '无简介'}');
}

// 在类构造函数中使用 required
class Product {
  final int id;
  final String name;
  final double price;
  final String? description;

  // 使用 required 标记必需的命名参数
  Product({
    required this.id,
    required this.name,
    required this.price,
    this.description,
  });
}

// required 与 nullable 类型结合
void printUserData({
  required int userId,
  required String username,
  required String? email, // 参数是必需的，但值可以是 null
}) {
  print('用户数据: $userId, $username, ${email ?? '无邮箱'}');
}

// 在接口中使用 required
abstract class DataProvider {
  Map<String, dynamic> fetchData({
    required String endpoint,
    required Map<String, String> parameters,
  });
}

// 实现接口
class MockDataProvider implements DataProvider {
  @override
  Map<String, dynamic> fetchData({
    required String endpoint,
    required Map<String, String> parameters,
  }) {
    // 模拟获取数据
    return {
      'endpoint': endpoint,
      'parameters': parameters,
      'result': 'mock data',
    };
  }
}

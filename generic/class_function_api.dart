// 泛型接口示例
abstract class Repository<T> {
  void save(T item);
  T? findById(String id);
  List<T> findAll();
  bool delete(String id);
}

// 实现泛型接口
class UserRepository implements Repository<User> {
  final List<User> _users = [];

  @override
  void save(User item) {
    _users.add(item);
    print('保存用户: ${item.name}');
  }

  @override
  User? findById(String id) {
    try {
      return _users.firstWhere((user) => user.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  List<User> findAll() {
    return List.from(_users);
  }

  @override
  bool delete(String id) {
    final index = _users.indexWhere((user) => user.id == id);
    if (index != -1) {
      _users.removeAt(index);
      return true;
    }
    return false;
  }
}

// 用户类
class User {
  final String id;
  final String name;

  User(this.id, this.name);

  @override
  String toString() => 'User(id: $id, name: $name)';
}

// 泛型类示例
class Container<T> {
  T _value;

  Container(this._value);

  T get value => _value;
  set value(T newValue) => _value = newValue;

  void display() {
    print('容器中存储: $_value');
  }
}

// 泛型函数示例
T getFirst<T>(List<T> items) {
  if (items.isEmpty) {
    throw ArgumentError('列表不能为空');
  }
  return items.first;
}

// 带约束的泛型函数
T process<T extends num>(T value) {
  return value;
}

void main() {
  // 使用泛型接口
  var userRepo = UserRepository();
  var user1 = User('1', '张三');
  var user2 = User('2', '李四');

  userRepo.save(user1);
  userRepo.save(user2);

  print('所有用户: ${userRepo.findAll()}');

  var foundUser = userRepo.findById('1');
  print('查找用户: $foundUser');

  // 使用泛型类
  var stringContainer = Container<String>('你好');
  var intContainer = Container<int>(42);

  stringContainer.display();
  intContainer.display();

  // 使用泛型函数
  var numbers = [1, 2, 3, 4, 5];
  var first = getFirst(numbers);
  print('第一个数字: $first');

  // 使用约束泛型
  var result = process(10.5);
  print('处理结果: $result');
}

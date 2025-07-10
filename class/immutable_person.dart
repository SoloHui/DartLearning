// 模块化库定义
library person_module;

// 不可变的Person类 - 推荐使用final字段
class Person {
  // 私有final属性（不可变数据）
  final String _name;
  final int _age;
  final String _email;

  // const构造函数 - 用于创建编译时常量
  const Person(this._name, this._age, [this._email = '']);

  // 命名构造函数
  const Person.withEmail(this._name, this._age, this._email);

  // 创建成年人的命名构造函数
  const Person.adult(this._name, this._email) : _age = 18;

  // 从映射创建的命名构造函数（非const，因为涉及运行时计算）
  Person.fromMap(Map<String, dynamic> map)
    : _name = map['name'],
      _age = map['age'],
      _email = map['email'] ?? '';

  // 获取器方法（只读访问）
  String get name => _name;
  int get age => _age;
  String get email => _email;

  // 私有方法（用于验证）
  static bool _isValidEmail(String email) {
    return email.contains('@') && email.contains('.');
  }

  // 公共方法
  void displayInfo() {
    print('姓名: $_name, 年龄: $_age, 邮箱: $_email');
  }

  // 内部使用的私有方法
  String _formatName() {
    return _name.toUpperCase();
  }

  String getFormattedName() {
    return _formatName();
  }

  // 创建修改后的新实例（不可变类的更新方式）
  Person copyWith({String? name, int? age, String? email}) {
    return Person.withEmail(name ?? _name, age ?? _age, email ?? _email);
  }

  // 静态工厂方法，用于创建具有验证的实例
  static Person? createWithValidation(
    String name,
    int age, [
    String email = '',
  ]) {
    if (name.isEmpty || age < 0 || age > 120) {
      return null;
    }
    if (email.isNotEmpty && !_isValidEmail(email)) {
      return null;
    }
    return Person(name, age, email);
  }
}

void main() {
  print('=== 不可变Person类示例 ===');

  // 使用const构造函数创建编译时常量
  const person1 = Person('Alice', 25);
  const person2 = Person.withEmail('Bob', 30, 'bob@email.com');
  const person3 = Person.adult('Charlie', 'charlie@email.com');

  // 使用从映射创建的命名构造函数（运行时）
  var person4 = Person.fromMap({
    'name': 'Diana',
    'age': 28,
    'email': 'diana@email.com',
  });

  // 使用获取器
  print('Person1 姓名: ${person1.name}');
  print('Person2 年龄: ${person2.age}');

  // 不可变类的更新方式：创建新实例
  var updatedPerson1 = person1.copyWith(email: 'alice@email.com', age: 26);

  print('\n=== 显示原始信息 ===');
  person1.displayInfo();
  person2.displayInfo();
  person3.displayInfo();
  person4.displayInfo();

  print('\n=== 显示更新后的信息 ===');
  updatedPerson1.displayInfo();

  // 使用调用私有方法的公共方法
  print('\n=== 格式化姓名 ===');
  print('格式化姓名: ${person1.getFormattedName()}');

  // 使用静态工厂方法创建带验证的实例
  print('\n=== 带验证的实例创建 ===');
  var validPerson = Person.createWithValidation('Eve', 22, 'eve@email.com');
  var invalidPerson = Person.createWithValidation('', -1, 'invalid-email');

  print('有效Person: ${validPerson?.name ?? "创建失败"}');
  print('无效Person: ${invalidPerson?.name ?? "创建失败"}');

  // 在常量表达式中使用const构造函数
  const List<Person> people = [
    Person('John', 25),
    Person.withEmail('Jane', 30, 'jane@email.com'),
    Person.adult('Jack', 'jack@email.com'),
  ];

  print('\n=== 常量Person列表 ===');
  for (final person in people) {
    person.displayInfo();
  }

  // 演示switch case中使用const实例
  print('\n=== Switch Case中使用const实例 ===');
  void checkPersonType(Person person) {
    switch (person.age) {
      case 18:
        print('${person.name} 是成年人');
        break;
      case 25:
        print('${person.name} 是青年');
        break;
      default:
        print('${person.name} 年龄: ${person.age}');
    }
  }

  checkPersonType(person1);
  checkPersonType(person3);

  print('\n=== 不可变类的优势演示 ===');
  print('原始person1: ${person1.name}, 年龄: ${person1.age}');
  print('更新后的实例: ${updatedPerson1.name}, 年龄: ${updatedPerson1.age}');
  print('注意：原始对象保持不变，这就是不可变性的优势！');
}

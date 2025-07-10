// 模块化库定义
library person_module;

class Person {
  // 私有属性（以下划线开头）
  String _name;
  int _age;
  String _email;

  // 默认构造函数
  Person(this._name, this._age, [this._email = '']);

  // 命名构造函数
  Person.withEmail(this._name, this._age, this._email);

  // 创建成年人的命名构造函数
  Person.adult(this._name, this._email) : _age = 18;

  // 从映射创建的命名构造函数
  Person.fromMap(Map<String, dynamic> map)
    : _name = map['name'],
      _age = map['age'],
      _email = map['email'] ?? '';

  // 获取器方法
  String get name => _name;
  int get age => _age;
  String get email => _email;

  // 设置器方法
  set name(String value) {
    if (value.isNotEmpty) {
      _name = value;
    }
  }

  set age(int value) {
    if (value >= 0 && value <= 120) {
      _age = value;
    }
  }

  set email(String value) {
    if (_isValidEmail(value)) {
      _email = value;
    }
  }

  // 私有方法
  bool _isValidEmail(String email) {
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
}

void main() {
  // 使用默认构造函数
  var person1 = Person('Alice', 25);

  // 使用命名构造函数
  var person2 = Person.withEmail('Bob', 30, 'bob@email.com');

  // 使用成年人命名构造函数
  var person3 = Person.adult('Charlie', 'charlie@email.com');

  // 使用从映射创建的命名构造函数
  var person4 = Person.fromMap({
    'name': 'Diana',
    'age': 28,
    'email': 'diana@email.com',
  });

  // 使用获取器
  print('Person1 姓名: ${person1.name}');
  print('Person2 年龄: ${person2.age}');

  // 使用设置器
  person1.email = 'alice@email.com';
  person1.age = 26;

  // 显示信息
  person1.displayInfo();
  person2.displayInfo();
  person3.displayInfo();
  person4.displayInfo();

  // 使用调用私有方法的公共方法
  print('格式化姓名: ${person1.getFormattedName()}');
}

// 模块化库定义
library mutable_person_module;

// 可变的Person类 - 当需要修改数据时使用
class MutablePerson {
  // 私有属性（可变）
  String _name;
  int _age;
  String _email;

  // 构造函数
  MutablePerson(this._name, this._age, [this._email = '']);

  // 命名构造函数
  MutablePerson.withEmail(this._name, this._age, this._email);

  // 创建成年人的命名构造函数
  MutablePerson.adult(this._name, this._email) : _age = 18;

  // 从映射创建的命名构造函数
  MutablePerson.fromMap(Map<String, dynamic> map)
    : _name = map['name'],
      _age = map['age'],
      _email = map['email'] ?? '';

  // 获取器方法
  String get name => _name;
  int get age => _age;
  String get email => _email;

  // 设置器方法（带验证）
  set name(String value) {
    if (value.isNotEmpty) {
      _name = value;
    } else {
      throw ArgumentError('The name cannot be empty');
    }
  }

  set age(int value) {
    if (value >= 0 && value <= 120) {
      _age = value;
    } else {
      throw ArgumentError('The age must be between 0 and 120.');
    }
  }

  set email(String value) {
    if (value.isEmpty || _isValidEmail(value)) {
      _email = value;
    } else {
      throw ArgumentError('The email format is incorrect.');
    }
  }

  // 私有验证方法
  static bool _isValidEmail(String email) {
    return email.contains('@') && email.contains('.');
  }

  // 公共方法
  void displayInfo() {
    print('可变Person - 姓名: $_name, 年龄: $_age, 邮箱: $_email');
  }

  // 内部使用的私有方法
  String _formatName() {
    return _name.toUpperCase();
  }

  String getFormattedName() {
    return _formatName();
  }

  // 批量更新方法
  void updateInfo({String? name, int? age, String? email}) {
    if (name != null) this.name = name;
    if (age != null) this.age = age;
    if (email != null) this.email = email;
  }

  // 重置邮箱
  void clearEmail() {
    _email = '';
  }

  // 增加年龄
  void incrementAge([int years = 1]) {
    if (_age + years <= 120) {
      _age += years;
    } else {
      throw ArgumentError(
        'The age cannot exceed 120 years old after it is increased.',
      );
    }
  }

  // 验证所有字段是否有效
  bool isValid() {
    return _name.isNotEmpty &&
        _age >= 0 &&
        _age <= 120 &&
        (_email.isEmpty || _isValidEmail(_email));
  }

  // 获取对象的字符串表示
  @override
  String toString() {
    return 'MutablePerson(name: $_name, age: $_age, email: $_email)';
  }

  // 比较两个对象是否相等
  @override
  bool operator ==(Object other) {
    return other is MutablePerson &&
        _name == other._name &&
        _age == other._age &&
        _email == other._email;
  }

  // 生成哈希码
  @override
  int get hashCode => Object.hash(_name, _age, _email);

  // 克隆当前对象
  MutablePerson clone() {
    return MutablePerson.withEmail(_name, _age, _email);
  }
}

void main() {
  print('=== 可变Person类示例 ===');

  // 创建可变Person实例
  var person1 = MutablePerson('Mike', 35, 'mike@email.com');
  var person2 = MutablePerson.withEmail('Sarah', 28, 'sarah@email.com');
  var person3 = MutablePerson.adult('Tom', 'tom@email.com');

  print('\n=== 初始状态 ===');
  person1.displayInfo();
  person2.displayInfo();
  person3.displayInfo();

  print('\n=== 使用设置器修改数据 ===');
  // 使用设置器修改数据
  person1.name = 'Michael';
  person1.age = 36;
  person1.email = 'michael@email.com';

  person1.displayInfo();

  print('\n=== 批量更新 ===');
  person2.updateInfo(
    name: 'Sarah Johnson',
    age: 29,
    email: 'sarah.johnson@email.com',
  );
  person2.displayInfo();

  print('\n=== 年龄增加 ===');
  print('Tom增加前: ${person3.age}岁');
  person3.incrementAge(2);
  print('Tom增加后: ${person3.age}岁');

  print('\n=== 清除邮箱 ===');
  print('Sarah清除邮箱前: ${person2.email}');
  person2.clearEmail();
  print('Sarah清除邮箱后: ${person2.email}');

  print('\n=== 验证数据有效性 ===');
  print('Person1有效性: ${person1.isValid()}');
  print('Person2有效性: ${person2.isValid()}');
  print('Person3有效性: ${person3.isValid()}');

  print('\n=== 对象克隆 ===');
  var clonedPerson = person1.clone();
  print('原始对象: $person1');
  print('克隆对象: $clonedPerson');
  print('对象相等性: ${person1 == clonedPerson}');

  print('\n=== 修改克隆对象 ===');
  clonedPerson.name = 'Michael Clone';
  print('修改后原始对象: $person1');
  print('修改后克隆对象: $clonedPerson');
  print('修改后对象相等性: ${person1 == clonedPerson}');

  print('\n=== 错误处理示例 ===');
  try {
    person1.age = -5; // 这会抛出异常
  } catch (e) {
    print('捕获到错误: $e');
  }

  try {
    person1.email = 'invalid-email'; // 这会抛出异常
  } catch (e) {
    print('捕获到错误: $e');
  }

  try {
    person1.name = ''; // 这会抛出异常
  } catch (e) {
    print('捕获到错误: $e');
  }

  print('\n=== 格式化姓名 ===');
  print('格式化姓名: ${person1.getFormattedName()}');

  print('\n=== 可变类的使用场景 ===');
  print('1. 需要频繁修改对象状态');
  print('2. 表单数据绑定');
  print('3. 游戏角色状态管理');
  print('4. 配置对象的运行时修改');
  print('5. 缓存数据的更新');
}

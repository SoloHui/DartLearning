class Person {
  String? name;
  int? age;

  Person(this.name, this.age);

  void introduce() {
    print('Hi, I am $name, age $age');
  }

  void celebrate() {
    print('$name is celebrating!');
  }
}

void main() {
  // Person person;

  // ? 操作符 - 安全调用
  // print(person?.name); // 如果person为null，返回null而不是抛出异常
  // person?.introduce(); // 安全调用方法

  // is 操作符 - 类型检查
  // if (person is Person) {
  //   print('person is a Person instance');
  // }

  // as 操作符 - 类型转换
  Object obj = 'Hello';
  String str = obj as String; // 强制转换
  print(str);

  // .. 操作符 - 级联调用
  // Person newPerson = Person('Bob', 30)
  //   ..introduce()
  //   ..celebrate(); // 可以连续调用多个方法

  // 组合使用
  // person = null;
  // person?.introduce(); // 不会执行，因为person为null

  // if (obj is String) {
  //   print('obj is String: ${obj.length}'); // 类型检查后自动转换
  // }
}

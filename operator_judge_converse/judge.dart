void main() {
  // if else 语句
  int age = 18;
  if (age >= 18) {
    print('成年人');
  } else if (age >= 13) {
    print('青少年');
  } else {
    print('儿童');
  }

  // switch case 语句
  String grade = 'A';
  switch (grade) {
    case 'A':
      print('优秀');
      break;
    case 'B':
      print('良好');
      break;
    case 'C':
      print('及格');
      break;
    default:
      print('不及格');
  }

  // 三目运算符 (条件 ? 真值 : 假值)
  int score = 85;
  String result = score >= 60 ? '及格' : '不及格';
  print(result);

  // ?? 运算符 (空值合并运算符)
  String? name = null;
  String displayName = name ?? '未知用户';
  print(displayName);

  // ??= 运算符 (空值赋值运算符)
  String? username;
  username ??= '默认用户名';
  print(username);

  // 链式空值判断
  String? firstName = null;
  String? lastName = 'Smith';
  String fullName = (firstName ?? '') + ' ' + (lastName ?? '');
  print(fullName.trim());
}

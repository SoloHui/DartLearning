void main() {
  // 多行字符串定义
  // 方式1：使用三个单引号
  String multiLine1 = '''
  这是一个多行字符串
  可以包含多行内容
  不需要转义换行符
  ''';

  // 方式2：使用三个双引号
  String multiLine2 = """
  这也是一个多行字符串
  同样可以包含多行内容
  """;

  // 字符串拼接
  // 方式1：使用 + 操作符
  String name = "张三";
  String age = "25";
  String info1 = "姓名：" + name + "，年龄：" + age;

  // 方式2：使用字符串插值（推荐）
  String info2 = "姓名：$name，年龄：$age";

  // 方式3：使用表达式插值
  String info3 = "姓名：${name.toUpperCase()}，年龄：${int.parse(age) + 1}";

  // 方式4：相邻字符串自动拼接
  String info4 =
      "姓名："
      "$name"
      "，年龄："
      "$age";

  // 输出结果
  print(multiLine1);
  print(multiLine2);
  print(info1);
  print(info2);
  print(info3);
  print(info4);
}

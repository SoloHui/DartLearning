// comprehensive_example.dart
// 本文件综合展示 const、final、identical 和常量构造函数的结合使用

void main() {
  print('===== 不可变(Immutable)应用实例 =====\n');

  // 在实际应用中，不可变对象有很多优势：
  // 1. 线程安全 - 不可变对象可以被多个线程安全地访问，无需担心数据竞争
  // 2. 缓存友好 - 相同的常量对象只会创建一次，节省内存
  // 3. 对象一致性 - 不可变对象状态永远不变，降低了复杂性
  // 4. 安全共享 - 可以安全地在不同上下文中共享对象

  print('==== 一、应用配置示例 ====');
  // 应用配置是不可变对象的典型用例
  const appConfig1 = AppConfig(
    appName: '我的应用',
    version: '1.0.0',
    buildNumber: 100,
    settings: {'theme': 'dark', 'language': 'zh_CN', 'fontSize': '14'},
  );

  // 相同配置只会创建一个实例
  const appConfig2 = AppConfig(
    appName: '我的应用',
    version: '1.0.0',
    buildNumber: 100,
    settings: {'theme': 'dark', 'language': 'zh_CN', 'fontSize': '14'},
  );

  print('应用配置 1: $appConfig1');
  print('应用配置 2: $appConfig2');
  print('是否是同一个实例: ${identical(appConfig1, appConfig2)}'); // true

  // final 变量引用 const 对象
  final appConfig3 = appConfig1;
  print(
    'appConfig3 是否与 appConfig1 相同: ${identical(appConfig1, appConfig3)}',
  ); // true

  print('\n==== 二、不可变对象集合 ====');
  // 创建不可变的菜单项集合
  const menuItems = [
    MenuItem(id: 'home', title: '首页', icon: 'home_icon'),
    MenuItem(id: 'profile', title: '个人资料', icon: 'user_icon'),
    MenuItem(id: 'settings', title: '设置', icon: 'settings_icon'),
  ];

  // 在另一个地方使用相同的菜单项
  const homeMenuItem = MenuItem(id: 'home', title: '首页', icon: 'home_icon');

  print('菜单项: $menuItems');
  print('首页菜单项: $homeMenuItem');
  print(
    '集合中的首页菜单项与单独创建的是否相同: ${identical(menuItems[0], homeMenuItem)}',
  ); // true

  print('\n==== 三、值对象模式 ====');
  // 值对象是业务领域中的不可变对象，由其属性值而非身份标识
  const address1 = Address(
    street: '中关村大街1号',
    city: '北京',
    province: '北京市',
    postalCode: '100190',
  );

  const address2 = Address(
    street: '中关村大街1号',
    city: '北京',
    province: '北京市',
    postalCode: '100190',
  );

  print('地址1: $address1');
  print('地址2: $address2');
  print('地址1 == 地址2: ${address1 == address2}'); // true，因为重写了 == 操作符
  print('地址1与地址2是否是同一个实例: ${identical(address1, address2)}'); // true，因为是常量对象

  final address3 = Address(
    street: '中关村大街1号',
    city: '北京',
    province: '北京市',
    postalCode: '100190',
  );

  print('地址3 (非const创建): $address3');
  print('地址1 == 地址3: ${address1 == address3}'); // true，值相等
  print('地址1与地址3是否是同一个实例: ${identical(address1, address3)}'); // false，不同实例

  print('\n==== 四、不可变树状结构 ====');
  // 创建不可变的树状结构
  const root = TreeNode(
    value: 'Root',
    children: [
      TreeNode(
        value: 'Child 1',
        children: [
          TreeNode(value: 'Grandchild 1.1'),
          TreeNode(value: 'Grandchild 1.2'),
        ],
      ),
      TreeNode(
        value: 'Child 2',
        children: [TreeNode(value: 'Grandchild 2.1')],
      ),
    ],
  );

  print('树结构:\n${root.prettyPrint()}');

  // 创建相同的子树
  const child1 = TreeNode(
    value: 'Child 1',
    children: [
      TreeNode(value: 'Grandchild 1.1'),
      TreeNode(value: 'Grandchild 1.2'),
    ],
  );

  print('\n子树是否与原树的第一个子节点相同: ${identical(root.children[0], child1)}'); // true

  print('\n==== 五、性能优化 ====');
  // 测试创建大量相同对象的性能差异

  // 创建大量 const 对象
  final constResults = createConstObjects();
  print('创建1000个常量对象的唯一实例数: ${countUniqueInstances(constResults)}'); // 1

  // 创建大量非 const 对象
  final nonConstResults = createNonConstObjects();
  print('创建1000个非常量对象的唯一实例数: ${countUniqueInstances(nonConstResults)}'); // 1000
}

// 计算列表中唯一实例的数量
int countUniqueInstances<T>(List<T> objects) {
  final uniqueInstances = <T>{};
  for (final obj in objects) {
    var isUnique = true;
    for (final unique in uniqueInstances) {
      if (identical(obj, unique)) {
        isUnique = false;
        break;
      }
    }
    if (isUnique) {
      uniqueInstances.add(obj);
    }
  }
  return uniqueInstances.length;
}

// 创建1000个常量对象
List<DataPoint> createConstObjects() {
  return List.generate(1000, (_) => const DataPoint(x: 10, y: 20));
}

// 创建1000个非常量对象
List<DataPoint> createNonConstObjects() {
  return List.generate(1000, (_) => DataPoint(x: 10, y: 20));
}

// 示例1：应用配置类
class AppConfig {
  final String appName;
  final String version;
  final int buildNumber;
  final Map<String, String> settings;

  // 常量构造函数
  const AppConfig({
    required this.appName,
    required this.version,
    required this.buildNumber,
    required this.settings,
  });

  @override
  String toString() {
    return 'AppConfig{appName: $appName, version: $version, buildNumber: $buildNumber, settings: $settings}';
  }
}

// 示例2：菜单项
class MenuItem {
  final String id;
  final String title;
  final String icon;

  const MenuItem({required this.id, required this.title, required this.icon});

  @override
  String toString() => 'MenuItem{id: $id, title: $title, icon: $icon}';
}

// 示例3：值对象 - 地址
class Address {
  final String street;
  final String city;
  final String province;
  final String postalCode;

  const Address({
    required this.street,
    required this.city,
    required this.province,
    required this.postalCode,
  });

  // 重写 == 运算符，基于值比较而非引用比较
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Address &&
        other.street == street &&
        other.city == city &&
        other.province == province &&
        other.postalCode == postalCode;
  }

  // 重写 == 时必须重写 hashCode
  @override
  int get hashCode => Object.hash(street, city, province, postalCode);

  @override
  String toString() => 'Address{$street, $city, $province, $postalCode}';
}

// 示例4：树节点
class TreeNode {
  final String value;
  final List<TreeNode> children;

  const TreeNode({required this.value, this.children = const []});

  // 美化打印树结构
  String prettyPrint([int indent = 0]) {
    final buffer = StringBuffer();
    final padding = ' ' * indent * 2;
    buffer.writeln('$padding- $value');

    for (final child in children) {
      buffer.write(child.prettyPrint(indent + 1));
    }

    return buffer.toString();
  }

  @override
  String toString() => 'TreeNode($value, children: ${children.length})';
}

// 示例5：性能测试的数据点类
class DataPoint {
  final int x;
  final int y;

  const DataPoint({required this.x, required this.y});
}

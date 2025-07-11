# Dart 泛型编程

这个目录包含了Dart语言中泛型(Generics)相关的代码示例和最佳实践。泛型是Dart中的一种强大特性，允许开发者创建可重用的、类型安全的代码，能够处理多种不同的数据类型。

## 文件说明

### 1. `class_function_api.dart`

这个文件介绍了Dart中泛型的基础用法：

- **泛型接口定义**：创建可被不同类型实现的通用接口
- **泛型类实现**：实现特定类型的泛型接口
- **泛型类创建**：创建支持任意类型的容器类
- **泛型函数**：定义可处理多种类型的函数
- **类型约束**：限制泛型参数必须符合特定类型

关键知识点：

- 使用尖括号`<T>`定义泛型参数
- 泛型类和泛型接口提高代码的重用性和类型安全性
- 泛型函数支持参数类型的灵活性
- 使用`extends`关键字对泛型类型添加约束

### 2. `multiple_generics.dart`

这个文件展示了Dart中更高级的泛型用法：

- **多泛型参数**：使用多个泛型类型参数创建复杂数据结构
- **键值对和多元组**：使用泛型表示不同类型的数据组合
- **泛型缓存系统**：创建通用缓存机制
- **结果包装器**：处理成功/失败场景的类型安全方式
- **转换器**：在不同类型间进行转换
- **处理管道**：多步骤数据处理链
- **事件系统**：类型安全的事件发布/订阅机制
- **多对多关系映射**：复杂数据关系建模

关键知识点：

- 使用多个泛型参数表达复杂关系：`class Pair<K, V> { ... }`
- 泛型嵌套：`Cache<Pair<String, int>, Result<List<String>, String>>`
- 函数式转换链：使用泛型实现类型安全的数据流
- 高阶泛型抽象：使用泛型创建复杂的设计模式

## Dart泛型详解

### 泛型基础

泛型是一种在定义类、接口或函数时不预先指定具体类型，而是在使用时再指定类型的技术。

```dart
// 定义泛型类
class Box<T> {
  T value;
  Box(this.value);
}

// 使用泛型类
var stringBox = Box<String>('Hello');
var intBox = Box<int>(42);
```

### 泛型类型参数

在Dart中，泛型类型参数通常使用单个大写字母表示：

- `E` - Element（元素），通常用于集合
- `T` - Type（类型），通常用于通用类型
- `K` - Key（键），通常用于映射
- `V` - Value（值），通常用于映射
- `R` - Result（结果），通常用于返回类型

例如：

```dart
List<E> // E表示列表元素类型
Map<K, V> // K表示键类型，V表示值类型
Future<T> // T表示异步操作的结果类型
```

### 泛型类和接口

泛型类和接口允许在一个类中使用不同类型的组件而不失类型安全性：

```dart
// 泛型接口
abstract class Storage<T> {
  void store(T item);
  T retrieve();
}

// 泛型类实现泛型接口
class FileStorage<T> implements Storage<T> {
  T? _data;
  
  @override
  void store(T item) {
    _data = item;
  }
  
  @override
  T retrieve() {
    return _data!;
  }
}

// 使用
var stringStorage = FileStorage<String>();
stringStorage.store('数据');
String data = stringStorage.retrieve();
```

### 泛型函数

泛型函数使用类型参数来创建可复用的函数：

```dart
// 泛型函数
T first<T>(List<T> list) {
  if (list.isEmpty) throw Exception('列表为空');
  return list.first;
}

// 使用泛型函数
var firstNum = first<int>([1, 2, 3]);  // 显式指定类型
var firstString = first(['a', 'b', 'c']);  // 类型推导
```

### 泛型类型约束

可以使用`extends`关键字限制泛型参数必须是某个类型或其子类型：

```dart
// 约束泛型类型
class NumericBox<T extends num> {
  T value;
  NumericBox(this.value);
  
  double squared() => value * value;
}

// 有效使用
var intBox = NumericBox<int>(5);
var doubleBox = NumericBox<double>(3.14);

// 编译错误
// var stringBox = NumericBox<String>('不允许');  // String不是num的子类型
```

### 泛型方法

类中的方法也可以使用泛型，无论类本身是否是泛型类：

```dart
class Utilities {
  // 泛型方法
  T? findFirst<T>(List<dynamic> items) {
    for (var item in items) {
      if (item is T) return item;
    }
    return null;
  }
}

// 使用
var utils = Utilities();
var firstString = utils.findFirst<String>([1, 'hello', true]); // 返回'hello'
```

## 高级泛型技术

### 1. 泛型的类型擦除与运行时类型

Dart在运行时会擦除泛型类型信息，但保留基本类型检查：

```dart
void main() {
  var list1 = <int>[];
  var list2 = <String>[];
  
  print(list1 is List<int>);    // true
  print(list2 is List<String>); // true
  
  // 通用类型检查，因为运行时类型信息被部分擦除
  print(list1 is List);         // true
  print(list2 is List);         // true
}
```

### 2. 泛型工厂构造函数

泛型类可以使用工厂构造函数来控制实例的创建：

```dart
class Factory<T> {
  // 泛型工厂构造函数
  factory Factory() {
    if (T == String) {
      return Factory<String>._internal() as Factory<T>;
    } else {
      return Factory<T>._internal();
    }
  }
  
  Factory._internal();
}
```

### 3. 泛型类型别名

使用`typedef`创建泛型类型别名：

```dart
// 函数类型别名
typedef Parser<T> = T Function(String input);

// 使用类型别名
Parser<int> intParser = (String input) => int.parse(input);
Parser<double> doubleParser = (String input) => double.parse(input);
```

### 4. 协变与逆变

Dart中的泛型默认是不变的(invariant)，但对于一些集合类型提供了协变支持：

```dart
// 协变示例
class Animal {}
class Dog extends Animal {}

// List<Dog>可以赋值给List<Animal>，因为List是协变的
List<Dog> dogs = [Dog(), Dog()];
List<Animal> animals = dogs;  // 有效

// 但Map的键是不变的
Map<Dog, String> dogMap = {Dog(): 'Buddy'};
// Map<Animal, String> animalMap = dogMap;  // 编译错误
```

## 泛型最佳实践

### 1. 何时使用泛型

- **集合类**：当你的类需要存储或操作不同类型的数据
- **工具类**：提供通用功能但不依赖于具体类型的类
- **包装类**：包装其他对象或值的类（如Result、Optional等）
- **接口**：定义通用行为但不指定具体实现类型的接口

### 2. 提高代码可读性

```dart
// 不好的写法
Map<String, List<Map<String, dynamic>>> data;

// 更好的写法 - 使用类型别名
typedef UserInfo = Map<String, dynamic>;
typedef UserGroup = List<UserInfo>;
typedef UserDirectory = Map<String, UserGroup>;

UserDirectory data;
```

### 3. 合理使用类型约束

```dart
// 过于宽松
class Repository<T> { ... }

// 更加明确的约束
class Repository<T extends DatabaseEntity> { ... }
```

### 4. 避免过度使用泛型

不是所有类或函数都需要使用泛型。如果你的类或函数只处理一种特定类型，直接使用该类型会更清晰。

## 实际应用场景

### 1. 状态管理

使用泛型存储和管理不同类型的状态：

```dart
class StateProvider<T> {
  T _state;
  
  StateProvider(this._state);
  
  T get state => _state;
  
  void update(T newState) {
    _state = newState;
    notifyListeners();
  }
  
  void notifyListeners() {
    // 通知监听器状态更新
  }
}

// 使用
var counterState = StateProvider<int>(0);
var userState = StateProvider<User>(User('张三'));
```

### 2. API请求响应处理

使用泛型处理不同类型的API响应：

```dart
class ApiResponse<T> {
  final T? data;
  final String? error;
  final bool isSuccess;
  
  ApiResponse.success(this.data) 
    : error = null, 
      isSuccess = true;
      
  ApiResponse.error(this.error) 
    : data = null, 
      isSuccess = false;
}

// 使用
ApiResponse<User> userResponse = await fetchUser();
ApiResponse<List<Product>> productsResponse = await fetchProducts();
```

### 3. 数据转换

使用泛型简化数据转换逻辑：

```dart
class JsonConverter<T> {
  T fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson(T object);
}

// 实现特定类型的转换
class UserConverter implements JsonConverter<User> {
  @override
  User fromJson(Map<String, dynamic> json) {
    return User(json['name'], json['age']);
  }
  
  @override
  Map<String, dynamic> toJson(User user) {
    return {'name': user.name, 'age': user.age};
  }
}
```

## 学习资源

- [Dart官方文档 - 泛型](https://dart.dev/language/generics)
- [Dart官方文档 - 类型系统](https://dart.dev/language/type-system)
- [Dart API参考 - 常用泛型类](https://api.dart.dev/stable/dart-core/dart-core-library.html)
- [Effective Dart: 设计指南](https://dart.dev/guides/language/effective-dart/design)

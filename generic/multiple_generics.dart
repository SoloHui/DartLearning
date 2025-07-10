// 多个泛型参数示例

// ======================= 双泛型类 =======================

// 键值对类，包含两个不同类型的泛型参数
class Pair<K, V> {
  final K key;
  final V value;

  const Pair(this.key, this.value);

  @override
  // 重构这个是为了方便打印
  String toString() => 'Pair($key: $value)';

  @override
  bool operator ==(Object other) {
    return other is Pair<K, V> && key == other.key && value == other.value;
  }

  @override
  // 重写哈希码方法，确保键值对的唯一性
  int get hashCode => Object.hash(key, value);
}

// 三元组类，包含三个不同类型的泛型参数
class Triple<A, B, C> {
  final A first;
  final B second;
  final C third;

  const Triple(this.first, this.second, this.third);

  @override
  String toString() => 'Triple($first, $second, $third)';
}

// ======================= 映射缓存类 =======================

// 通用缓存类，支持任意键值类型
class Cache<K, V> {
  final Map<K, V> _cache = {};
  final int _maxSize;

  Cache({int maxSize = 100}) : _maxSize = maxSize;

  // 存储键值对
  void put(K key, V value) {
    if (_cache.length >= _maxSize) {
      // 删除最早的条目（简单的LRU策略）
      final firstKey = _cache.keys.first;
      _cache.remove(firstKey);
    }
    _cache[key] = value;
    print('缓存存储: $key -> $value');
  }

  // 获取值
  V? get(K key) {
    return _cache[key];
  }

  // 检查是否包含键
  bool containsKey(K key) {
    return _cache.containsKey(key);
  }

  // 清空缓存
  void clear() {
    _cache.clear();
    print('缓存已清空');
  }

  // 获取所有键值对
  List<Pair<K, V>> getAllPairs() {
    return _cache.entries.map((entry) => Pair(entry.key, entry.value)).toList();
  }

  int get size => _cache.length;
}

// ======================= 结果包装类 =======================

// 表示操作结果的泛型类，可以包含成功值或错误信息
class Result<T, E> {
  final T? _value;
  final E? _error;
  final bool _isSuccess;

  const Result.success(T value)
    : _value = value,
      _error = null,
      _isSuccess = true;

  const Result.failure(E error)
    : _value = null,
      _error = error,
      _isSuccess = false;

  bool get isSuccess => _isSuccess;
  bool get isFailure => !_isSuccess;

  T get value {
    if (!_isSuccess) {
      throw StateError('尝试获取失败结果的值');
    }
    return _value!;
  }

  E get error {
    if (_isSuccess) {
      throw StateError('尝试获取成功结果的错误');
    }
    return _error!;
  }

  // 转换成功值
  Result<U, E> map<U>(U Function(T) transform) {
    if (_isSuccess) {
      return Result.success(transform(_value!));
    }
    return Result.failure(_error!);
  }

  // 扁平化映射
  Result<U, E> flatMap<U>(Result<U, E> Function(T) transform) {
    if (_isSuccess) {
      return transform(_value!);
    }
    return Result.failure(_error!);
  }

  @override
  String toString() {
    if (_isSuccess) {
      return 'Result.success($_value)';
    }
    return 'Result.failure($_error)';
  }
}

// ======================= 转换器类 =======================

// 通用数据转换器
abstract class Converter<Input, Output> {
  Output convert(Input input);
}

// 字符串到整数转换器
class StringToIntConverter implements Converter<String, int> {
  @override
  int convert(String input) {
    return int.parse(input);
  }
}

// 列表转换器
class ListConverter<From, To> implements Converter<List<From>, List<To>> {
  final Converter<From, To> _itemConverter;

  ListConverter(this._itemConverter);

  @override
  List<To> convert(List<From> input) {
    return input.map((item) => _itemConverter.convert(item)).toList();
  }
}

// ======================= 数据处理管道 =======================

// 处理管道类，支持多步骤数据转换
class Pipeline<Input, Output> {
  final List<Function> _steps = [];

  Pipeline();

  // 添加转换步骤
  Pipeline<Input, NewOutput> then<NewOutput>(
    NewOutput Function(Output) transform,
  ) {
    final newPipeline = Pipeline<Input, NewOutput>();
    newPipeline._steps.addAll(_steps);
    newPipeline._steps.add(transform);
    return newPipeline;
  }

  // 执行管道
  Output execute(Input input) {
    dynamic current = input;
    for (final step in _steps) {
      current = step(current);
    }
    return current as Output;
  }

  // 静态工厂方法，更容易构建管道
  static Pipeline<T, T> start<T>() {
    return Pipeline<T, T>();
  }
}

// ======================= 事件系统 =======================

// 事件监听器
typedef EventListener<T> = void Function(T event);

// 事件总线
class EventBus<EventType, ListenerType> {
  final Map<EventType, List<ListenerType>> _listeners = {};

  // 注册监听器
  void on(EventType eventType, ListenerType listener) {
    _listeners.putIfAbsent(eventType, () => []).add(listener);
    print('已注册监听器: $eventType');
  }

  // 移除监听器
  void off(EventType eventType, ListenerType listener) {
    final listeners = _listeners[eventType];
    if (listeners != null) {
      listeners.remove(listener);
      if (listeners.isEmpty) {
        _listeners.remove(eventType);
      }
    }
  }

  // 触发事件
  void emit<T>(EventType eventType, T data) {
    final listeners = _listeners[eventType];
    if (listeners != null) {
      print('触发事件: $eventType, 数据: $data');
      for (final listener in listeners) {
        if (listener is Function(T)) {
          listener(data);
        }
      }
    }
  }

  // 获取监听器数量
  int getListenerCount(EventType eventType) {
    return _listeners[eventType]?.length ?? 0;
  }
}

// ======================= 关系映射 =======================

// 多对多关系映射
class ManyToManyMap<K1, K2> {
  final Map<K1, Set<K2>> _forward = {};
  final Map<K2, Set<K1>> _reverse = {};

  // 添加关联
  void associate(K1 key1, K2 key2) {
    _forward.putIfAbsent(key1, () => {}).add(key2);
    _reverse.putIfAbsent(key2, () => {}).add(key1);
    print('关联: $key1 <-> $key2');
  }

  // 移除关联
  void disassociate(K1 key1, K2 key2) {
    _forward[key1]?.remove(key2);
    _reverse[key2]?.remove(key1);

    if (_forward[key1]?.isEmpty == true) {
      _forward.remove(key1);
    }
    if (_reverse[key2]?.isEmpty == true) {
      _reverse.remove(key2);
    }
  }

  // 获取正向关联
  Set<K2> getAssociatedWith(K1 key) {
    return _forward[key] ?? {};
  }

  // 获取反向关联
  Set<K1> getAssociatedBy(K2 key) {
    return _reverse[key] ?? {};
  }

  // 检查是否存在关联
  bool hasAssociation(K1 key1, K2 key2) {
    return _forward[key1]?.contains(key2) == true;
  }
}

// ======================= 主函数演示 =======================

void main() {
  print('=================== 双泛型 Pair 类 ===================');

  var stringIntPair = Pair<String, int>('年龄', 25);
  var boolDoublePair = Pair<bool, double>(true, 3.14);

  print('字符串-整数对: $stringIntPair');
  print('布尔-浮点对: $boolDoublePair');

  print('\n=================== 三泛型 Triple 类 ===================');

  var coordinate = Triple<String, double, double>('位置', 116.4074, 39.9042);
  var userInfo = Triple<int, String, bool>(1, '张三', true);

  print('坐标信息: $coordinate');
  print('用户信息: $userInfo');

  print('\n=================== 缓存系统 ===================');

  var stringCache = Cache<String, String>(maxSize: 3);
  stringCache.put('name', '张三');
  stringCache.put('city', '北京');
  stringCache.put('job', '程序员');

  print('获取姓名: ${stringCache.get('name')}');
  print('缓存大小: ${stringCache.size}');

  var intCache = Cache<int, List<String>>();
  intCache.put(1, ['苹果', '香蕉']);
  intCache.put(2, ['猫', '狗']);

  print('ID为1的列表: ${intCache.get(1)}');

  print('\n=================== Result 类型 ===================');

  Result<int, String> divideNumbers(int a, int b) {
    if (b == 0) {
      return Result.failure('除数不能为零');
    }
    return Result.success(a ~/ b);
  }

  var successResult = divideNumbers(10, 2);
  var failureResult = divideNumbers(10, 0);

  print('成功结果: $successResult');
  print('失败结果: $failureResult');

  if (successResult.isSuccess) {
    print('计算结果: ${successResult.value}');
  }

  if (failureResult.isFailure) {
    print('错误信息: ${failureResult.error}');
  }

  print('\n=================== 转换器 ===================');

  var stringToInt = StringToIntConverter();
  var listConverter = ListConverter<String, int>(stringToInt);

  var stringNumbers = ['1', '2', '3', '4', '5'];
  var intNumbers = listConverter.convert(stringNumbers);

  print('字符串列表: $stringNumbers');
  print('整数列表: $intNumbers');

  print('\n=================== 处理管道 ===================');

  var pipeline = Pipeline.start<String>()
      .then<int>((s) => s.length) // 字符串 -> 长度
      .then<int>((len) => len * 2) // 长度 -> 长度*2
      .then<int>((doubled) => doubled + 1); // +1

  var result = pipeline.execute('Hello World');
  print('管道处理结果: $result'); // (11 * 2) + 1 = 23

  print('\n=================== 事件系统 ===================');

  var eventBus = EventBus<String, Function>();

  // 注册监听器
  eventBus.on('user_login', (String username) {
    print('用户登录事件: $username');
  });

  eventBus.on('user_logout', (String username) {
    print('用户登出事件: $username');
  });

  // 触发事件
  eventBus.emit('user_login', '张三');
  eventBus.emit('user_logout', '张三');

  print('\n=================== 多对多关系映射 ===================');

  var userRoleMap = ManyToManyMap<String, String>();

  // 建立用户-角色关联
  userRoleMap.associate('张三', '管理员');
  userRoleMap.associate('张三', '用户');
  userRoleMap.associate('李四', '用户');
  userRoleMap.associate('王五', '管理员');

  print('张三的角色: ${userRoleMap.getAssociatedWith('张三')}');
  print('管理员角色的用户: ${userRoleMap.getAssociatedBy('管理员')}');
  print('张三是否有管理员角色: ${userRoleMap.hasAssociation('张三', '管理员')}');

  print('\n=================== 复杂泛型组合 ===================');

  // 复杂的嵌套泛型使用
  var complexCache = Cache<Pair<String, int>, Result<List<String>, String>>();

  var key = Pair('用户', 123);
  var value = Result<List<String>, String>.success(['权限1', '权限2', '权限3']);

  complexCache.put(key, value);
  var retrieved = complexCache.get(key);

  if (retrieved != null && retrieved.isSuccess) {
    print('复杂缓存结果: ${retrieved.value}');
  }

  print('\n=================== 总结 ===================');
  print('''
🎯 多泛型参数的优势：
  ✓ 类型安全：编译时检查类型匹配
  ✓ 代码复用：一套代码支持多种类型组合
  ✓ 表达力强：能准确描述复杂的数据关系
  ✓ 性能好：避免装箱拆箱和类型转换

🚀 常见应用场景：
  • 键值对存储 (Map, Cache)
  • 数据转换 (Converter, Pipeline)
  • 结果包装 (Result, Option)
  • 事件系统 (EventBus)
  • 关系映射 (Graph, Network)
  • 函数式编程 (Functor, Monad)
  ''');
}

typedef AsyncRegister<T> = Future<T> Function();

class Locator {
  Locator._();

  static _Locator? _instance = _Locator();

  static _Locator get instance => _instance!;

  T get<T>() => _instance!.get<T>();

  void register<T>(T instance) => _instance!.register<T>(instance);

  Future<void> registerAsync<T>(AsyncRegister<T> asyncBuilder) =>
      _instance!.registerAsync<T>(asyncBuilder);

  void close() {
    _instance!.close();
    _instance = null;
  }
}

class _Locator implements Locator {
  final _services = <Type, dynamic>{};

  T get<T>() {
    if (_services.containsKey(T)) return _services[T]!;
    throw LocatorNotFoundException();
  }

  void register<T>(T instance) {
    _services.putIfAbsent(T, () => instance);
  }

  Future<void> registerAsync<T>(AsyncRegister<T> asyncBuilder) async {
    final instance = await asyncBuilder.call();
    _services.putIfAbsent(T, () => instance);
  }

  @override
  void close() {
    _services.clear();
  }
}

class LocatorNotFoundException implements Exception {}

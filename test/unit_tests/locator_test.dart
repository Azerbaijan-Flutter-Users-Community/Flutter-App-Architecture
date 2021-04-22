import 'package:architecture_example/locator.dart';
import 'package:flutter_test/flutter_test.dart';

class A {
  void runA() {}
}

class B {
  void runB() {}
}

void main() {
  setUp(() {
    Locator.instance;
  });
  test(
    'Locator Test',
    () async {
      final locator = Locator.instance;

      locator.register<A>(A());
      final a = locator.get<A>();
      a.runA();
      expect(a, isA<A>());

      await locator.registerAsync(() async {
        await Future.delayed(Duration(seconds: 2));
        return B();
      });
      final b = locator.get<B>();
      b.runB();
      expect(b, isA<B>());
    },
  );

  tearDown(() {
    Locator.instance.close();
  });
}

mixin WalkMixin {
  void walk() {}
}

mixin SwimMixin {
  void swim() {}
}

class APerson with WalkMixin, SwimMixin {}

void test() {
  final a = APerson();
  a.walk();
  a.swim();
}

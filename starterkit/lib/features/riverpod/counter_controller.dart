import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_controller.g.dart';

@Riverpod(name: "counterProvider", keepAlive: true)
class CounterController extends _$CounterController {
  Timer? _timer;

  @override
  int build() {
    return 0;
  }

  void increment() => state += 1;
  void incrementLong([bool isRun = false]) async {
    if (isRun) {
      _timer = Timer.periodic(
        Duration(milliseconds: 100),
        (timer) => increment(),
      );
    } else if (!isRun) {
      _timer?.cancel();
    }
  }

  void decrement() => state -= 1;
  Future<void> decrementLong([bool isRun = false]) async {
    if (isRun) {
      _timer = Timer.periodic(
        Duration(milliseconds: 100),
        (timer) => decrement(),
      );
    } else if (!isRun) {
      _timer?.cancel();
    }
  }
}

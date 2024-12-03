import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'example03controller.g.dart';

/// StreamProviderを使って値を取得する
@riverpod
Stream<int> example0301Controller(Ref ref) async* {
  int count = 1;
  while (count < 100) {
    await Future.delayed(const Duration(seconds: 1)); // 1秒ごと
    yield count++;
  }
}

@riverpod
class Example0302Controller extends _$Example0302Controller {
  static String title = 'データがある場合は [data]、ロード中 or エラーの場合は [orElse]';
  static String subTitle = 'Example0302 ref.watch(...).maybeWhen';

  @override
  FutureOr<int> build() async {
    await Future.delayed(const Duration(seconds: 1));
    return 0;
  }

  Future<void> increment() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await Future.delayed(const Duration(seconds: 1));
      return state.value! + 1;
    });
  }
}

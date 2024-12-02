import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'example01controller.g.dart';

/// Providerを使って値を取得する
@riverpod
String example0101Controller(Ref ref) {
  return 'value0101';
}

@riverpod
class Example0102Controller extends _$Example0102Controller {
  static String title = 'ロードが完了するまで待つ';
  static String subTitle = 'Example0102';

  @override
  FutureOr<String> build() async {
    // ロードしてることを認識するため1秒待つ
    await Future.delayed(const Duration(seconds: 1));
    return 'value0102';
  }
}

@riverpod
class Example0103Controller extends _$Example0103Controller {
  static String title = 'タップすると１度 [loading] に入り値が増える';
  static String subTitle = 'Example0103';

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

@riverpod
class Example0104Controller extends _$Example0104Controller {
  static String title = 'タップすると [loading] に入らず値が増える';
  static String subTitle = 'Example0104';

  @override
  FutureOr<int> build() async {
    await Future.delayed(const Duration(seconds: 1));
    return 0;
  }

  Future<void> increment() async {
    await update((value) async {
      await Future.delayed(const Duration(seconds: 1));
      return value + 1;
    });
  }
}

@riverpod
class Example0105Controller extends _$Example0105Controller {
  static String title = 'タップするとthrowされ [error] に入る';
  static String subTitle = 'Example0105';

  @override
  FutureOr<int> build() async {
    await Future.delayed(const Duration(seconds: 1));
    return 0;
  }

  Future<void> increment() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        await Future.delayed(const Duration(seconds: 1));
        throw Exception('sample error');
      },
    );
  }
}

@riverpod
class Example0106Controller extends _$Example0106Controller {
  static String title =
      'タップするとthrowされ [error] に入り、2回目タップするとproviderが破棄され、再度buildされる';
  static String subTitle = 'Example0106';

  @override
  FutureOr<int> build() async {
    await Future.delayed(const Duration(seconds: 1));
    return 0;
  }

  Future<void> increment() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        await Future.delayed(const Duration(seconds: 1));
        throw Exception('sample error');
      },
    );
  }

  void reset() {
    state = const AsyncLoading();
    ref.invalidateSelf();
  }
}

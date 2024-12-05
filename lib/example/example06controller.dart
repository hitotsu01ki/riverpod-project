import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'example06controller.g.dart';

@riverpod
class Example0601Repository extends _$Example0601Repository {
  @override
  FutureOr<int> build() {
    return Future.value(601);
  }

  FutureOr<int> fetch() {
    return Future.value(9999);
  }
}

@riverpod
class Example0601Controller extends _$Example0601Controller {
  static String title = 'タップすると１度 [loading] に入り値が増える';
  static String subTitle = 'Example0103 と同じ処理';

  @override
  Future<int> build() async {
    return ref.read(example0601RepositoryProvider.future);
  }

  Future<void> fetch() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return ref.read(example0601RepositoryProvider.notifier).fetch();
    });
  }
}

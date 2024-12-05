import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'example03controller.g.dart';

/// StreamProviderを使って値を取得する
@riverpod
Stream<int> example0301Controller(Ref ref) async* {
  int count = 1;
  while (count < 100) {
    await Future.delayed(const Duration(seconds: 1));
    yield count++;
  }
}

@riverpod
class Example0302Controller extends _$Example0302Controller {
  static String title = 'showModalBottomSheet 内でref.watchを使う';
  static String subTitle = 'Example0302 Consumer';

  @override
  FutureOr<String> build() async {
    return '';
  }

  void save({
    required String text,
  }) {
    update((state) => text);
  }
}

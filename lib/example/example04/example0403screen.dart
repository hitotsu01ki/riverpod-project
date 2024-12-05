import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// コード分割とリファクタリング の基礎を学ぶ
class Example0403Screen extends HookConsumerWidget {
  const Example0403Screen({super.key});

  static const title = 'コンストラクタに制限を加える';
  static const subTitle = 'Example0403 factory';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Factory で名前付きコンストラクタに制限をつけて分割した画面'),
      ),
      body: ListView(
        children: <Widget>[
          _Example0403Widget.fixed(),
          // 指定不可のためビルドエラー
          // _Example0403Widget(
          //   title: 'コンストラクタに制限を加える',
          //   subTitle: 'サブタイトル',
          // ),
          _Example0403Widget.titleOnly('_Example0403Widget.titleOnly'),
          // 空文字不可のため画面遷移時にエラー
          // _Example0403Widget.titleOnly(''),

          // 補足として同じ値を指定するとインスタンスは同じになる
          _Example0403Widget.titleOnly('_Example0403Widget.titleOnly'),
        ],
      ),
    );
  }
}

/// 補足として、factory に同じ値を指定すると
/// インスタンスは同じになります。
class _Example0403Widget extends HookConsumerWidget {
  /// [._] でコンストラクタに制限を加える
  const _Example0403Widget._({
    required this.title,
    required this.subTitle,
  });

  /// [title] と [subTitle] に固定値を設定する
  factory _Example0403Widget.fixed() {
    return const _Example0403Widget._(
      title: '特定のWidgetを用途別に分割する',
      subTitle: 'Example0403 factory',
    );
  }

  /// [title] が空文字の場合はエラー
  factory _Example0403Widget.titleOnly(String title) {
    if (title.isEmpty) {
      throw ArgumentError.notNull('title');
    }
    return _Example0403Widget._(
      title: title,
      subTitle: '',
    );
  }

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subTitle),
    );
  }
}

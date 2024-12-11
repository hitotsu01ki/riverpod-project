import 'package:flutter/material.dart';

/// コード分割とリファクタリング の基礎を学ぶ
class Example0402Screen extends StatelessWidget {
  const Example0402Screen({super.key});

  static const title = '特定のWidgetを用途別に分割する';
  static const subTitle = 'Example0402 named constractor';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('名前付きコンストラクタ で分割した画面'),
      ),
      body: ListView(
        children: const <Widget>[
          _Example0402Widget.fixed(),
          _Example0402Widget(
            title: '引数を指定してタイトルを表示する',
            subTitle: 'サブタイトル',
          ),
          _Example0402Widget.titleOnly('_Example0402Widget.titleOnly'),
        ],
      ),
    );
  }
}

class _Example0402Widget extends StatelessWidget {
  const _Example0402Widget({
    required this.title,
    required this.subTitle,
  });

  const _Example0402Widget.fixed()
      : this(
          title: '特定のWidgetを用途別に分割する',
          subTitle: 'Example0402 named constractor',
        );

  const _Example0402Widget.titleOnly(this.title) : subTitle = '';

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subTitle),
    );
  }
}

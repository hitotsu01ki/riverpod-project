import 'package:flutter/material.dart';

part 'example0401widget.dart';

/// コード分割とリファクタリング の基礎を学ぶ
class Example0401Screen extends StatelessWidget {
  const Example0401Screen({super.key});

  static const title = '特定のWidgetを別ファイルに分割する';
  static const subTitle = 'Example0401 part of';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('part of で分割した画面'),
      ),
      body: const _Example0401Widget(),
    );
  }
}

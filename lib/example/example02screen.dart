import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sample_202412/example/example02/example0201screen.dart';

/// hookの基礎を学ぶ
class Example02Screen extends HookConsumerWidget {
  const Example02Screen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Hookの基礎'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('画面遷移時に１度だけ実行する'),
            // subtitle: const Text(''),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const Example0201Screen(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

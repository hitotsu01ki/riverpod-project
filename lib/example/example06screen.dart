import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// テストの書き方 の基礎を学ぶ
class Example06Screen extends HookConsumerWidget {
  const Example06Screen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('テストの書き方 の基礎'),
      ),
      body: ListView(
        children: const <Widget>[
          ListTile(
            title: Text('Example0601Screen.title'),
            subtitle: Text('Example0601Screen.subTitle'),
            trailing: Icon(Icons.arrow_forward_ios),
            // onTap: () => Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (_) => const Example0601Screen(),
            //   ),
            // ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sample_202412/example/example05controller.dart';

/// [.vscode/launch.json] で定義した環境変数を取得する
/// [env/dart-define.dev.json] で定義した環境変数を取得する
class Example05Screen extends ConsumerWidget {
  const Example05Screen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('環境変数を取得する'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('Flavor: '),
            trailing: Text(ref.watch(flavorControllerProvider)),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content:
                      Text('Flavor: ${ref.watch(flavorControllerProvider)}'),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Dart Environment: '),
            subtitle: const Text('AAA_KEY'),
            trailing: Text(ref.watch(aaaKeyControllerProvider)),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content:
                      Text('AAA_KEY: ${ref.watch(aaaKeyControllerProvider)}'),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Dart Environment: '),
            subtitle: const Text('BBB_KEY'),
            trailing: Text(ref.watch(dartEnvControllerProvider).bbbKey),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      'Dart Environment: ${ref.watch(dartEnvControllerProvider).bbbKey}'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

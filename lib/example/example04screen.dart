import 'package:flutter/material.dart';
import 'package:sample_202412/example/example04/example0401screen.dart';
import 'package:sample_202412/example/example04/example0402screen.dart';
import 'package:sample_202412/example/example04/example0403screen.dart';

/// コード分割とリファクタリング の基礎を学ぶ
class Example04Screen extends StatelessWidget {
  const Example04Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('コード分割とリファクタリング の基礎'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text(Example0401Screen.title),
            subtitle: const Text(Example0401Screen.subTitle),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const Example0401Screen(),
              ),
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text(Example0402Screen.title),
            subtitle: const Text(Example0402Screen.subTitle),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const Example0402Screen(),
              ),
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text(Example0403Screen.title),
            subtitle: const Text(Example0403Screen.subTitle),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const Example0403Screen(),
              ),
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sample_202412/example/example02/example0201screen.dart';
import 'package:sample_202412/example/example02/example0202screen.dart';
import 'package:sample_202412/example/example02/example0203screen.dart';
import 'package:sample_202412/example/example02/example0204screen.dart';
import 'package:sample_202412/example/example02/example0205screen.dart';

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
            title: const Text(Example0201Screen.title),
            subtitle: const Text(Example0201Screen.subTitle),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const Example0201Screen(),
              ),
            ),
          ),
          ListTile(
            title: const Text(Example0202Screen.title),
            subtitle: const Text(Example0202Screen.subTitle),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const Example0202Screen(),
              ),
            ),
          ),
          ListTile(
            title: const Text(Example0203Screen.title),
            subtitle: const Text(Example0203Screen.subTitle),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const Example0203Screen(),
              ),
            ),
          ),
          ListTile(
            title: const Text(Example0204Screen.title),
            subtitle: const Text(Example0204Screen.subTitle),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const Example0204Screen(),
              ),
            ),
          ),
          ListTile(
            title: const Text(Example0205Screen.title),
            subtitle: const Text(Example0205Screen.subTitle),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const Example0205Screen(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

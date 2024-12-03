import 'package:flutter/material.dart';
import 'package:sample_202412/environment/environment_creen.dart';
import 'package:sample_202412/example/example01screen.dart';
import 'package:sample_202412/example/example02screen.dart';

class ExampleList extends StatelessWidget {
  const ExampleList({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Example List'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('riverpod の基礎を学ぶ'),
            subtitle: const Text('riverpod genelator を使って、Providerを自動生成する'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const Example01Screen(),
              ),
            ),
          ),
          ListTile(
            title: const Text('hook の基礎を学ぶ'),
            subtitle: const Text(
                'useEffect, useState, useMemoized, useCallback を使って、状態を管理する'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const Example02Screen(),
              ),
            ),
          ),
          ListTile(
            title: const Text('環境変数を取得する'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const EnvironmentScreen(),
              ),
            ),
          ),
          ListTile(
            title: const Text('Item 3'),
            onTap: () {
              // Add navigation here
            },
          ),
        ],
      ),
    );
  }
}

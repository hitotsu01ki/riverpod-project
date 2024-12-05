import 'package:flutter/material.dart';
import 'package:sample_202412/example/example01screen.dart';
import 'package:sample_202412/example/example02screen.dart';
import 'package:sample_202412/example/example03screen.dart';
import 'package:sample_202412/example/example04screen.dart';
import 'package:sample_202412/example/example05creen.dart';
import 'package:sample_202412/example/example06screen.dart';

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
            title: const Text('01riverpod の基礎を学ぶ'),
            subtitle: const Text('riverpod genelator を使って、Providerを自動生成する'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const Example01Screen(),
              ),
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('02hook の基礎を学ぶ'),
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
          const Divider(),
          ListTile(
            title: const Text('03Ref の基礎を学ぶ'),
            subtitle: const Text(
                'ref.watch, ref.read, ref.listen を使って、Providerを参照する'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const Example03Screen(),
              ),
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('04コード分割とリファクタリング の基礎を学ぶ'),
            subtitle: const Text('part or, named constractor などを使って、コードを分割する'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const Example04Screen(),
              ),
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('05環境変数 の基礎を学ぶ'),
            subtitle: const Text('package や dart-define を使って、環境変数を取得する'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const Example05Screen(),
              ),
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('06テストの書き方 の基礎を学ぶ'),
            subtitle:
                const Text('ProviderContainer, ProviderScope を使って、テストを書く'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const Example06Screen(),
              ),
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}

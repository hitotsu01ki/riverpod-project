import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sample_202412/example/example03/example0301screen.dart';
import 'package:sample_202412/example/example03controller.dart';

/// Ref の基礎を学ぶ
class Example03Screen extends ConsumerWidget {
  const Example03Screen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Ref の基礎'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text(Example0301Screen.title),
            subtitle: const Text(Example0301Screen.subTitle),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const Example0301Screen(),
              ),
            ),
          ),
          ref.watch(example0302ControllerProvider).maybeWhen(
                data: (value) => ListTile(
                  title: Text(Example0302Controller.title),
                  subtitle: Text(Example0302Controller.subTitle),
                  trailing: Text('$value'),
                  onTap: () => ref
                      .read(example0302ControllerProvider.notifier)
                      .increment(),
                ),
                orElse: () => ListTile(
                  title: Text(Example0302Controller.title),
                  subtitle: Text(Example0302Controller.subTitle),
                  trailing: const CircularProgressIndicator(),
                ),
              ),
        ],
      ),
    );
  }
}

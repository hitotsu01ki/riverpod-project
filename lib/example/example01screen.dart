import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sample_202412/example/example01controller.dart';

/// riverpodの基礎を学ぶ
class Example01Screen extends ConsumerWidget {
  const Example01Screen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Riverpodの基礎'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('Providerを使って値を取得する'),
            subtitle: const Text('Example0101'),
            trailing: Text(ref.watch(example0101ControllerProvider)),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      'Example0101: ${ref.watch(example0101ControllerProvider)}'),
                ),
              );
            },
          ),
          ref.watch(example0102ControllerProvider).maybeWhen(
                data: (value) => ListTile(
                  title: Text(Example0102Controller.title),
                  subtitle: Text(Example0102Controller.subTitle),
                  trailing: Text(value),
                  onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Example0102: $value'),
                    ),
                  ),
                ),
                orElse: () => ListTile(
                  title: Text(Example0102Controller.title),
                  subtitle: Text(Example0102Controller.subTitle),
                  trailing: const CircularProgressIndicator(),
                ),
              ),
          ref.watch(example0103ControllerProvider).maybeWhen(
                data: (value) => ListTile(
                  title: Text(Example0103Controller.title),
                  subtitle: Text(Example0103Controller.subTitle),
                  trailing: Text('$value'),
                  onTap: () => ref
                      .read(example0103ControllerProvider.notifier)
                      .increment(),
                ),
                orElse: () => ListTile(
                  title: Text(Example0103Controller.title),
                  subtitle: Text(Example0103Controller.subTitle),
                  trailing: const CircularProgressIndicator(),
                ),
              ),
          ref.watch(example0104ControllerProvider).maybeWhen(
                data: (value) => ListTile(
                  title: Text(Example0104Controller.title),
                  subtitle: Text(Example0104Controller.subTitle),
                  trailing: Text('$value'),
                  onTap: () => ref
                      .read(example0104ControllerProvider.notifier)
                      .increment(),
                ),
                orElse: () => ListTile(
                  title: Text(Example0104Controller.title),
                  subtitle: Text(Example0104Controller.subTitle),
                  trailing: const CircularProgressIndicator(),
                ),
              ),
          ref.watch(example0105ControllerProvider).when(
                data: (value) => ListTile(
                  title: Text(Example0105Controller.title),
                  subtitle: Text(Example0105Controller.subTitle),
                  trailing: Text('$value'),
                  onTap: () => ref
                      .read(example0105ControllerProvider.notifier)
                      .increment(),
                ),
                error: (error, _) => ListTile(
                  title: Text(Example0105Controller.title),
                  subtitle: Text(Example0105Controller.subTitle),
                  trailing:
                      Text('$error', style: const TextStyle(color: Colors.red)),
                ),
                loading: () => ListTile(
                  title: Text(Example0105Controller.title),
                  subtitle: Text(Example0105Controller.subTitle),
                  trailing: const CircularProgressIndicator(),
                ),
              ),
          ref.watch(example0106ControllerProvider).when(
                data: (value) => ListTile(
                  title: Text(Example0106Controller.title),
                  subtitle: Text(Example0106Controller.subTitle),
                  trailing: Text('$value'),
                  onTap: () => ref
                      .read(example0106ControllerProvider.notifier)
                      .increment(),
                ),
                error: (error, _) => ListTile(
                  title: Text(Example0106Controller.title),
                  subtitle: Text(Example0106Controller.subTitle),
                  trailing:
                      Text('$error', style: const TextStyle(color: Colors.red)),
                  onTap: () =>
                      ref.read(example0106ControllerProvider.notifier).reset(),
                ),
                loading: () => ListTile(
                  title: Text(Example0106Controller.title),
                  subtitle: Text(Example0106Controller.subTitle),
                  trailing: const CircularProgressIndicator(),
                ),
              ),
        ],
      ),
    );
  }
}

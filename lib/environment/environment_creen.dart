import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sample_202412/environment/environment_controller.dart';

/// AutoDisposeAsyncNotifierProvider を使って、非同期処理を行う。
class EnvironmentScreen extends ConsumerWidget {
  const EnvironmentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packageInfoAsync = ref.watch(packageInfoControllerProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('環境変数を取得する'),
      ),
      body: ListView(
        children: <Widget>[
          packageInfoAsync.when(
            data: (packageInfo) => ListTile(
              title: const Text('Package name:'),
              trailing: Text(packageInfo.packageName),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Package name: ${packageInfo.packageName}'),
                  ),
                );
              },
            ),
            error: (error, _) => ListTile(
              title: const Text('Package name:'),
              trailing: Text('Error: $error'),
            ),
            loading: () => const ListTile(
              title: Text('Package name:'),
              trailing: Text('Loading...'),
            ),
          ),
          packageInfoAsync.maybeWhen(
            data: (packageInfo) => ListTile(
              title: const Text('Version:'),
              trailing: Text(packageInfo.version),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Version: ${packageInfo.version}'),
                  ),
                );
              },
            ),
            orElse: () => const ListTile(
              title: Text('Version:'),
              trailing: Text('Loading or Error'),
            ),
          ),
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

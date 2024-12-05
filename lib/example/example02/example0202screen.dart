import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Example0202Screen extends HookConsumerWidget {
  const Example0202Screen({super.key});

  static const title = '画面内で値を保持する';
  static const subTitle = 'Example0202 useState';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = useState<int>(0);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          count.value++;
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(title),
            const Text(subTitle),
            Text('count = ${count.value}'),
          ],
        ),
      ),
    );
  }
}

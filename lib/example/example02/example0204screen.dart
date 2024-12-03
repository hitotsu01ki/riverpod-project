import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Example0204Screen extends HookConsumerWidget {
  const Example0204Screen({super.key});

  static const title = '画面内で関数を保持する';
  static const subTitle = 'Example0204 useMemoized + useState';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = useState<int>(0);
    final memo1 = useMemoized(() => count.value * 2);
    final memo2 = useMemoized(() => count.value * 2, [count.value]);

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
            Text('memo1 = $memo1 (計算は１度だけ 0 * 2 = 0)'),
            Text('memo2 = $memo2 (count.value が更新されると再計算)'),
          ],
        ),
      ),
    );
  }
}

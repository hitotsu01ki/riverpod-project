import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Example0205Screen extends HookConsumerWidget {
  const Example0205Screen({super.key});

  static const title = '画面内でコールバックを保持する';
  static const subTitle = 'Example0205 useCallback';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = useState<int>(0);
    final plus5 = useCallback(() => count.value = count.value + 5);
    final popup = useCallback(
      () {
        if (context.mounted) {
          return showAdaptiveDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text(title),
                content: Text('count = ${count.value}'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('とじる'),
                  ),
                ],
              );
            },
          );
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: popup,
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(title),
            const Text(subTitle),
            Text('count = ${count.value}'),
            ElevatedButton(
              onPressed: plus5,
              child: const Text('plus5'),
            ),
          ],
        ),
      ),
    );
  }
}

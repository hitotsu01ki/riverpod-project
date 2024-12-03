import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Example0203Screen extends HookConsumerWidget {
  const Example0203Screen({super.key});

  static const title = '画面遷移時に１度だけ実行し、特定の値が更新した場合も実行する';
  static const subTitle = 'Example0203 useEffect + useState';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = useState<int>(0);

    useEffect(
      () {
        Future.microtask(
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

        return null;
      },
      // [count.value] が更新された場合に再実行する
      [count.value],
    );

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

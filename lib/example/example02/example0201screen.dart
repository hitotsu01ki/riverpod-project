import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Example0201Screen extends HookConsumerWidget {
  const Example0201Screen({super.key});

  static const title = '画面遷移時に１度だけ実行する';
  static const subTitle = 'Example0201 useEffect';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    content: const Text(subTitle),
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
      const [],
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(title),
      ),
      body: const Center(
        child: Column(
          children: [
            Text(title),
            Text(subTitle),
          ],
        ),
      ),
    );
  }
}

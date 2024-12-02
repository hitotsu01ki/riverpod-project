import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Example0201Screen extends HookConsumerWidget {
  const Example0201Screen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      Future.microtask(
        () {
          final savedContext = context;
          if (savedContext.mounted) {
            return showAdaptiveDialog(
              context: savedContext,
              builder: (context) {
                return AlertDialog(
                  title: const Text('画面遷移時に１度だけ実行する'),
                  content: const Text('Example0201'),
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
    }, const []);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('useEffectの基礎'),
      ),
      body: const Center(
        child: Column(
          children: [
            Text('画面遷移時に１度だけ実行する'),
            Text('Example0201'),
          ],
        ),
      ),
    );
  }
}

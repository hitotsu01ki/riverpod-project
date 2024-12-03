import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sample_202412/example/example03controller.dart';

class Example0301Screen extends HookConsumerWidget {
  const Example0301Screen({super.key});

  static const title = '1秒毎に増加する count が 3 で割り切れるとスナックバーで通知';
  static const subTitle = 'Example0301 ref.listen';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      example0301ControllerProvider,
      (previous, next) {
        if (next.value! % 3 == 0) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('count を 3 で割れました (${next.value})'),
              duration: const Duration(seconds: 1),
            ),
          );
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(title),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(title),
            const Text(subTitle),
            ref.watch(example0301ControllerProvider).maybeWhen(
                  data: (count) => Text('count = $count'),
                  orElse: () => const CircularProgressIndicator(),
                ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sample_202412/example/example03controller.dart';

class Example0302Screen extends HookConsumerWidget {
  const Example0302Screen({super.key});

  static const title = 'showModalBottomSheet 内でref.watchを使う';
  static const subTitle = 'Example0302 Consumer';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = useTextEditingController();
    final modal = useCallback(
      () {
        return showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (sheetContext) {
            return FractionallySizedBox(
              heightFactor: 0.7,
              child: Column(
                children: [
                  const ListTile(title: Text('TextEditingController')),
                  TextField(controller: textController),
                  ListTile(
                    title: const Text('TextEditingController から値を取得'),
                    subtitle: const Text('画面を開き直さないと値を表示できない'),
                    trailing: Text(textController.text),
                  ),
                  ListTile(
                    title: const Text('Example0302Controller から値を取得'),
                    subtitle: const Text('保存ボタンを押すと値が更新される'),
                    trailing: Consumer(
                      builder: (consumerContext, consumerRef, _) {
                        return consumerRef
                            .watch(example0302ControllerProvider)
                            .maybeWhen(
                              data: (value) => Text(value),
                              orElse: () => const SizedBox(),
                            );
                      },
                    ),
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () => Navigator.pop(sheetContext),
                        child: const Text('閉じる'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          ref
                              .read(example0302ControllerProvider.notifier)
                              .save(text: textController.text);
                        },
                        child: const Text('保存する'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
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
            const ListTile(
              title: Text(title),
              subtitle: Text(subTitle),
            ),
            ListTile(
              title: const Text('ボトムシートを表示'),
              trailing:
                  Text('${ref.watch(example0302ControllerProvider).value}'),
              onTap: modal,
            ),
          ],
        ),
      ),
    );
  }
}

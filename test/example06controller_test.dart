import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sample_202412/example/example06controller.dart';

void main() {
  group('Example0601Controller Tests', () {
    test('Initial state is AsyncLoading', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(example0601ControllerProvider.notifier);
      expect(notifier.state, const AsyncLoading<int>());
    });

    test('Build function works correctly', () async {
      final container = ProviderContainer();

      addTearDown(container.dispose);

      final future = await container.read(example0601ControllerProvider.future);

      expect(future, 601);
    });

    test('Fetch function works correctly', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(example0601ControllerProvider.notifier);

      await notifier.fetch();

      expect(notifier.state, const AsyncData<int>(9999));
    });
  });
}

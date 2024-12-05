import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'example05controller.g.dart';

@riverpod
String flavorController(Ref ref) {
  return const String.fromEnvironment('FLAVOR');
}

@riverpod
String aaaKeyController(Ref ref) {
  return const String.fromEnvironment('AAA_KEY');
}

@riverpod
DartEnv dartEnvController(Ref ref) {
  return DartEnv(
    aaaKey: const String.fromEnvironment('AAA_KEY'),
    bbbKey: const String.fromEnvironment('BBB_KEY'),
    cccKey: const String.fromEnvironment('CCC_KEY'),
  );
}

class DartEnv {
  final String aaaKey;
  final String bbbKey;
  final String cccKey;
  DartEnv({
    required this.aaaKey,
    required this.bbbKey,
    required this.cccKey,
  });
}

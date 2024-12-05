part of 'example0401screen.dart';

/// コード分割とリファクタリング の基礎を学ぶ
class _Example0401Widget extends StatelessWidget {
  const _Example0401Widget();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          Text('part of で分割した画面'),
          Text('Example0401Widget'),
          Text('part of のファイルはプライベートにできる'),
          Text('ほかのファイルから参照できない'),
        ],
      ),
    );
  }
}

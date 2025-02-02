import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monopoly/providers/dados_provider.dart';
import 'package:monopoly/widgets/centro_tabuleiro/circle_avatar_with_border.dart';

class ColunaDados extends ConsumerWidget {
  const ColunaDados({
    required this.indiceColuna,
    super.key,
  });

  final int indiceColuna;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dadoState = ref.watch(dadosProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(6, (index) {
        final valorDado = index + 1;
        final estaSelecionado =
            (indiceColuna == 0 && dadoState.dado1 == valorDado) ||
                (indiceColuna == 1 && dadoState.dado2 == valorDado);

        return Padding(
          padding: const EdgeInsets.all(2),
          child: InkWell(
            onTap: () => ref
                .read(dadosProvider.notifier)
                .selecionarDado(indiceColuna, valorDado),
            child: CircleAvatarWithBorder(
              radius: 12.5,
              borderWidth: 1,
              borderColor: Colors.black,
              backgroundColor: estaSelecionado
                  ? Theme.of(context).highlightColor
                  : Theme.of(context).dialogBackgroundColor,
              child: Text('${index + 1}'),
            ),
          ),
        );
      }),
    );
  }
}

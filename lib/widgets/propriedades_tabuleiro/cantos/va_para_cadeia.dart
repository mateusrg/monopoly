import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monopoly/models/jogador.dart';
import 'package:monopoly/models/propriedade.dart';
import 'package:monopoly/providers/jogadores_provider.dart';

class VaParaACadeia extends ConsumerWidget {
  const VaParaACadeia({
    super.key,
    required this.largura,
    required this.propriedade,
  });

  final double largura;
  final Propriedade propriedade;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Jogador> jogadoresNestaPropriedade = ref
        .watch(jogadoresProvider)
        .where((jogador) => jogador.idPosicaoJogador == propriedade.id)
        .toList();

    Future.microtask(() {
      final JogadoresNotifier jogadoresNotifier =
          ref.read(jogadoresProvider.notifier);

      for (final Jogador jogador in jogadoresNestaPropriedade) {
        final int index = ref
            .read(jogadoresProvider)
            .indexWhere((j) => j.nome == jogador.nome);

        if (index != -1) {
          jogadoresNotifier.prender(index);
        }
      }
    });

    return Container(
      width: largura * 1.5,
      decoration: BoxDecoration(
        border: Border.all(width: 1),
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          color: const Color.fromARGB(255, 235, 249, 213),
          alignment: Alignment.center,
          child: Image.asset('assets/images/va_para_cadeia.png'),
        ),
      ),
    );
  }
}

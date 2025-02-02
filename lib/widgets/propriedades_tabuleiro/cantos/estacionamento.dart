import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monopoly/models/jogador.dart';
import 'package:monopoly/models/propriedade.dart';
import 'package:monopoly/providers/jogadores_provider.dart';

class Estacionamento extends ConsumerWidget {
  const Estacionamento({
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

    final double padding = jogadoresNestaPropriedade.length < 5
        ? largura * 1.5 * (1 - 0.85)
        : largura * 1.5 * (1 - 0.95);

    return Container(
      width: largura * 1.5,
      decoration: BoxDecoration(
        border: Border.all(width: 1),
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          color: const Color.fromARGB(255, 235, 249, 213),
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Image.asset('assets/images/estacionamento.png'),
                ),
                if (jogadoresNestaPropriedade.isNotEmpty)
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(padding),
                        child: _buildJogadoresGrid(jogadoresNestaPropriedade),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildJogadoresGrid(List<Jogador> jogadores) {
    final double padding = jogadores.length < 5
        ? largura * 1.5 * (1 - 0.85)
        : largura * 1.5 * (1 - 0.95);
    final double larguraDisponivel = largura * 1.5 - 2 * padding - 2;
    switch (jogadores.length) {
      case 2:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(2, (index) {
            return Image.asset(
              'assets/peoes/peao_${jogadores[index].peaoIndex}.png',
              width: larguraDisponivel / 2,
            );
          }),
        );
      case 3:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: List.generate(2, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.5),
                  child: Image.asset(
                    'assets/peoes/peao_${jogadores[index].peaoIndex}.png',
                    width: (larguraDisponivel - 2) / 2,
                  ),
                );
              }),
            ),
            Image.asset(
              'assets/peoes/peao_${jogadores[2].peaoIndex}.png',
              width: larguraDisponivel / 2,
            ),
          ],
        );
      case 4:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(2, (i) {
            return Row(
              children: List.generate(2, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.5),
                  child: Image.asset(
                    'assets/peoes/peao_${jogadores[i * 2 + index].peaoIndex}.png',
                    width: (larguraDisponivel - 2) / 2,
                  ),
                );
              }),
            );
          }),
        );
      case 5:
        return IntrinsicWidth(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(2, (i) {
                return Row(
                  children: List.generate(2, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.5),
                      child: Image.asset(
                        'assets/peoes/peao_${jogadores[i * 2 + index].peaoIndex}.png',
                        width: larguraDisponivel / 3 - 2,
                      ),
                    );
                  }),
                );
              }),
              Image.asset(
                'assets/peoes/peao_${jogadores[4].peaoIndex}.png',
                width: larguraDisponivel / 3 - 2,
              ),
            ],
          ),
        );
      case 6:
        return IntrinsicWidth(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (i) {
              return Row(
                children: List.generate(2, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.5),
                    child: Image.asset(
                      'assets/peoes/peao_${jogadores[i * 2 + index].peaoIndex}.png',
                      width: larguraDisponivel / 3 - 2,
                    ),
                  );
                }),
              );
            }),
          ),
        );
      case 7:
        return IntrinsicWidth(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: List.generate(2, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.1),
                    child: Image.asset(
                      'assets/peoes/peao_${jogadores[index].peaoIndex}.png',
                      width: (larguraDisponivel / 3) - 2,
                    ),
                  );
                }),
              ),
              Row(
                children: List.generate(3, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.1),
                    child: Image.asset(
                      'assets/peoes/peao_${jogadores[2 + index].peaoIndex}.png',
                      width: (larguraDisponivel / 3) - 2,
                    ),
                  );
                }),
              ),
              Row(
                children: List.generate(2, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.1),
                    child: Image.asset(
                      'assets/peoes/peao_${jogadores[5 + index].peaoIndex}.png',
                      width: (larguraDisponivel / 3) - 2,
                    ),
                  );
                }),
              ),
            ],
          ),
        );
      case 8:
        return Row(
          children: [
            Column(
              children: List.generate(3, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.1),
                  child: Image.asset(
                    'assets/peoes/peao_${jogadores[index * 3].peaoIndex}.png',
                    width: (larguraDisponivel / 3) - 2,
                  ),
                );
              }),
            ),
            Column(
              children: List.generate(3, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.1),
                  child: Image.asset(
                    'assets/peoes/peao_${jogadores[index * 3 + 1].peaoIndex}.png',
                    width: (larguraDisponivel / 3) - 2,
                  ),
                );
              }),
            ),
            IntrinsicHeight(
              child: Column(
                children: List.generate(2, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.1),
                    child: Image.asset(
                      'assets/peoes/peao_${jogadores[index * 3 + 2].peaoIndex}.png',
                      width: (larguraDisponivel / 3) - 2,
                    ),
                  );
                }),
              ),
            ),
          ],
        );
      default:
        return Center(
          child: Image.asset('assets/peoes/peao_${jogadores[0].peaoIndex}.png'),
        );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monopoly/models/jogador.dart';
import 'package:monopoly/models/propriedade.dart';
import 'package:monopoly/providers/jogadores_provider.dart';

enum TipoCompanhia {
  eletrica,
  agua,
}

class Companhia extends ConsumerWidget {
  const Companhia({
    super.key,
    required this.largura,
    required this.propriedade,
    required this.tipo,
  });

  final double largura;
  final Propriedade propriedade;
  final TipoCompanhia tipo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Jogador> jogadoresNestaPropriedade = ref
        .watch(jogadoresProvider)
        .where((jogador) => jogador.idPosicaoJogador == propriedade.id)
        .toList();

    final double padding = largura * (1 - 0.95);

    return Stack(
      children: [
        Container(
          width: largura,
          decoration: BoxDecoration(
            border: Border.all(width: 1),
          ),
          child: AspectRatio(
            aspectRatio: 2 / 3,
            child: Container(
              color: const Color.fromARGB(255, 235, 249, 213),
              child: Container(
                alignment: Alignment.center,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 1, vertical: 6),
                  child: tipo == TipoCompanhia.eletrica
                      ? Image.asset('assets/images/energia.png')
                      : Image.asset('assets/images/agua.png'),
                ),
              ),
            ),
          ),
        ),
        if (jogadoresNestaPropriedade.isNotEmpty)
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: _buildJogadoresGrid(
                  jogadoresNestaPropriedade,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildJogadoresGrid(List<Jogador> jogadores) {
    final double padding = largura * (1 - 0.95);
    final double larguraDisponivel = largura - 2 * padding - 2;
    switch (jogadores.length) {
      case 2:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/peoes/peao_${jogadores[0].peaoIndex}.png',
              width: larguraDisponivel / 1.5,
            ),
            const SizedBox(height: 2),
            Image.asset(
              'assets/peoes/peao_${jogadores[1].peaoIndex}.png',
              width: larguraDisponivel / 1.5,
            ),
          ],
        );
      case 3:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  children: List.generate(2, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.5),
                      child: Image.asset(
                        'assets/peoes/peao_${jogadores[index].peaoIndex}.png',
                        width: larguraDisponivel / 2,
                      ),
                    );
                  }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/peoes/peao_${jogadores[2].peaoIndex}.png',
                      width: larguraDisponivel / 2,
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      case 4:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: List.generate(2, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.5),
                  child: Image.asset(
                    'assets/peoes/peao_${jogadores[index].peaoIndex}.png',
                    width: larguraDisponivel / 2,
                  ),
                );
              }),
            ),
            Row(
              children: List.generate(2, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.5),
                  child: Image.asset(
                    'assets/peoes/peao_${jogadores[index + 2].peaoIndex}.png',
                    width: larguraDisponivel / 2,
                  ),
                );
              }),
            ),
          ],
        );
      case 5:
        return IntrinsicWidth(
          child: Column(
            children: [
              for (int i = 0; i < 2; i++) ...[
                Row(
                  children: List.generate(2, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.5),
                      child: Image.asset(
                        'assets/peoes/peao_${jogadores[i * 2 + index].peaoIndex}.png',
                        width: larguraDisponivel / 2,
                      ),
                    );
                  }),
                ),
                const Spacer(),
              ],
              Image.asset(
                'assets/peoes/peao_${jogadores[4].peaoIndex}.png',
                width: larguraDisponivel / 2,
              ),
            ],
          ),
        );
      case 6:
        return IntrinsicWidth(
          child: Column(children: [
            for (int i = 0; i < 3; i++) ...[
              Row(
                children: List.generate(2, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.5),
                    child: Image.asset(
                      'assets/peoes/peao_${jogadores[i * 2 + index].peaoIndex}.png',
                      width: larguraDisponivel / 2,
                    ),
                  );
                }),
              ),
              if (i < 2) const Spacer(),
            ],
          ]),
        );
      case 7:
        return IntrinsicWidth(
          child: Column(children: [
            for (int i = 0; i < 3; i++) ...[
              Row(
                children: List.generate(2, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.5),
                    child: Image.asset(
                      'assets/peoes/peao_${jogadores[i * 2 + index].peaoIndex}.png',
                      width: larguraDisponivel / 3,
                    ),
                  );
                }),
              ),
              const Spacer(),
            ],
            Image.asset(
              'assets/peoes/peao_${jogadores[6].peaoIndex}.png',
              width: larguraDisponivel / 3,
            ),
          ]),
        );
      case 8:
        return IntrinsicWidth(
          child: Column(children: [
            for (int i = 0; i < 4; i++) ...[
              Row(
                children: List.generate(2, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.5),
                    child: Image.asset(
                      'assets/peoes/peao_${jogadores[i * 2 + index].peaoIndex}.png',
                      width: larguraDisponivel / 3,
                    ),
                  );
                }),
              ),
              if (i < 3) const Spacer(),
            ],
          ]),
        );
      default:
        return Center(
          child: Image.asset('assets/peoes/peao_${jogadores[0].peaoIndex}.png'),
        );
    }
  }
}

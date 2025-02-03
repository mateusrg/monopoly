import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monopoly/models/jogador.dart';
import 'package:monopoly/models/propriedade.dart';
import 'package:monopoly/providers/jogadores_provider.dart';

class Cadeia extends ConsumerWidget {
  const Cadeia({
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

    final List<Jogador> jogadoresPresos =
        jogadoresNestaPropriedade.where((jogador) => jogador.preso).toList();

    final List<Jogador> jogadoresVisitantes =
        jogadoresNestaPropriedade.where((jogador) => !jogador.preso).toList();

    final double larguraCadeia = largura * 1.1;
    final double padding = larguraCadeia * 0.05;

    return Container(
      width: largura * 1.5,
      decoration: BoxDecoration(
        border: Border.all(width: 1),
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: Stack(
          children: [
            Container(
              color: const Color.fromARGB(255, 235, 249, 213),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                height: larguraCadeia,
                width: larguraCadeia,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.orange,
                  border: Border(
                    left: BorderSide(width: 1),
                    bottom: BorderSide(width: 1),
                  ),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Image.asset('assets/images/cadeia.png'),
                    ),
                    if (jogadoresPresos.isNotEmpty)
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.all(padding),
                            child: _buildJogadoresPresosGrid(jogadoresPresos),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                height: larguraCadeia,
                width: largura * 1.5 - larguraCadeia - 2,
                alignment: Alignment.centerLeft,
                child: const RotatedBox(
                  quarterTurns: 1,
                  child: AutoSizeText(
                    'Apenas',
                    minFontSize: 5,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: largura * 1.5 - larguraCadeia - 2,
                width: larguraCadeia,
                alignment: Alignment.bottomCenter,
                child: const AutoSizeText(
                  'Visitante',
                  minFontSize: 5,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            if (jogadoresVisitantes.isNotEmpty)
              _buildJogadoresVisitantesGrid(jogadoresVisitantes),
          ],
        ),
      ),
    );
  }

  _buildJogadoresPresosGrid(List<Jogador> jogadores) {
    final double larguraDisponivel = largura * 1.1;
    switch (jogadores.length) {
      case 2:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(2, (index) {
            return Image.asset(
              'assets/peoes/peao_${jogadores[index].peaoIndex}.png',
              width: (larguraDisponivel - 7) / 2,
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
                    width: (larguraDisponivel - 7) / 2,
                  ),
                );
              }),
            ),
            Image.asset(
              'assets/peoes/peao_${jogadores[2].peaoIndex}.png',
              width: (larguraDisponivel - 7) / 2,
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
                    width: (larguraDisponivel - 7) / 2,
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

  _buildJogadoresVisitantesGrid(List<Jogador> jogadores) {
    double larguraVisitantes = largura * 0.4 - 2;
    switch (jogadores.length) {
      case 2:
        return Positioned(
          left: 0,
          bottom: 0,
          child: Column(
            children: List.generate(
              2,
              (index) => Image.asset(
                'assets/peoes/peao_${jogadores[index].peaoIndex}.png',
                width: larguraVisitantes,
              ),
            ),
          ),
        );
      case 3:
        return Positioned(
          bottom: 0,
          left: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/peoes/peao_${jogadores[0].peaoIndex}.png',
                    width: larguraVisitantes,
                  ),
                  SizedBox(width: larguraVisitantes),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/peoes/peao_${jogadores[1].peaoIndex}.png',
                    width: larguraVisitantes,
                  ),
                  Image.asset(
                    'assets/peoes/peao_${jogadores[2].peaoIndex}.png',
                    width: larguraVisitantes,
                  ),
                ],
              ),
            ],
          ),
        );
      case 4:
        return Positioned(
          bottom: 0,
          left: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/peoes/peao_${jogadores[0].peaoIndex}.png',
                    width: larguraVisitantes,
                  ),
                  SizedBox(width: larguraVisitantes),
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/peoes/peao_${jogadores[1].peaoIndex}.png',
                    width: larguraVisitantes,
                  ),
                  SizedBox(width: larguraVisitantes),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/peoes/peao_${jogadores[2].peaoIndex}.png',
                    width: larguraVisitantes,
                  ),
                  Image.asset(
                    'assets/peoes/peao_${jogadores[3].peaoIndex}.png',
                    width: larguraVisitantes,
                  ),
                ],
              ),
            ],
          ),
        );
      case 5:
        return Positioned(
          bottom: 0,
          left: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/peoes/peao_${jogadores[0].peaoIndex}.png',
                    width: larguraVisitantes,
                  ),
                  SizedBox(width: larguraVisitantes),
                  SizedBox(width: larguraVisitantes),
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/peoes/peao_${jogadores[1].peaoIndex}.png',
                    width: larguraVisitantes,
                  ),
                  SizedBox(width: larguraVisitantes),
                  SizedBox(width: larguraVisitantes),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/peoes/peao_${jogadores[2].peaoIndex}.png',
                    width: larguraVisitantes,
                  ),
                  Image.asset(
                    'assets/peoes/peao_${jogadores[3].peaoIndex}.png',
                    width: larguraVisitantes,
                  ),
                  Image.asset(
                    'assets/peoes/peao_${jogadores[4].peaoIndex}.png',
                    width: larguraVisitantes,
                  ),
                ],
              ),
            ],
          ),
        );
      case 6:
        return Positioned(
          bottom: 0,
          left: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/peoes/peao_${jogadores[0].peaoIndex}.png',
                    width: larguraVisitantes,
                  ),
                  SizedBox(width: larguraVisitantes),
                  SizedBox(width: larguraVisitantes),
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/peoes/peao_${jogadores[1].peaoIndex}.png',
                    width: larguraVisitantes,
                  ),
                  SizedBox(width: larguraVisitantes),
                  SizedBox(width: larguraVisitantes),
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/peoes/peao_${jogadores[2].peaoIndex}.png',
                    width: larguraVisitantes,
                  ),
                  SizedBox(width: larguraVisitantes),
                  SizedBox(width: larguraVisitantes),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/peoes/peao_${jogadores[3].peaoIndex}.png',
                    width: larguraVisitantes,
                  ),
                  Image.asset(
                    'assets/peoes/peao_${jogadores[4].peaoIndex}.png',
                    width: larguraVisitantes,
                  ),
                  Image.asset(
                    'assets/peoes/peao_${jogadores[5].peaoIndex}.png',
                    width: larguraVisitantes,
                  ),
                ],
              ),
            ],
          ),
        );
      case 7:
        return Positioned(
          bottom: 0,
          left: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/peoes/peao_${jogadores[0].peaoIndex}.png',
                    width: larguraVisitantes,
                  ),
                  SizedBox(width: larguraVisitantes),
                  SizedBox(width: larguraVisitantes),
                  SizedBox(width: larguraVisitantes),
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/peoes/peao_${jogadores[1].peaoIndex}.png',
                    width: larguraVisitantes,
                  ),
                  SizedBox(width: larguraVisitantes),
                  SizedBox(width: larguraVisitantes),
                  SizedBox(width: larguraVisitantes),
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/peoes/peao_${jogadores[2].peaoIndex}.png',
                    width: larguraVisitantes,
                  ),
                  SizedBox(width: larguraVisitantes),
                  SizedBox(width: larguraVisitantes),
                  SizedBox(width: larguraVisitantes),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/peoes/peao_${jogadores[3].peaoIndex}.png',
                    width: larguraVisitantes,
                  ),
                  Image.asset(
                    'assets/peoes/peao_${jogadores[4].peaoIndex}.png',
                    width: larguraVisitantes,
                  ),
                  Image.asset(
                    'assets/peoes/peao_${jogadores[5].peaoIndex}.png',
                    width: larguraVisitantes,
                  ),
                  Image.asset(
                    'assets/peoes/peao_${jogadores[6].peaoIndex}.png',
                    width: larguraVisitantes,
                  ),
                ],
              ),
            ],
          ),
        );
      case 8:
        larguraVisitantes = largura * 0.35 - 2;
        return Positioned(
          bottom: 0,
          left: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/peoes/peao_${jogadores[0].peaoIndex}.png',
                    width: larguraVisitantes,
                  ),
                  SizedBox(width: larguraVisitantes),
                  SizedBox(width: larguraVisitantes),
                  SizedBox(width: larguraVisitantes),
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/peoes/peao_${jogadores[1].peaoIndex}.png',
                    width: larguraVisitantes,
                  ),
                  SizedBox(width: larguraVisitantes),
                  SizedBox(width: larguraVisitantes),
                  SizedBox(width: larguraVisitantes),
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/peoes/peao_${jogadores[2].peaoIndex}.png',
                    width: larguraVisitantes,
                  ),
                  SizedBox(width: larguraVisitantes),
                  SizedBox(width: larguraVisitantes),
                  SizedBox(width: larguraVisitantes),
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/peoes/peao_${jogadores[3].peaoIndex}.png',
                    width: larguraVisitantes,
                  ),
                  SizedBox(width: larguraVisitantes),
                  SizedBox(width: larguraVisitantes),
                  SizedBox(width: larguraVisitantes),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/peoes/peao_${jogadores[4].peaoIndex}.png',
                    width: larguraVisitantes,
                  ),
                  Image.asset(
                    'assets/peoes/peao_${jogadores[5].peaoIndex}.png',
                    width: larguraVisitantes,
                  ),
                  Image.asset(
                    'assets/peoes/peao_${jogadores[6].peaoIndex}.png',
                    width: larguraVisitantes,
                  ),
                  Image.asset(
                    'assets/peoes/peao_${jogadores[7].peaoIndex}.png',
                    width: larguraVisitantes,
                  ),
                ],
              ),
            ],
          ),
        );
      default:
        return Positioned(
          left: 0,
          bottom: 0,
          child: Image.asset(
            'assets/peoes/peao_${jogadores[0].peaoIndex}.png',
            width: larguraVisitantes,
          ),
        );
    }
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monopoly/models/jogador.dart';
import 'package:monopoly/providers/jogadores_provider.dart';
import 'package:monopoly/providers/turno_provider.dart';
import 'package:monopoly/widgets/tabuleiro.dart';

class PartidaPage extends ConsumerWidget {
  const PartidaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jogadores = ref.watch(jogadoresProvider);
    final turnoAtual = ref.watch(turnoProvider);
    final jogadorAtual = jogadores[turnoAtual];

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Vez de ${jogadorAtual.nome}'),
        ),
      ),
      body: Column(
        children: [
          const Tabuleiro(),
          Expanded(
            child: _buildJogadoresLayout(jogadores),
          ),
        ],
      ),
    );
  }

  Widget _buildJogadoresLayout(List<Jogador> jogadores) {
    if (jogadores.length <= 2) {
      return ListView.builder(
        itemCount: jogadores.length,
        itemBuilder: (context, index) {
          final jogador = jogadores[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: _buildJogadorItem(jogador, jogadores.length),
            ),
          );
        },
      );
    } else {
      return GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _calcularColunas(jogadores.length),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: _calcularAspectRatio(jogadores.length),
        ),
        itemCount: jogadores.length,
        itemBuilder: (context, index) {
          final jogador = jogadores[index];
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: _buildJogadorItem(jogador, jogadores.length),
            ),
          );
        },
      );
    }
  }

  Widget _buildJogadorItem(Jogador jogador, quantidadeJogadores) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/peoes/peao_${jogador.peaoIndex}.png',
          width: quantidadeJogadores <= 6 ? 30 : 20,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                jogador.nome,
                minFontSize: 5,
                maxLines: 1,
              ),
              AutoSizeText(
                '\$${jogador.dinheiro}',
                minFontSize: 5,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ],
    );
  }

  int _calcularColunas(int quantidadeJogadores) {
    if (quantidadeJogadores <= 4) {
      return 2;
    } else if (quantidadeJogadores <= 6) {
      return 3;
    } else {
      return 4;
    }
  }

  double _calcularAspectRatio(int quantidadeJogadores) {
    if (quantidadeJogadores <= 4) {
      return 2.5;
    } else if (quantidadeJogadores <= 6) {
      return 1.5;
    } else {
      return 1.2;
    }
  }
}

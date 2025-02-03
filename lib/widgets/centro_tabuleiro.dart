import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monopoly/data/propriedades.dart';
import 'package:monopoly/models/jogador.dart';
import 'package:monopoly/models/propriedade.dart';
import 'package:monopoly/providers/dados_provider.dart';
import 'package:monopoly/providers/id_conteudo_provider.dart';
import 'package:monopoly/providers/jogadores_provider.dart';
import 'package:monopoly/providers/propriedades_provider.dart';
import 'package:monopoly/providers/turno_provider.dart';
import 'package:monopoly/widgets/centro_tabuleiro/principal/dados.dart';

class CentroTabuleiro extends ConsumerStatefulWidget {
  const CentroTabuleiro({super.key});

  @override
  ConsumerState<CentroTabuleiro> createState() => _CentroTabuleiroState();
}

class _CentroTabuleiroState extends ConsumerState<CentroTabuleiro> {
  @override
  Widget build(BuildContext context) {
    int idConteudo = ref.watch(idConteudoProvider);
    final idConteudoNotifier = ref.read(idConteudoProvider.notifier);
    switch (idConteudo) {
      case 1:
        final dadosState = ref.watch(dadosProvider);
        return Dados(
          dadosState: dadosState,
          ref: ref,
        );
      case 5:
        // ID de qndo a propriedade tá vazia e sem dono
        final int idJogador = ref.read(turnoProvider);
        final int idPropriedadeAtual =
            ref.read(jogadoresProvider)[idJogador].idPosicaoJogador;
        final Propriedade propriedadeAtual = propriedades[idPropriedadeAtual];
        if (propriedadeAtual.tipo == TipoPropriedade.rua) {
          int precoPropriedade = propriedadeAtual.preco!;
          return IntrinsicWidth(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Propriedade Disponível!',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 24),
                _botaoSimples(context, 'Comprar (\$$precoPropriedade)', () {
                  ref
                      .read(jogadoresProvider.notifier)
                      .gastar(idJogador, precoPropriedade);
                  ref.read(propriedadesProvider.notifier).adquirirPropriedade(
                        idPropriedade: idPropriedadeAtual,
                        idJogador: idJogador,
                      );
                  ref.read(dadosProvider.notifier).passarTurno();
                }),
                _botaoSimples(context, 'Leiloar', () {}),
              ],
            ),
          );
        }
        return const Placeholder();
      case 6:
        final int index = ref.read(turnoProvider);
        final JogadoresNotifier jogadoresNotifier =
            ref.read(jogadoresProvider.notifier);
        final List<Jogador> jogadores = ref.read(jogadoresProvider);
        final int idPropriedade = jogadores[index].idPosicaoJogador;
        final int idJogadorDono =
            ref.read(propriedadesProvider)[idPropriedade].idJogadorDono!;
        final int aluguel =
            ref.read(propriedadesProvider.notifier).getAluguel(idPropriedade);

        final String nomeProprietario = jogadores[idJogadorDono].nome;
        return IntrinsicWidth(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Propriedade de $nomeProprietario!',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24),
              _botaoSimples(context, 'Pagar (\$$aluguel)', () {
                jogadoresNotifier.gastar(index, aluguel);
                jogadoresNotifier.receber(idJogadorDono, aluguel);
                ref.read(dadosProvider.notifier).passarTurno();
              }),
            ],
          ),
        );

      default:
        return Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    _buildButton(context, 'Jogar Dados', () {
                      idConteudoNotifier.mudarId(1);
                    }),
                    _buildButton(context, 'Negociar', () {
                      idConteudoNotifier.mudarId(2);
                    }),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    _buildButton(context, 'Hipotecar', () {
                      idConteudoNotifier.mudarId(3);
                    }),
                    _buildButton(context, 'Comprar Casas', () {
                      idConteudoNotifier.mudarId(4);
                    }),
                  ],
                ),
              ),
            ),
          ],
        );
    }
  }
}

Widget _buildButton(
    BuildContext context, String texto, VoidCallback onPressed) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              width: 1,
            ),
          ),
          minimumSize: const Size(double.infinity, double.infinity),
        ),
        child: Center(
          child: Text(
            texto,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ),
  );
}

Widget _botaoSimples(
    BuildContext context, String texto, VoidCallback onPressed) {
  return FilledButton(
    onPressed: onPressed,
    style: FilledButton.styleFrom(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          width: 1,
        ),
      ),
    ),
    child: Center(
      child: Text(
        texto,
        textAlign: TextAlign.center,
      ),
    ),
  );
}

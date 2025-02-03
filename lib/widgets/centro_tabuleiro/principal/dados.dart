import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monopoly/providers/dados_provider.dart';
import 'package:monopoly/providers/id_conteudo_provider.dart';
import 'package:monopoly/widgets/centro_tabuleiro/coluna_dados.dart';

class Dados extends StatelessWidget {
  const Dados({
    super.key,
    required this.dadosState,
    required this.ref,
  });

  final DadosState dadosState;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox.expand(
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 12),
                    const Text(
                      'Dados',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ColunaDados(indiceColuna: 0),
                        SizedBox(width: 5),
                        ColunaDados(indiceColuna: 1),
                      ],
                    ),
                    const Spacer(),
                    OutlinedButton(
                      onPressed: dadosState.ambosDadosSelecionados
                          ? () {
                              ref.read(dadosProvider.notifier).jogarDados();
                            }
                          : null,
                      child: const Text('Jogar'),
                    ),
                    const SizedBox(height: 2),
                  ],
                ),
              ],
            ),
            Positioned(
              top: 0,
              left: 0,
              child: IconButton(
                onPressed: () {
                  ref.read(idConteudoProvider.notifier).mudarId(0);
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monopoly/providers/dados_provider.dart';
import 'package:monopoly/widgets/centro_tabuleiro/principal/dados.dart';

class CentroTabuleiro extends ConsumerStatefulWidget {
  const CentroTabuleiro({super.key});

  @override
  ConsumerState<CentroTabuleiro> createState() => _CentroTabuleiroState();
}

class _CentroTabuleiroState extends ConsumerState<CentroTabuleiro> {
  int idConteudo = 0;
  @override
  Widget build(BuildContext context) {
    switch (idConteudo) {
      case 1:
        final dadosState = ref.watch(dadosProvider);
        return Dados(
          dadosState: dadosState,
          ref: ref,
          mudaIdConteudo: _mudaIdConteudo,
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
                      setState(() {
                        idConteudo = 1;
                      });
                    }),
                    _buildButton(context, 'Negociar', () {
                      setState(() {
                        idConteudo = 2;
                      });
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
                      setState(() {
                        idConteudo = 3;
                      });
                    }),
                    _buildButton(context, 'Comprar Casas', () {
                      setState(() {
                        idConteudo = 4;
                      });
                    }),
                  ],
                ),
              ),
            ),
          ],
        );
    }
  }

  _mudaIdConteudo(int id) {
    setState(() {
      idConteudo = id;
    });
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

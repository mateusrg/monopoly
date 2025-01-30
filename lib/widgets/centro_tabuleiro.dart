import 'package:flutter/material.dart';
import 'package:monopoly/widgets/centro_tabuleiro/coluna_dados.dart';

class CentroTabuleiro extends StatefulWidget {
  const CentroTabuleiro({super.key});

  @override
  State<CentroTabuleiro> createState() => _CentroTabuleiroState();
}

class _CentroTabuleiroState extends State<CentroTabuleiro> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Dados',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ColunaDados(indiceColuna: 0),
            SizedBox(width: 5),
            ColunaDados(indiceColuna: 1),
          ],
        ),
      ],
    );
  }
}

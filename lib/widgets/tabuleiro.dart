import 'dart:math';

import 'package:flutter/material.dart';
import 'package:monopoly/data/propriedades.dart';
import 'package:monopoly/widgets/centro_tabuleiro.dart';
import 'package:monopoly/widgets/propriedade_tabuleiro.dart';

class Tabuleiro extends StatefulWidget {
  const Tabuleiro({super.key});

  @override
  State<Tabuleiro> createState() => _TabuleiroState();
}

class _TabuleiroState extends State<Tabuleiro> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      final ladoTabuleiro = min(constraints.maxHeight, constraints.maxWidth);
      return Container(
        color: const Color.fromARGB(255, 235, 249, 213),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              children: [
                RotatedBox(
                  quarterTurns: 2,
                  child: Row(
                    children: List.generate(
                      11,
                      (index) => PropriedadeTabuleiro(
                        propriedade: propriedades[30 - index],
                        largura: ladoTabuleiro / 12,
                      ),
                    ),
                  ),
                ),
                IntrinsicHeight(
                  child: Row(
                    children: [
                      RotatedBox(
                        quarterTurns: 1,
                        child: Row(
                          children: List.generate(
                            9,
                            (index) => PropriedadeTabuleiro(
                              propriedade: propriedades[19 - index],
                              largura: ladoTabuleiro / 12,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          constraints: const BoxConstraints.expand(),
                          child: const Center(
                            child: CentroTabuleiro(),
                          ),
                        ),
                      ),
                      RotatedBox(
                        quarterTurns: 3,
                        child: Row(
                          children: List.generate(
                            9,
                            (index) => PropriedadeTabuleiro(
                              propriedade: propriedades[39 - index],
                              largura: ladoTabuleiro / 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: List.generate(
                    11,
                    (index) => PropriedadeTabuleiro(
                      propriedade: propriedades[10 - index],
                      largura: ladoTabuleiro / 12,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}

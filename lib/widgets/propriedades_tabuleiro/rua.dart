import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:monopoly/models/propriedade.dart';

class Rua extends StatelessWidget {
  const Rua({
    super.key,
    required this.largura,
    required this.propriedade,
  });

  final double largura;
  final Propriedade propriedade;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: largura,
      decoration: BoxDecoration(
        border: Border.all(width: 1),
      ),
      child: AspectRatio(
        aspectRatio: 2 / 3,
        child: Container(
          color: const Color.fromARGB(255, 235, 249, 213),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final double alturaCard = constraints.maxHeight;
              return Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: alturaCard * 0.25,
                    decoration: BoxDecoration(
                      color: propriedade.cor,
                      border: const Border(
                        bottom: BorderSide(width: 1),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 1),
                        child: AutoSizeText(
                          propriedade.abreviacao,
                          textAlign: TextAlign.center,
                          maxLines:
                              propriedade.abreviacao.split('\n').length > 1
                                  ? 2
                                  : 1,
                          minFontSize: 5,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

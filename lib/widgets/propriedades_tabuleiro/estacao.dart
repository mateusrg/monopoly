import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:monopoly/models/propriedade.dart';

class Estacao extends StatelessWidget {
  const Estacao({
    super.key,
    required this.largura,
    required this.propriedade,
    required this.nomeEstacao,
  });

  final double largura;
  final Propriedade propriedade;
  final String nomeEstacao;

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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: AutoSizeText(
                  nomeEstacao,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  minFontSize: 5,
                ),
              ),
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Image.asset('assets/images/estacao.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

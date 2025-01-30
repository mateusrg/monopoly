import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:monopoly/models/propriedade.dart';

class Cadeia extends StatelessWidget {
  const Cadeia({
    super.key,
    required this.largura,
    required this.propriedade,
  });

  final double largura;
  final Propriedade propriedade;

  @override
  Widget build(BuildContext context) {
    double larguraCadeia = largura * 1.1;
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
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Image.asset('assets/images/cadeia.png'),
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
          ],
        ),
      ),
    );
  }
}

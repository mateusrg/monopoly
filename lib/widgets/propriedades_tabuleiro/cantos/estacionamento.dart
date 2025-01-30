import 'package:flutter/material.dart';
import 'package:monopoly/models/propriedade.dart';

class Estacionamento extends StatelessWidget {
  const Estacionamento({
    super.key,
    required this.largura,
    required this.propriedade,
  });

  final double largura;
  final Propriedade propriedade;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: largura * 1.5,
      decoration: BoxDecoration(
        border: Border.all(width: 1),
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          color: const Color.fromARGB(255, 235, 249, 213),
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Container(
              alignment: Alignment.center,
              child: Image.asset('assets/images/estacionamento.png'),
            ),
          ),
        ),
      ),
    );
  }
}

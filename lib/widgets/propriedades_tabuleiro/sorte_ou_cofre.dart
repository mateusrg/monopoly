import 'package:flutter/material.dart';
import 'package:monopoly/models/propriedade.dart';

enum TipoSorteOuCofre {
  sorte,
  cofre,
}

class SorteOuCofre extends StatelessWidget {
  const SorteOuCofre({
    super.key,
    required this.largura,
    required this.propriedade,
    required this.tipo,
  });

  final double largura;
  final Propriedade propriedade;
  final TipoSorteOuCofre tipo;

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
          child: Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 6),
              child: tipo == TipoSorteOuCofre.cofre
                  ? Image.asset('assets/images/cofre.png')
                  : Image.asset('assets/images/sorte.png'),
            ),
          ),
        ),
      ),
    );
  }
}

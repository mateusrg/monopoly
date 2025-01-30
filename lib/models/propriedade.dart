import 'package:flutter/material.dart';
import 'package:monopoly/models/aluguel.dart';

enum TipoPropriedade {
  rua,
  estacao,
  companhia,
  sorte,
  cofre,
  imposto,
  canto,
}

enum Conjunto {
  marrom,
  azulClaro,
  rosa,
  laranja,
  vermelho,
  amarelo,
  verde,
  azulEscuro,
}

class Propriedade {
  const Propriedade({
    required this.id,
    required this.nome,
    required this.abreviacao,
    required this.tipo,
    this.preco,
    this.aluguel,
    this.precoCasa,
    this.conjunto,
  });

  final int id;
  final String nome;
  final String abreviacao;
  final TipoPropriedade tipo;
  final int? preco;
  final Aluguel? aluguel;
  final int? precoCasa;
  final Conjunto? conjunto;

  Color get cor {
    switch (conjunto) {
      case Conjunto.marrom:
        return Colors.brown;
      case Conjunto.azulClaro:
        return Colors.lightBlue.shade100;
      case Conjunto.rosa:
        return Colors.pink.shade400;
      case Conjunto.laranja:
        return Colors.orange;
      case Conjunto.vermelho:
        return Colors.red;
      case Conjunto.amarelo:
        return Colors.yellow;
      case Conjunto.verde:
        return Colors.lightGreen;
      case Conjunto.azulEscuro:
        return Colors.blue.shade800;
      default:
        return Colors.white;
    }
  }
}

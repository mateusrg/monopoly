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
    required this.tipo,
    this.preco,
    this.aluguel,
    this.precoCasa,
    this.conjunto,
  });

  final int id;
  final String nome;
  final TipoPropriedade tipo;
  final int? preco;
  final Aluguel? aluguel;
  final int? precoCasa;
  final Conjunto? conjunto;
}

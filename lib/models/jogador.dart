class Jogador {
  final String nome;
  final int peaoIndex;
  final int dinheiro;
  final int idPosicaoJogador;
  final bool preso;
  final bool temSairDaCadeiaDeGraca;

  Jogador({
    required this.nome,
    this.peaoIndex = 0,
    this.dinheiro = 1500,
    this.idPosicaoJogador = 0,
    this.preso = false,
    this.temSairDaCadeiaDeGraca = false,
  });

  Jogador copyWith({
    String? nome,
    int? peaoIndex,
    int? dinheiro,
    int? idPosicaoJogador,
    bool? preso,
    bool? temSairDaCadeiaDeGraca,
  }) {
    return Jogador(
      nome: nome ?? this.nome,
      peaoIndex: peaoIndex ?? this.peaoIndex,
      dinheiro: dinheiro ?? this.dinheiro,
      idPosicaoJogador: idPosicaoJogador ?? this.idPosicaoJogador,
      preso: preso ?? this.preso,
      temSairDaCadeiaDeGraca:
          temSairDaCadeiaDeGraca ?? this.temSairDaCadeiaDeGraca,
    );
  }

  Jogador receber(int quantidade) {
    return copyWith(dinheiro: dinheiro + quantidade);
  }

  Jogador gastar(int quantidade) {
    return copyWith(dinheiro: dinheiro - quantidade);
  }

  Jogador mover(int quantidade) {
    if (idPosicaoJogador + quantidade < 40) {
      return copyWith(idPosicaoJogador: idPosicaoJogador + quantidade);
    } else {
      return copyWith(
        idPosicaoJogador: idPosicaoJogador + quantidade - 40,
        dinheiro: dinheiro + 200,
      );
    }
  }

  Jogador prender() {
    return copyWith(
      idPosicaoJogador: 10,
      preso: true,
    );
  }

  Jogador soltar() {
    return copyWith(preso: false);
  }
}

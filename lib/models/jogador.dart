class Jogador {
  final String nome;
  final int peaoIndex;
  int dinheiro;
  int idPosicaoJogador;
  bool preso;

  Jogador({
    required this.nome,
    this.peaoIndex = 0,
    this.dinheiro = 1500,
    this.idPosicaoJogador = 0,
    this.preso = false,
  });

  void receber(int quantidade) {
    dinheiro += quantidade;
  }

  void gastar(int quantidade) {
    dinheiro -= quantidade;
  }

  void mover(int quantidade) {
    idPosicaoJogador = (idPosicaoJogador + quantidade) % 40;
  }

  void prender() {
    idPosicaoJogador = 10;
    preso = true;
    print('$nome preso!');
  }
}

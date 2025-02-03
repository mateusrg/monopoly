import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monopoly/data/propriedades.dart';
import 'package:monopoly/models/aluguel.dart';
import 'package:monopoly/models/propriedade.dart';

class PropriedadeEmJogo {
  PropriedadeEmJogo({
    required this.idPropriedade,
    required this.idJogadorDono,
    required this.quantidadeCasas,
    required this.hipotecada,
  });

  final int idPropriedade;
  int? idJogadorDono;
  int quantidadeCasas;
  bool hipotecada;
}

class PropriedadesNotifier extends StateNotifier<List<PropriedadeEmJogo>> {
  PropriedadesNotifier() : super([]);

  void reiniciarPropriedades() {
    state = List.generate(
      propriedades.length,
      (index) => PropriedadeEmJogo(
        idPropriedade: propriedades[index].id,
        idJogadorDono: null,
        quantidadeCasas: 0,
        hipotecada: false,
      ),
    );
  }

  void adquirirPropriedade(
      {required int idPropriedade, required int idJogador}) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == idPropriedade)
          PropriedadeEmJogo(
            idPropriedade: state[i].idPropriedade,
            idJogadorDono: idJogador,
            quantidadeCasas: state[i].quantidadeCasas,
            hipotecada: state[i].hipotecada,
          )
        else
          state[i]
    ];
  }

  int getAluguel(int idPropriedade) {
    final propriedadeEmJogo = state.firstWhere(
      (p) => p.idPropriedade == idPropriedade,
      orElse: () => throw Exception('Propriedade não encontrada'),
    );

    final propriedade =
        propriedades.firstWhere((p) => p.id == propriedadeEmJogo.idPropriedade);

    if (propriedadeEmJogo.hipotecada) {
      return 0;
    }

    if (propriedade.tipo != TipoPropriedade.rua) {
      return 0; // temporário, depois precisa verificar caso a caso.
    }

    final propriedadesMesmoConjunto =
        propriedades.where((p) => p.conjunto == propriedade.conjunto).toList();

    bool todasDoMesmoJogador = propriedadesMesmoConjunto.every((p) {
      return state.any(
        (pj) =>
            pj.idPropriedade == p.id &&
            pj.idJogadorDono == propriedadeEmJogo.idJogadorDono,
      );
    });

    if (!todasDoMesmoJogador) {
      return propriedade.aluguel!.aluguel;
    }

    final Aluguel aluguel = propriedade.aluguel!;
    switch (propriedadeEmJogo.quantidadeCasas) {
      case 1:
        return aluguel.umaCasa;
      case 2:
        return aluguel.duasCasas;
      case 3:
        return aluguel.tresCasas;
      case 4:
        return aluguel.quatroCasas;
      case 5:
        return aluguel.hotel;
      default:
        return aluguel.aluguelConjunto;
    }
  }
}

final propriedadesProvider =
    StateNotifierProvider<PropriedadesNotifier, List<PropriedadeEmJogo>>(
  (ref) {
    return PropriedadesNotifier();
  },
);

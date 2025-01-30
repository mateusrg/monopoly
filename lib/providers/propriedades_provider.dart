import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monopoly/data/propriedades.dart';

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

  reiniciarPropriedades() {
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
}

final propriedadesProvider =
    StateNotifierProvider<PropriedadesNotifier, List<dynamic>>(
  (ref) {
    return PropriedadesNotifier();
  },
);

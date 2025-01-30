import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monopoly/models/jogador.dart';
import 'package:monopoly/providers/propriedades_provider.dart';

class InformacoesJogadoresNotifier extends StateNotifier<List<Jogador>> {
  InformacoesJogadoresNotifier(this.ref) : super([]);
  final Ref ref;

  iniciarNovoJogo(List<Jogador> jogadores) {
    state = List.generate(
      jogadores.length,
      (index) => Jogador(
        nome: jogadores[index].nome,
        peaoIndex: jogadores[index].peaoIndex,
      ),
    );

    ref.read(propriedadesProvider.notifier).reiniciarPropriedades();
  }
}

final informacoesJogadoresProvider =
    StateNotifierProvider<InformacoesJogadoresNotifier, List<Jogador>>(
  (ref) {
    return InformacoesJogadoresNotifier(ref);
  },
);

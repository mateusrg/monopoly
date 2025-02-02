import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monopoly/providers/jogadores_provider.dart';

class ContadorTurnosPreso extends StateNotifier<List<int>> {
  ContadorTurnosPreso(this.ref) : super([]);
  final Ref ref;

  void adicionarTurno(indiceJogador) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == indiceJogador) state[i] + 1 else state[i]
    ];
  }

  void reiniciarTurnos(indiceJogador) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == indiceJogador) -1 else state[i]
    ];
  }

  void reiniciarPresos() {
    final int numeroDeJogadores = ref.read(jogadoresProvider).length;
    state = List.filled(numeroDeJogadores, -1);
  }
}

final contadorTurnosPresoProvider =
    StateNotifierProvider<ContadorTurnosPreso, List<int>>((ref) {
  return ContadorTurnosPreso(ref);
});

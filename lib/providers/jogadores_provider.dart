import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monopoly/models/jogador.dart';
import 'package:monopoly/providers/contador_turnos_preso_provider.dart';
import 'package:monopoly/providers/propriedades_provider.dart';

class JogadoresNotifier extends StateNotifier<List<Jogador>> {
  JogadoresNotifier(this.ref) : super([]);
  final Ref ref;

  void iniciarNovoJogo(List<Jogador> jogadores) {
    state = List.generate(
      jogadores.length,
      (index) => Jogador(
        nome: jogadores[index].nome,
        peaoIndex: jogadores[index].peaoIndex,
      ),
    );
    ref.read(propriedadesProvider.notifier).reiniciarPropriedades();
    ref.read(contadorTurnosPresoProvider.notifier).reiniciarPresos();
  }

  void atualizarJogador(int index, Jogador jogadorAtualizado) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index) jogadorAtualizado else state[i]
    ];
  }

  void receber(int index, int quantidade) {
    atualizarJogador(index, state[index].receber(quantidade));
  }

  void gastar(int index, int quantidade) {
    atualizarJogador(index, state[index].gastar(quantidade));
  }

  void mover(int index, int quantidade) {
    atualizarJogador(index, state[index].mover(quantidade));
  }

  void prender(int index) {
    atualizarJogador(index, state[index].prender());
  }

  void soltar(int index) {
    atualizarJogador(index, state[index].soltar());
  }
}

final jogadoresProvider =
    StateNotifierProvider<JogadoresNotifier, List<Jogador>>(
  (ref) {
    return JogadoresNotifier(ref);
  },
);

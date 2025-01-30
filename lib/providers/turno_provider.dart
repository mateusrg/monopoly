import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monopoly/models/jogador.dart';
import 'package:monopoly/providers/dados_provider.dart';
import 'package:monopoly/providers/informacoes_jogadores_provider.dart';

class TurnoNotifier extends StateNotifier<int> {
  TurnoNotifier(this.ref) : super(0);
  final Ref ref;
  int turnosConsecutivos = 0;

  void proximoTurno() {
    List<Jogador> jogadores = ref.read(informacoesJogadoresProvider);
    int totalJogadores = jogadores.length;

    final dados = ref.read(dadosProvider);

    if (dados.dado1 != dados.dado2) {
      state = (state + 1) % totalJogadores;
    } else if (turnosConsecutivos < 2) {
      turnosConsecutivos += 1;
    } else {
      turnosConsecutivos = 0;
      jogadores[state].prender();
    }
  }
}

final turnoProvider = StateNotifierProvider<TurnoNotifier, int>((ref) {
  return TurnoNotifier(ref);
});

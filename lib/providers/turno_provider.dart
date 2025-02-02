import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monopoly/models/jogador.dart';
import 'package:monopoly/providers/contador_turno_prisao_provider.dart';
import 'package:monopoly/providers/dados_provider.dart';
import 'package:monopoly/providers/jogadores_provider.dart';

class TurnoNotifier extends StateNotifier<int> {
  TurnoNotifier(this.ref) : super(0);
  final Ref ref;

  void proximoTurno() {
    final JogadoresNotifier jogadoresNotifier =
        ref.read(jogadoresProvider.notifier);
    final List<Jogador> jogadores = ref.read(jogadoresProvider);
    final int totalJogadores = jogadores.length;

    final int turnosConsecutivos = ref.read(contadorTurnoPrisaoProvider);
    final ContadorTurnoPrisao funcoesTurnosConsecutivos =
        ref.read(contadorTurnoPrisaoProvider.notifier);

    final dados = ref.read(dadosProvider);

    if (dados.dado1 != dados.dado2) {
      funcoesTurnosConsecutivos.reiniciarContador();
      state = (state + 1) % totalJogadores;
    } else if (turnosConsecutivos < 2) {
      funcoesTurnosConsecutivos.adicionarContador();
    } else {
      funcoesTurnosConsecutivos.reiniciarContador();
      jogadoresNotifier.prender(state);
    }
  }
}

final turnoProvider = StateNotifierProvider<TurnoNotifier, int>((ref) {
  return TurnoNotifier(ref);
});

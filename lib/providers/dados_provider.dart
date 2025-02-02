import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monopoly/models/jogador.dart';
import 'package:monopoly/providers/contador_turnos_preso_provider.dart';
import 'package:monopoly/providers/jogadores_provider.dart';
import 'package:monopoly/providers/turno_provider.dart';

class DadosState {
  final int? dado1;
  final int? dado2;

  DadosState({
    this.dado1,
    this.dado2,
  });

  bool get ambosDadosSelecionados => dado1 != null && dado2 != null;
}

class DadosNotifier extends StateNotifier<DadosState> {
  DadosNotifier(this.ref) : super(DadosState());
  final Ref ref;

  void selecionarDado(int indiceColuna, int valorDado) {
    state = DadosState(
      dado1: indiceColuna == 0 ? valorDado : state.dado1,
      dado2: indiceColuna == 1 ? valorDado : state.dado2,
    );

    if (state.ambosDadosSelecionados) {
      _ambosDadosSelecionados();
    }
  }

  void _ambosDadosSelecionados() {
    final JogadoresNotifier jogadoresNotifier =
        ref.read(jogadoresProvider.notifier);
    final List<Jogador> jogadores = ref.read(jogadoresProvider);
    final int index = ref.read(turnoProvider);

    if (jogadores[index].preso) {
      final ContadorTurnosPreso turnosPresoNotifier =
          ref.read(contadorTurnosPresoProvider.notifier);
      if (state.dado1 == state.dado2) {
        jogadoresNotifier.soltar(index);
        turnosPresoNotifier.reiniciarTurnos(index);
      } else {
        turnosPresoNotifier.adicionarTurno(index);
        if (ref.read(contadorTurnosPresoProvider)[index] < 2) {
          ref.read(turnoProvider.notifier).proximoTurno();
          state = DadosState(
            dado1: null,
            dado2: null,
          );
          return;
        }
        jogadoresNotifier.soltar(index);
        turnosPresoNotifier.reiniciarTurnos(index);

        print('Forçado a sair da cadeia!');
        if (!jogadores[index].temSairDaCadeiaDeGraca) {
          jogadoresNotifier.gastar(index, 50);
        } else {
          // Falta fazer pra caso tenha a carta Saia da Cadeia de Graça
        }
      }
    }

    jogadoresNotifier.mover(index, state.dado1! + state.dado2!);
    ref.read(turnoProvider.notifier).proximoTurno();
    state = DadosState(
      dado1: null,
      dado2: null,
    );
  }
}

final dadosProvider = StateNotifierProvider<DadosNotifier, DadosState>((ref) {
  return DadosNotifier(ref);
});

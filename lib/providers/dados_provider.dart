import 'package:flutter_riverpod/flutter_riverpod.dart';
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

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContadorTurnoPrisao extends StateNotifier<int> {
  ContadorTurnoPrisao() : super(0);

  void adicionarContador() {
    state += 1;
  }

  void reiniciarContador() {
    state = 0;
  }
}

final contadorTurnoPrisaoProvider =
    StateNotifierProvider<ContadorTurnoPrisao, int>((ref) {
  return ContadorTurnoPrisao();
});

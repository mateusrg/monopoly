import 'package:flutter_riverpod/flutter_riverpod.dart';

class IdConteudo extends StateNotifier<int> {
  IdConteudo() : super(0);

  void reiniciarId() {
    state = 0;
  }

  void mudarId(int id) {
    state = id;
  }
}

final idConteudoProvider = StateNotifierProvider<IdConteudo, int>((ref) {
  return IdConteudo();
});

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monopoly/models/jogador.dart';
import 'package:monopoly/pages/partida_page.dart';
import 'package:monopoly/providers/informacoes_jogadores_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final List<Jogador> _jogadores = [];
  final List<int> _peoesSelecionados = [];

  void _adicionarJogador(String nome, int peaoIndex) {
    setState(() {
      _jogadores.add(Jogador(nome: nome, peaoIndex: peaoIndex));
      _peoesSelecionados.add(peaoIndex);
    });
  }

  void _editarJogador(int index, String novoNome, int novoPeaoIndex) {
    setState(() {
      final peaoAntigo = _jogadores[index].peaoIndex;
      _peoesSelecionados.remove(peaoAntigo);
      _jogadores[index] = Jogador(nome: novoNome, peaoIndex: novoPeaoIndex);
      _peoesSelecionados.add(novoPeaoIndex);
    });
  }

  void _excluirJogador(int index) {
    setState(() {
      final peaoRemovido = _jogadores[index].peaoIndex;
      _peoesSelecionados.remove(peaoRemovido);
      _jogadores.removeAt(index);
    });
  }

  void _reordenarJogadores(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final jogador = _jogadores.removeAt(oldIndex);
      _jogadores.insert(newIndex, jogador);
    });
  }

  void _mostrarDialogSelecionarPeao(
      BuildContext context, Function(int) onPeaoSelecionado) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Selecione um Peão'),
          content: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: 8,
            itemBuilder: (context, index) {
              final peaoJaSelecionado = _peoesSelecionados.contains(index);
              return GestureDetector(
                onTap: peaoJaSelecionado
                    ? null
                    : () {
                        onPeaoSelecionado(index);
                        Navigator.pop(context);
                      },
                child: Opacity(
                  opacity: peaoJaSelecionado ? 0.5 : 1.0,
                  child: Image.asset('assets/peoes/peao_$index.png'),
                ),
              );
            },
          ),
        );
      },
    );
  }

  void _mostrarDialogAdicionarJogador(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        int peaoSelecionado = -1;

        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              title: const Text('Adicionar Jogador'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: controller,
                      decoration:
                          const InputDecoration(labelText: 'Nome do Jogador'),
                      maxLength: 15,
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        _mostrarDialogSelecionarPeao(context, (index) {
                          setStateDialog(() {
                            peaoSelecionado = index;
                          });
                        });
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: peaoSelecionado == -1
                            ? const Center(
                                child: Text(
                                  'Selecione um Peão',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.grey),
                                ),
                              )
                            : Image.asset(
                                'assets/peoes/peao_$peaoSelecionado.png'),
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancelar'),
                ),
                TextButton(
                  onPressed: () {
                    final nome = controller.text.trim();
                    if (nome.isNotEmpty && peaoSelecionado != -1) {
                      _adicionarJogador(nome, peaoSelecionado);
                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Preencha o nome e selecione um peão.'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  child: const Text('Adicionar'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _mostrarDialogEditarJogador(
      BuildContext context, int index, Jogador jogador) {
    final TextEditingController controller =
        TextEditingController(text: jogador.nome);

    showDialog(
      context: context,
      builder: (context) {
        int peaoSelecionado = jogador.peaoIndex;

        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              title: const Text('Editar Jogador'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: controller,
                      decoration:
                          const InputDecoration(labelText: 'Nome do Jogador'),
                      maxLength: 15,
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        _mostrarDialogSelecionarPeao(context, (index) {
                          setStateDialog(() {
                            peaoSelecionado = index;
                          });
                        });
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: peaoSelecionado == -1
                            ? const Center(
                                child: Text(
                                  'Selecione um Peão',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.grey),
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(8),
                                child: Image.asset(
                                    'assets/peoes/peao_$peaoSelecionado.png'),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    _excluirJogador(index);
                    Navigator.pop(context);
                  },
                  child: const Text('Excluir',
                      style: TextStyle(color: Colors.red)),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancelar'),
                ),
                TextButton(
                  onPressed: () {
                    final novoNome = controller.text.trim();
                    if (novoNome.isNotEmpty && peaoSelecionado != -1) {
                      _editarJogador(index, novoNome, peaoSelecionado);
                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Preencha o nome e selecione um peão.'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  child: const Text('Alterar'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jogadores'),
        actions: [
          IconButton(
            onPressed: () {
              _mostrarDialogAdicionarJogador(context);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ReorderableListView.builder(
        itemCount: _jogadores.length,
        onReorder: _reordenarJogadores,
        itemBuilder: (context, index) {
          final jogador = _jogadores[index];
          return Dismissible(
            key: Key(jogador.nome),
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            secondaryBackground: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (direction) {
              _excluirJogador(index);
            },
            child: Card(
              key: Key(jogador.nome),
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                leading: CircleAvatar(
                  maxRadius: 16,
                  backgroundColor:
                      Theme.of(context).colorScheme.primaryContainer,
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(
                        color:
                            Theme.of(context).colorScheme.onPrimaryContainer),
                  ),
                ),
                title: Text(jogador.nome),
                trailing: Image.asset(
                  'assets/peoes/peao_${jogador.peaoIndex}.png',
                  width: 35,
                ),
                onTap: () {
                  _mostrarDialogEditarJogador(context, index, jogador);
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_jogadores.length < 2) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Precisa de pelo menos 2 jogadores'),
                duration: Duration(seconds: 2),
              ),
            );
          } else {
            ref
                .read(informacoesJogadoresProvider.notifier)
                .iniciarNovoJogo(_jogadores);

            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => const PartidaPage(),
              ),
            );
          }
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}

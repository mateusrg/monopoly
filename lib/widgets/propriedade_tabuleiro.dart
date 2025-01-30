import 'package:flutter/material.dart';
import 'package:monopoly/models/propriedade.dart';
import 'package:monopoly/widgets/propriedades_tabuleiro/cantos/cadeia.dart';
import 'package:monopoly/widgets/propriedades_tabuleiro/cantos/estacionamento.dart';
import 'package:monopoly/widgets/propriedades_tabuleiro/cantos/ponto_de_partida.dart';
import 'package:monopoly/widgets/propriedades_tabuleiro/cantos/va_para_cadeia.dart';
import 'package:monopoly/widgets/propriedades_tabuleiro/companhia.dart';
import 'package:monopoly/widgets/propriedades_tabuleiro/estacao.dart';
import 'package:monopoly/widgets/propriedades_tabuleiro/imposto.dart';
import 'package:monopoly/widgets/propriedades_tabuleiro/sorte_ou_cofre.dart';
import 'package:monopoly/widgets/propriedades_tabuleiro/rua.dart';

class PropriedadeTabuleiro extends StatelessWidget {
  const PropriedadeTabuleiro({
    required this.propriedade,
    required this.largura,
    super.key,
  });

  final Propriedade propriedade;
  final double largura;

  @override
  Widget build(BuildContext context) {
    switch (propriedade.tipo) {
      case TipoPropriedade.companhia:
        return Companhia(
          largura: largura,
          propriedade: propriedade,
          tipo: propriedade.id == 12
              ? TipoCompanhia.eletrica
              : TipoCompanhia.agua,
        );
      case TipoPropriedade.cofre:
        return SorteOuCofre(
          largura: largura,
          propriedade: propriedade,
          tipo: TipoSorteOuCofre.cofre,
        );
      case TipoPropriedade.sorte:
        return SorteOuCofre(
          largura: largura,
          propriedade: propriedade,
          tipo: TipoSorteOuCofre.sorte,
        );
      case TipoPropriedade.imposto:
        if (propriedade.id == 4) {
          return Imposto(
            largura: largura,
            propriedade: propriedade,
            tipo: TipoImposto.renda,
          );
        }
        return Imposto(
          largura: largura,
          propriedade: propriedade,
          tipo: TipoImposto.riqueza,
        );
      case TipoPropriedade.estacao:
        late String nomeEstacao;
        switch (propriedade.id) {
          case 5:
            nomeEstacao = 'Maracanã';
            break;
          case 15:
            nomeEstacao = 'Carioca';
            break;
          case 25:
            nomeEstacao = 'Consol.';
            break;
          default:
            nomeEstacao = 'Repúb.';
        }
        return Estacao(
          largura: largura,
          propriedade: propriedade,
          nomeEstacao: nomeEstacao,
        );
      case TipoPropriedade.canto:
        switch (propriedade.id) {
          case 0:
            return PontoDePartida(
              largura: largura,
              propriedade: propriedade,
            );
          case 10:
            return Cadeia(
              largura: largura,
              propriedade: propriedade,
            );
          case 20:
            return Estacionamento(
              largura: largura,
              propriedade: propriedade,
            );
          default:
            return VaParaACadeia(
              largura: largura,
              propriedade: propriedade,
            );
        }
      default:
        return Rua(
          largura: largura,
          propriedade: propriedade,
        );
    }
  }
}

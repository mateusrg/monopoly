import 'package:monopoly/models/carta_sorte_cofre.dart';

const Map<String, dynamic> cartasSorte = {
  'AVANCE': {
    'RUA': [
      CartaSorteCofre(
        id: 0,
        descricao: 'AVANCE ATÉ A AVENIDA VIEIRA SOUTO. '
            'SE PASSAR PELO PONTO DE PARTIDA, RECEBA \$200.',
      ),
      CartaSorteCofre(
        id: 1,
        descricao: 'AVANCE ATÉ COPACABANA. '
            'SE PASSAR PELO PONTO DE PARTIDA, RECEBA \$200.',
      ),
      CartaSorteCofre(
        id: 2,
        descricao: 'AVANCE ATÉ A RUA OSCAR FREIRE.',
      ),
    ],
    'ESTAÇÃO': [
      CartaSorteCofre(
        id: 3,
        descricao: '''AVANCE ATÉ A ESTAÇÃO MAIS PRÓXIMA.
      Se NÃO TIVER DONO, você pode comprá-la do Banco.
      Se TIVER DONO, pague ao proprietário o dobro do aluguel devido.''',
      ),
      CartaSorteCofre(
        id: 4,
        descricao: 'VIAJE ATÉ A ESTAÇÃO DE METRÔ MARACANÃ. '
            'SE PASSAR PELO PONTO DE PARTIDA, RECEBA \$200.',
      ),
    ],
    'OUTRO': [
      CartaSorteCofre(
        id: 5,
        descricao: '''AVANCE ATÉ A COMPANHIA MAIS PRÓXIMA.
      Se NÃO TIVER DONO, você pode comprá-la do Banco.
      Se TIVER DONO, jogue os dados e pague ao proprietário 10 vezes '''
            'o número tirado.',
      ),
      CartaSorteCofre(
        id: 6,
        descricao: 'AVANCE ATÉ O PONTO DE PARTIDA. (RECEBA \$200)',
      ),
    ],
  },
  'RECEBA': [
    CartaSorteCofre(
      id: 7,
      descricao: 'O ALUGUEL DAS SUAS PROPRIEDADES ESTÁ RENDENDO! RECEBA \$150.',
    ),
    CartaSorteCofre(
      id: 8,
      descricao: 'RECEBA DO BANCO A QUANTIA DE \$50.',
    ),
  ],
  'PAGUE': [
    CartaSorteCofre(
      id: 9,
      descricao:
          'VOCÊ DECIDIU FAZER A MANUTENÇÃO DE TODAS AS SUAS PROPRIEDADES. '
          'PAGUE \$25 PARA CADA CASA QUE TIVER E \$100 PARA CADA HOTEL.',
    ),
    CartaSorteCofre(
      id: 10,
      descricao: 'VOCÊ FOI MULTADO POR EXCESSO DE VELOCIDADE. PAGUE \$15.',
    ),
    CartaSorteCofre(
      id: 11,
      descricao: 'VOCÊ FOI ELEITO O MAIS GENEROSO DO ANO. '
          'PAGUE \$50 A CADA JOGADOR.',
    ),
  ],
  'OUTRO': [
    CartaSorteCofre(
      id: 12,
      descricao:
          'VÁ DIRETAMENTE PARA A CADEIA. NÃO PASSE PELO PONTO DE PARTIDA '
          'E NÃO RECEBA \$200.',
    ),
    CartaSorteCofre(
      id: 13,
      descricao: '''SAIA DA CADEIA DE GRAÇA.
      Esta carta pode ser guardada até ser usada ou vendida.''',
    ),
    CartaSorteCofre(
      id: 14,
      descricao: 'VOLTE 3 ESPAÇOS.',
    ),
  ],
};

const Map<String, dynamic> cartasCofre = {
  'RECEBA': [
    CartaSorteCofre(
      id: 15,
      descricao: 'É DIA DE GANHAR SEU 13º SALÁRIO! RECEBA \$200.',
    ),
    CartaSorteCofre(
      id: 16,
      descricao: 'VOCÊ GANHOU EM UM SORTEIO! RECEBA \$100.',
    ),
    CartaSorteCofre(
      id: 17,
      descricao: 'SEUS FUNDOS DE INVESTIMENTO RENDERAM. RECEBA \$100.',
    ),
    CartaSorteCofre(
      id: 18,
      descricao: 'VOCÊ GANHOU UMA HERANÇA. RECEBA \$100.',
    ),
    CartaSorteCofre(
      id: 19,
      descricao: 'SUA LOJA FEZ UMA MEGA LIQUIDAÇÃO E VENDEU TODO O ESTOQUE! '
          'RECEBA \$50',
    ),
    CartaSorteCofre(
      id: 20,
      descricao: 'SUA MESADA FOI ADIANTADA. RECEBA \$25.',
    ),
    CartaSorteCofre(
      id: 21,
      descricao: 'RESTITUIÇÃO DO IMPOSTO DE RENDA. RECEBA \$20.',
    ),
    CartaSorteCofre(
      id: 22,
      descricao: 'VOCÊ GANHOU O SEGUNDO LUGAR EM UM CONCURSO DE BELEZA! '
          'RECEBA \$10.',
    ),
    CartaSorteCofre(
      id: 23,
      descricao: 'É SEU ANIVERSÁRIO! RECEBA \$10 DE CADA JOGADOR.',
    ),
  ],
  'PAGUE': [
    CartaSorteCofre(
      id: 24,
      descricao: 'VOCÊ TEVE DESPESAS MÉDICAS. PAGUE \$100.',
    ),
    CartaSorteCofre(
      id: 25,
      descricao: 'VOCÊ GASTOU COM UMA CONSULTA MÉDICA. PAGUE \$50.',
    ),
    CartaSorteCofre(
      id: 26,
      descricao: 'MATRÍCULA DA ESCOLA. PAGUE \$50.',
    ),
    CartaSorteCofre(
      id: 27,
      descricao: 'VOCÊ FOI ACIONADO PARA CONSERTOS NAS RUAS: '
          'PAGUE \$40 PARA CADA CASA QUE TIVER E \$115 PARA CADA HOTEL.',
    ),
  ],
  'OUTRO': [
    CartaSorteCofre(
      id: 28,
      descricao: 'VÁ DIRETAMENTE PARA A CADEIA. NÃO PASSE PELO '
          'PONTO DE PARTIDA E NÃO RECEBA \$200.',
    ),
    CartaSorteCofre(
      id: 29,
      descricao: 'SAIA DA CADEIA DE GRAÇA. '
          'Esta carta pode ser guardada até ser usada ou vendida.',
    ),
    CartaSorteCofre(
      id: 30,
      descricao: 'AVANCE ATÉ O PONTO DE PARTIDA. (RECEBA \$200)',
    ),
  ],
};

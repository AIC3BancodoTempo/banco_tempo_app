class QuestionaryModel {
  List<String> perguntas = [
    "Em relação aos deveres da administração do Banco do Tempo, assinale a afirmação INCORRETA:",
    "Orientamos como medidas de segurança, EXCETO:",
    "São motivos de exclusão de membros, EXCETO:",
    "Sobre a oferta de talentos, sejam produtos ou serviços, é INCORRETO afirmar que:",
    "Sobre o valor dos produtos e serviços, é INCORRETA:"
  ];
  List<String> respostas = [
    "Garantir a qualidade dos produtos e serviços oferecidos",
    "Não esteja acompanhado durante os encontros presenciais",
    "Indicar me postagem produto/serviço de outro membro do BT",
    "São aceitos: babá/cuidador/petsitter/banho/tosa/companhia",
    "Deve ser incluído no valor da troca o tempo de deslocamento"
  ];
  List<String> opcoes = [];
  QuestionaryModel() {
    opcoes = respostas;
    opcoes.shuffle();
  }
}

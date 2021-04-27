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
    "Indicar em postagem produto/serviço de outro membro do BT",
    "São aceitos: babá/cuidador/petsitter/banho/tosa/companhia",
    "Deve ser incluído no valor da troca o tempo de deslocamento"
  ];
  List<String> opcoes = [
    "Garantir a qualidade dos produtos e serviços oferecidos",
    "Cadastrar e dar assessoria a novos associados",
    "Atualizar cadastros e transferir créditos",
    "Responder, se for o caso, mensagem recebida no fale conosco"
  ];
  List<String> opcoes1 = [
    "Não esteja acompanhado durante os encontros presenciais",
    "Todas negociações devem ocorrer nas postagens do aplicativo",
    "Todos os detalhes do serviço/produto devem ser especificados",
    "Verifique a opinião de membros sobre a pessoa e seu talento"
  ];

  List<String> opcoes2 = [
    "Indicar em postagem produto/serviço de outro membro do BT",
    "Cobrar dinheiro ou fazer cobrança mista/venda casada",
    "Oferecer produto que não produziu ou serviço que não realiza",
    "Cobrar um tempo diferente do tempo de serviço prestado"
  ];

  List<String> opcoes3 = [
    "São aceitos: babá/cuidador/petsitter/banho/tosa/companhia",
    "Crianças, pessoas incapazes e animais exigem SUPERVISÃO",
    "É talento a recepção de membros em espaço próprio",
    "Os talentos oferecidos podem ser profissionais ou não"
  ];

  List<String> opcoes4 = [
    "Deve ser incluído no valor da troca o tempo de deslocamento",
    "O valor de um produto é o tempo de sua elaboração",
    "O valor de um serviço é o tempo de serviço prestado",
    "Alguns serviços podem ser negociados até o limite de 10h"
  ];
  QuestionaryModel() {
    opcoes.shuffle();
    opcoes1.shuffle();
    opcoes2.shuffle();
    opcoes3.shuffle();
    opcoes4.shuffle();
  }
}

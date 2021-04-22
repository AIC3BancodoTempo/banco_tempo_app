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
<<<<<<< Updated upstream
    " Indicar me postagem produto/serviço de outro membro do BT",
=======
    "Indicar em postagem produto/serviço de outro membro do BT",
>>>>>>> Stashed changes
    "São aceitos: babá/cuidador/petsitter/banho/tosa/companhia",
    "Deve ser incluído no valor da troca o tempo de deslocamento"
  ];
  List<String> respostasDeApoio = [
    "Garantir a qualidade dos produtos e serviços oferecidos",
    "Cadastrar e dar assessoria a novos associados",
    "Atualizar cadastros e transferir créditos",
    "Responder, se for o caso, mensagem recebida no fale conosco"
  ];
  List<String> respostasDeApoio2 = [
    "Não esteja acompanhado durante os encontros presenciais",
    "Todas negociações devem ocorrer nas postagens do aplicativo",
    "Todos os detalhes do serviço/produto devem ser especificados",
    "Verifique a opinião de membros sobre a pessoa e seu talento"
  ];

  List<String> respostasDeApoio3 = [
    "Indicar em postagem produto/serviço de outro membro do BT",
    "Cobrar dinheiro ou fazer cobrança mista/venda casada",
    "Oferecer produto que não produziu ou serviço que não realiza",
    "Cobrar um tempo diferente do tempo de serviço prestado"
  ];

  List<String> respostasDeApoio4 = [
    "São aceitos: babá/cuidador/petsitter/banho/tosa/companhia",
    "Crianças, pessoas incapazes e animais exigem SUPERVISÃO",
    "É talento a recepção de membros em espaço próprio",
    "Os talentos oferecidos podem ser profissionais ou não"
  ];

  List<String> respostasDeApoio5 = [
    "Deve ser incluído no valor da troca o tempo de deslocamento",
    "O valor de um produto é o tempo de sua elaboração",
    "O valor de um serviço é o tempo de serviço prestado",
    "Alguns serviços podem ser negociados até o limite de 10h"
  ];

  List<String> opcoes = [];
  List<String> opcoes2 = [];
  List<String> opcoes3 = [];
  List<String> opcoes4 = [];
  List<String> opcoes5 = [];
  QuestionaryModel() {
    opcoes = respostasDeApoio;
    opcoes2 = respostasDeApoio2;
    opcoes3 = respostasDeApoio3;
    opcoes4 = respostasDeApoio4;
    opcoes5 = respostasDeApoio5;

    opcoes.shuffle();
    opcoes2.shuffle();
    opcoes3.shuffle();
    opcoes4.shuffle();
    opcoes5.shuffle();
  }
}

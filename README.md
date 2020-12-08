# banco_do_tempo_app

Aplicativo para banco do tempo de Rio Grande

[Detalhes do projeto](https://docs.google.com/document/d/1x88PNOqaUK9KA9aSLZWdklQ2OCdgoQTLl_SQKOj1ivE/edit?usp=sharing)

## Padrão de arquitetura

["Bloc Pattern"]("https://www.youtube.com/watch?v=bLHSMirH3_o&list=PLOnrrPHXrrjRt7mRpXk-4BAB5DP8ECIWe&index=5&ab_channel=CODEVILLAGE")

## Extensões Visual Studio Code

- Dart
- Flutter
- Awesome Flutter Snippets
- dart-import
- bloc

## Bibliotecas e Documentação

[Flutter Install](https://flutter.dev/docs/get-started/install)

[Flutter Widgets](https://flutter.dev/docs/development/ui/widgets)

[Pub Dev](https://pub.dev/)

[UI](https://www.figma.com/file/REzChgtpWAinmgFMwg7YML/Banco-do-tempo)
## Primeira execução

- flutter pub get

## Estrutura de arquivos
- lib 
    - blocs -> logica de negócio
    - core -> metodos compartilhados por mais de um bloc
    - resource -> chamadas do firebase
    - screens -> pastas das telas
    - screens, core -> componentes compartilhados exemplo, botão que pode ser utilizado em mais de uma tela

- assets
    - logo -> logo do banco do tempo
    - images -> imagens disponíveis no aplicativo

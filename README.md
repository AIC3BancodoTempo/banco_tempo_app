# banco_do_tempo_app

Aplicativo para banco do tempo de Rio Grande

## Padrão de arquitetura

["Bloc Pattern"]("https://www.youtube.com/watch?v=bLHSMirH3_o&list=PLOnrrPHXrrjRt7mRpXk-4BAB5DP8ECIWe&index=5&ab_channel=CODEVILLAGE")

## Extensões Visual Studio Code

- Dart
- Flutter
- Awesome Flutter Snippets
- dart-import
- bloc

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

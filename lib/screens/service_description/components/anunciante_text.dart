import 'package:flutter/material.dart';

class AnuncianteText extends StatelessWidget {
  final String textAnunciante;
  final String textTipo;
  final bool isSolicitante;
  final bool isEvento;

  const AnuncianteText(
      {Key key,
      @required this.textAnunciante,
      this.isSolicitante = false,
      this.isEvento = false,
      this.textTipo})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0),
      child: Row(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              isEvento && isSolicitante
                  ? '\n\nPessoas Cadastradas: ' +
                      '0' +
                      '\n\nSolicitante: ' +
                      textAnunciante +
                      '\n\nTipo: ' +
                      textTipo
                  : isEvento && isSolicitante == false
                      ? '\n\nPessoas Cadastradas: ' +
                          '0' +
                          '\n\nAnunciante: ' +
                          textAnunciante +
                          '\n\nTipo: ' +
                          textTipo
                      : isEvento == false && isSolicitante
                          ? '\n\nSolicitante: ' +
                              textAnunciante +
                              '\n\nTipo: ' +
                              textTipo
                          : 'Anunciante: ' +
                              textAnunciante +
                              '\n\nTipo: ' +
                              textTipo,
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2F2F3E)),
            ),
          )
        ],
      ),
    );
  }
}

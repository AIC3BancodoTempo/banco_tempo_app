import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:banco_do_tempo_app/screens/core/custom_text_form_field.dart';
import 'package:banco_do_tempo_app/screens/core/custom_form_submit_button.dart';

// Create a corresponding State class.
// This class holds data related to the form.
class CustomFormState extends StatelessWidget {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  final myFocusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(

      key: _formKey,
      child: Column(

        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(33.0, 108.0, 0.0, 1.0),
                child: Text(
                    'Responda!',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'DM Sans',
                        fontStyle: FontStyle.normal,
                        fontSize: 24)
                ),
              ),
            ),
          ),



          Align(
              child: CustomTextFormField(
                question: 'Pergunta A',
                hintText: 'Responda',
                onChanged: (value){

                },
              ),
          ),

          Align(
              child: CustomTextFormField(
                question: 'Pergunta B',
                hintText: 'Responda',
                onChanged: (value){

                },
              )
          ),

          Align(
              child: CustomTextFormField(
                question: 'Pergunta C',
                hintText: 'Responda',
                onChanged: (value){

                },
              ),
          ),

          Align(
              child: CustomTextFormField(
                question: 'Pergunta D',
                hintText: 'Responda',
                  onChanged: (value){
                  //print(value);
                  },
              ),
          ),



          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(33.0, 28.0, 33.0, 2.0),
                child: Text(
                  'Responda o quiz com base nos TERMOS para obtrer acesso!',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontFamily: 'DM Sans',
                      letterSpacing: 0.4,
                      fontSize: 14),
                ),


              ),
            ),
          ),
        Align(
          child: CustomFormSubmitButton(onPressed: (){
            if (_formKey.currentState.validate()) {
              final showSnackBar = ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Analisando respostas...')));
            }
          }),
        ),
        ],
      ),
    );
  }
}
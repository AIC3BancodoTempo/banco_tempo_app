import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';



// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
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
            alignment: Alignment.center,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(33.0, 10.0, 33.0, 2.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.deepPurple,

                          )
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.deepPurpleAccent,
                          )
                      ),
                      labelText: 'Pergunta A',
                      labelStyle: TextStyle(
                          color: myFocusNode.hasFocus ? Colors.black38 : Colors.black
                      ),
                      hintText: 'Resposta',
                      suffix: Icon(Icons.check,
                        color: Colors.deepPurpleAccent,
                        size: 15.0,
                      )
                  ),

                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Você esqueceu de responder';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ),


          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(33.0, 5.0, 33.0, 2.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.deepPurple,

                          )
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.deepPurpleAccent,
                          )
                      ),
                      labelText: 'Pergunta B',
                      labelStyle: TextStyle(
                          color: myFocusNode.hasFocus ? Colors.black38 : Colors.black
                      ),
                      hintText: 'Resposta',
                      suffix: Icon(Icons.check,
                        color: Colors.deepPurpleAccent,
                        size: 15.0,
                      )
                  ),

                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Você esqueceu de responder';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ),


          Align(
            alignment: Alignment.center,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(33.0, 5.0, 33.0, 2.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.deepPurple,

                          )
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.deepPurpleAccent,
                          )
                      ),
                      labelText: 'Pergunta C',
                      labelStyle: TextStyle(
                          color: myFocusNode.hasFocus ? Colors.black38 : Colors.black
                      ),
                      hintText: 'Resposta',
                      suffix: Icon(Icons.check,
                        color: Colors.deepPurpleAccent,
                        size: 15.0,
                      )
                  ),

                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Você esqueceu de responder';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ),


          Align(
            alignment: Alignment.center,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(33.0, 5.0, 33.0, 0.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.deepPurple,

                          )
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.deepPurpleAccent,
                          )
                      ),
                      labelText: 'Pergunta D',
                      labelStyle: TextStyle(
                          color: myFocusNode.hasFocus ? Colors.black38 : Colors.black
                      ),
                      hintText: 'Resposta',
                      suffix: Icon(Icons.check,
                        color: Colors.deepPurpleAccent,
                        size: 15.0,
                      )
                  ),

                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Você esqueceu de responder';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ),


          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
            child: SizedBox(
              height: 44,
              width: 305,
              child: RawMaterialButton(
                  fillColor: Color.fromRGBO(169,94,250,1),
                  splashColor: Color.fromRGBO(138,73,247,1),
                  shape: const StadiumBorder(),
                  onPressed: () {
                    // Validate returns true if the form is valid, or false
                    // otherwise.
                    if (_formKey.currentState.validate()) {
                      // If the form is valid, display a Snackbar.
                      Scaffold.of(context)
                          .showSnackBar(SnackBar(content: Text('Analisando respostas...')));
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'ACESSE',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(width: 8.0),
                      const Icon(
                        Icons.login_rounded,
                        color: Colors.white,
                      ),
                    ],
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
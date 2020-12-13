import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

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
    return MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          title: new Text('Descrição'),
          backgroundColor: Color(0xFFA95EFA),
        ),
        body: new SingleChildScrollView(
          child: new Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(25),
                      child: Text(
                          'Adicione uma habilidade, serviço ou o que está procurando.',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'DMSans',
                              fontStyle: FontStyle.normal,
                              fontSize: 23)),
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
                            )),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.deepPurpleAccent,
                            )),
                            labelText: 'Nome',
                            labelStyle: TextStyle(
                                color: myFocusNode.hasFocus
                                    ? Colors.black38
                                    : Colors.black45),
                            hintText: 'Resposta',
                            suffix: Icon(
                              Icons.check,
                              color: Colors.deepPurpleAccent,
                              size: 15.0,
                            )),
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
                            )),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.deepPurpleAccent,
                            )),
                            labelText: 'Quantia em Horas',
                            labelStyle: TextStyle(
                                color: myFocusNode.hasFocus
                                    ? Colors.black38
                                    : Colors.black45),
                            hintText: 'Resposta',
                            suffix: Icon(
                              Icons.check,
                              color: Colors.deepPurpleAccent,
                              size: 15.0,
                            )),
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
                            )),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.deepPurpleAccent,
                            )),
                            labelText: 'Descrição',
                            labelStyle: TextStyle(
                                color: myFocusNode.hasFocus
                                    ? Colors.black38
                                    : Colors.black45),
                            hintText: 'Resposta',
                            suffix: Icon(
                              Icons.check,
                              color: Colors.deepPurpleAccent,
                              size: 15.0,
                            )),
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
                            )),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.deepPurpleAccent,
                            )),
                            labelText: 'Quantidade Disponível',
                            labelStyle: TextStyle(
                                color: myFocusNode.hasFocus
                                    ? Colors.black38
                                    : Colors.black45),
                            hintText: 'Resposta',
                            suffix: Icon(
                              Icons.check,
                              color: Colors.deepPurpleAccent,
                              size: 15.0,
                            )),
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
                SizedBox(height: 50.0),
                Wrap(
                  spacing: 100.0,
                  children: <Widget>[
                    new Text('Anexe uma Foto',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'DM Sans',
                            fontStyle: FontStyle.normal,
                            fontSize: 16)),
                    new FloatingActionButton(
                        heroTag: "btn",
                        backgroundColor: Color(0xFFBA7AFF),
                        child: Icon(Icons.add),
                        onPressed: () {}),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
                  child: SizedBox(
                    height: 44,
                    width: 305,
                    child: RawMaterialButton(
                        fillColor: Color.fromRGBO(169, 94, 250, 1),
                        splashColor: Color.fromRGBO(138, 73, 247, 1),
                        shape: const StadiumBorder(),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'CADASTRAR',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(width: 8.0),
                            const Icon(
                              Icons.login_rounded,
                              color: Colors.white,
                            ),
                          ],
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

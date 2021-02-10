/// Flutter code sample for AppBar

// This sample shows an [AppBar] with two simple actions. The first action
// opens a [SnackBar], while the second action navigates to a new page.

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatelessWidget(),
    );
  }
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

void openPage(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Next page'),
        ),
        body: const Center(
          child: Text(
            'This is the next page',
            style: TextStyle(fontSize: 24),
          ),
        ),
      );
    },
  ));
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: const Text('Serviços/Habilidades'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Show Snackbar',
            onPressed: () {
              scaffoldKey.currentState.showSnackBar(snackBar);
            },
          ),
        ],
      ),
      body: GridView.count(
        scrollDirection: Axis.vertical,
        crossAxisCount: 2,
        children: <Widget>[
          Card(
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(5.0),
              child: Column(
                children: <Widget>[
                  Image.network(
                      "https://flutter.io/images/catalog-widget-placeholder.png"),
                  Text('Aula de Yoga'),
                  Text('1 Hora'),
                  Text('1 unid'),
                ],
              ),
            ),
          ),
          Card(
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(5.0),
              child: Column(
                children: <Widget>[
                  Image.network(
                      "https://flutter.io/images/catalog-widget-placeholder.png"),
                  Text('Aula de Yoga'),
                  Text('1 Hora'),
                  Text('1 unid'),
                ],
              ),
            ),
          ),
          Card(
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(5.0),
              child: Column(
                children: <Widget>[
                  Image.network(
                      "https://flutter.io/images/catalog-widget-placeholder.png"),
                  Text('Aula de Yoga'),
                  Text('1 Hora'),
                  Text('1 unid'),
                ],
              ),
            ),
          ),
          Card(
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(5.0),
              child: Column(
                children: <Widget>[
                  Image.network(
                      "https://flutter.io/images/catalog-widget-placeholder.png"),
                  Text('Aula de Yoga'),
                  Text('1 Hora'),
                  Text('1 unid'),
                ],
              ),
            ),
          ),
          Card(
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(5.0),
              child: Column(
                children: <Widget>[
                  Image.network(
                      "https://flutter.io/images/catalog-widget-placeholder.png"),
                  Text('Aula de Yoga'),
                  Text('1 Hora'),
                  Text('1 unid'),
                ],
              ),
            ),
          ),
          Card(
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(5.0),
              child: Column(
                children: <Widget>[
                  Image.network(
                      "https://flutter.io/images/catalog-widget-placeholder.png"),
                  Text('Aula de Yoga'),
                  Text('1 Hora'),
                  Text('1 unid'),
                ],
              ),
            ),
          ),
          Card(
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(5.0),
              child: Column(
                children: <Widget>[
                  Image.network(
                      "https://s2.glbimg.com/mt2ZAIMajmuU8h5k8EhvOp1nd9c=/0x0:694x391/695x392/s.glbimg.com/po/tt2/f/original/2014/04/24/ps41.jpg"),
                  Text('Aula de Yoga'),
                  Text('1 Hora'),
                  Text('1 unid'),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.purple),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(title: Text("item 1"), onTap: () {}),
          ],
        ),
      ),
    );
  }
}

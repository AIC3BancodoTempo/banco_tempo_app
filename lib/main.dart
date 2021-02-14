import 'package:flutter/material.dart';
import 'components/sidebar_admin.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),//ThemeData
      home: Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),//AppBar
        drawer:SideBarAdm(),
        body: Center(
      child: const Text('Inicial'),
    ),
      ),
    );
  }
}
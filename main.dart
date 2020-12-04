import 'dart:convert';

import 'package:app/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  MenuModel _model = MenuModel();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async{
    var response = await http.get(Config.api_URL);
    if(response.statusCode == 200){
      var data = MenuModel.formJson(jsonDecode(response.body));
      setState(() {
        _model = data;
        _isLoading = true;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('demo'),
        ),
        body: _isLoading ? Column(
          children: [
            SizedBox(height: 30,),
            Text(_model.desc),
            SizedBox(height: 30,),
            ..._model.footer_column_menu.map((item) => Column(
              children: [
                Text('menu title : ${item.menu_title}'),
                SizedBox(height: 30,),
                ...item.sub_menu.map((sub) => Text('sub menu : ${sub.sub_menu_title}'))
              ],
            )),
            SizedBox(height: 30,),
          ],
        ) : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

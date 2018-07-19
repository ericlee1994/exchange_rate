import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Exchange Rate Util',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Exchange Rate Tab'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new ListView(children: <Widget>[
      new Container(
          padding: const EdgeInsets.all(5.0),
          child: new Row(children: <Widget>[
            new Expanded(
                child: new Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Icon(Icons.ac_unit),
                new Image.asset(name),
                new Text('CNH', ),
              ],
            )),
            new Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  new Text("0.00"),
                  new Text('人民币'),
                ]),
          ])),
      new Container(
          padding: const EdgeInsets.all(5.0),
          child: new Row(children: <Widget>[
            new Expanded(
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Icon(Icons.ac_unit),
                    new Text('JPY'),
                  ],
                )),
            new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text("0.00"),
                  new Text('日元'),
                ]),
          ])),
      new Container(
          padding: const EdgeInsets.all(5.0),
          child: new Row(children: <Widget>[
            new Expanded(
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Icon(Icons.ac_unit),
                    new Text('USD'),
                  ],
                )),
            new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text("0.00"),
                  new Text('美元'),
                ]),
          ]))
    ]));
  }
}

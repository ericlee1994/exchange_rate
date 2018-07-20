import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'rates.dart';

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
  var _result = "unknown";

  final TextEditingController _textController_JPY = new TextEditingController();
  final TextEditingController _textController_CNH = new TextEditingController();
  final TextEditingController _textController_USA = new TextEditingController();

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
                new Image.asset('images/china.png'),
                new Text(
                  'CNH',
                ),
              ],
            )),
            new Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  new Text('$_result.'),
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
                new Image.asset('images/japan.png'),
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
                new Image.asset('images/usa.png'),
                new Text('USD'),
              ],
            )),
            new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text("0.00"),
                  new Text('美元'),
                ]),
          ])),
      new Container(
          padding: const EdgeInsets.all(5.0),
          child: new Row(children: <Widget>[
            new Expanded(
              flex: 1,
              child: new Container(
                  color: Colors.blue,
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Image.asset('images/usa.png'),
                      new Text('USD'),
                    ],
                  )),
            ),
            new Expanded(
              flex: 3,
              child: new Container(
                  color: Colors.red,
                  child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        new TextField(
                          textAlign: TextAlign.end,
                          controller: _textController_CNH,
                          keyboardType: TextInputType.number,
                          onChanged: (String text) {
                            setState(() {
                              _textController_CNH.text = text;
                              _getRemoteData();
                            });
                          },
                          style: new TextStyle(
                            color: Colors.black26,
                              fontWeight: FontWeight.w500, fontSize: 20.0),
                          decoration: new InputDecoration(hintText: "100.00"),
                        ),
                        new Text('美元'),
                      ])),
            )
          ])),
    ]));
  }
  _getRemoteData() async {
    var url = 'http://web.juhe.cn:8080/finance/exchange/rmbquot?key=66084a03c9cdabe966c5f719343e4833';
    var httpClient = new HttpClient();
    
    String result;
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var responese = await request.close();
      if (responese.statusCode == HttpStatus.OK) {
        var json = await responese.transform(UTF8.decoder).join();
        var data = JSON.decode(json);
        var list = new Rate_Bean.fromJson(data);

        for (var x in list.result) {
          if(x.data1.name == "美元") {
            result = x.data1.bankConversionPri;
            print(result);
          }
        }
      }
    }catch(exception) {
      result = 'Failed';
    }

    setState(() {
      _result = result;
    });
  }
}

import 'package:calculator/utilities/routes.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      home: MyHomePage(),
      routes: Routes.routes,
    );
  }
}

class MyHomePage extends StatefulWidget {
  static String get tag => null;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "AC") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+/-") {
      confirmDialog1(context).then((bool value) {});
    } else if (buttonText == "%") {
      confirmDialog1(context).then((bool value) {});
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "x") {
      num1 = double.parse(output);
      operand = buttonText;

      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      if (operand == "x") {
        _output = (num1 * num2).toString();
      }
    } else {
      _output = _output + buttonText;
    }

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  buttonLongPressed() {
    Navigator.of(context).pushNamed("/SecretPage");
  }

  Widget buildButton(String buttonText, Color color) {
    return GestureDetector(
      child: RaisedButton(
        padding: EdgeInsets.all(30.0),
        shape: CircleBorder(),
        color: color,
        child: Text(
          buttonText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          buttonPressed(buttonText);
        },
      ),
      onLongPress: () {
        if (buttonText == ".") {
          buttonLongPressed();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(
                  vertical: 50.0,
                  horizontal: 24.0,
                ),
                child: Text(output,
                    style: TextStyle(
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold,
                    ))),
            SizedBox(
              height: 50.0,
            ),
            Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        buildButton("AC", Colors.blueAccent),
                        buildButton("+/-", Colors.blueAccent),
                        buildButton("%", Colors.blueAccent),
                        buildButton("/", Colors.blueAccent),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        buildButton("7", Colors.black45),
                        buildButton("8", Colors.black45),
                        buildButton("9", Colors.black45),
                        buildButton("x", Colors.blueAccent),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        buildButton("4", Colors.black45),
                        buildButton("5", Colors.black45),
                        buildButton("6", Colors.black45),
                        buildButton("-", Colors.blueAccent),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        buildButton("1", Colors.black45),
                        buildButton("2", Colors.black45),
                        buildButton("3", Colors.black45),
                        buildButton("+", Colors.blueAccent),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        buildButton("0", Colors.black45),
                        buildButton("00", Colors.black45),
                        buildButton(".", Colors.black45),
                        buildButton("=", Colors.blueAccent),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> confirmDialog1(BuildContext context) {
    return showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("We will return in a moment"),
            actions: <Widget>[
              FlatButton(
                child: Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}

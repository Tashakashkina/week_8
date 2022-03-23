import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    Widget _closeIcon() {
      return Padding(
        padding: EdgeInsets.only(top: 70),
        child: Container(
          child: Align(
            child: RaisedButton(
                color: Colors.amber,
                splashColor: Colors.orange,
                highlightColor: Colors.orange,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
        ),
      );
    }

    Widget _okayText() {
      return Padding(
        padding: EdgeInsets.only(top: 100),
        child: Align(
          child: Text('Форма успешно отправлена!',
              style: TextStyle(fontSize: 23, color: Colors.brown[900])),
        ),
      );
    }

    Widget _catPrint() {
      return Padding(
          padding: EdgeInsets.only(top: 70),
          child: Image.asset('assets/images/cat.png'));
    }

    return Scaffold(
      body: Column(children: <Widget>[_okayText(), _closeIcon(), _catPrint()]),
    );
  }
}

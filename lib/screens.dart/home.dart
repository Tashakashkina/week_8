import 'package:flutter/material.dart';

import 'filed.dart';

enum GenderList { male, female }

class MyForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyFormState();
}

class MyFormState extends State {
  final _formKey = GlobalKey<FormState>();
  GenderList _gender = GenderList.female;
  bool _check_1 = false;
  bool _check_2 = false;
  bool _check_3 = false;

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Text(
              'Данные владельца:',
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5.0),
            TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Имя владельца'),
                validator: (value) {
                  if (value!.isEmpty) return 'Введите имя владельца';
                }),
            SizedBox(height: 10.0),
            TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Телефон'),
                validator: (value) {
                  if (value!.isEmpty)
                    return 'Пожалуйста, введите номер телефона';
                  if (!value.contains('+7')) return 'Введите номер с +7';
                }),
            SizedBox(height: 10.0),
            TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Электронная почта'),
                validator: (value) {
                  if (value!.isEmpty)
                    return 'Пожалуйста, введите адрес электронной почты';
                  if (!value.contains('@')) return 'Это не E-mail';
                }),
            SizedBox(height: 10.0),
            Text(
              'Данные питомца:',
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5.0),
            TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Порода питомца'),
                validator: (value) {
                  if (value!.isEmpty)
                    return 'Пожалуйста, введите породу питомца';
                }),
            SizedBox(height: 10.0),
            TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Кличка'),
                validator: (value) {
                  if (value!.isEmpty) return 'Пожалуйста, введите имя питомца';
                }),
            SizedBox(height: 5.0),
            Text(
              'Выберите пол:',
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
            RadioListTile(
              title: const Text('Самец', style: TextStyle(fontSize: 15.0)),
              value: GenderList.male,
              groupValue: _gender,
              onChanged: (GenderList? value) {
                setState(() {
                  _gender = value!;
                });
              },
            ),
            RadioListTile(
              title: const Text('Самка', style: TextStyle(fontSize: 15.0)),
              value: GenderList.female,
              groupValue: _gender,
              onChanged: (GenderList? value) {
                setState(() {
                  _gender = value!;
                });
              },
            ),
            SizedBox(height: 10.0),
            Text('Тип кормления (можно выбрать несколько):',
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)),
            CheckboxListTile(
                value: _check_1,
                title: Text('Сухой корм', style: TextStyle(fontSize: 15.0)),
                onChanged: (bool? value) => setState(() => _check_1 = value!)),
            SizedBox(height: 3.0),
            CheckboxListTile(
                value: _check_2,
                title: Text('Влажный корм', style: TextStyle(fontSize: 15.0)),
                onChanged: (bool? value) => setState(() => _check_2 = value!)),
            SizedBox(height: 3.0),
            CheckboxListTile(
                value: _check_3,
                title:
                    Text('Натуральный корм', style: TextStyle(fontSize: 15.0)),
                onChanged: (bool? value) => setState(() => _check_3 = value!)),
            RaisedButton(
                child: Text(
                  'Сохранить',
                ),
                color: Colors.amber[400],
                textColor: Colors.black,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Color? color = Colors.red;
                    String text;
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailScreen();
                    }));
                  }
                })
          ],
        ),
      ),
    );
  }
}

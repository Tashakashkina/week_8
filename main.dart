import 'package:flutter/material.dart';

import 'screens.dart/home.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.amber),
    home: Scaffold(
      appBar: AppBar(
        title: Text('Анкета'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(child: MyForm()),
    )));

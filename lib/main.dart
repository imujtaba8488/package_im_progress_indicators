import 'package:flutter/material.dart';

import 'package:country_currency_chooser/im_progress_indicators.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool requestFold = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Colors.deepPurple,
          ),
        ),
      ),
      home: Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () => showDialog(
            context: context,
            builder: (context) => LinearProgressIndicator01(),
          ),
          child: Text('Select Currency'),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter/simple/Counter.dart';

import 'widgets/CounteApp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Counter(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: NavigationListPage(),
      ),
    );
  }
}

class NavigationListPage extends StatelessWidget {
  const NavigationListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(children: [
        TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CounteApp()));
          },
          child: const Text("Counter App"),
        ),
      ]),
    );
  }
}

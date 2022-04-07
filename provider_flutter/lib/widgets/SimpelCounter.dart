import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../simple/Counter.dart';

class MyHomePage extends StatelessWidget {
  int _count = 0;
  void _incrementCounter() {}
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Consumer<Counter>(builder: (context, val, child) {
            return Text(
              '${val.counter}',
              style: const TextStyle(fontSize: 25.0),
            );
          })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Provider.of<Counter>(context, listen: false).increment(),
        child: const Icon(Icons.add),
      ),
    );
  }
}

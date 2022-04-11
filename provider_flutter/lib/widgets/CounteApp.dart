import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../simple/Counter.dart';

class CounteApp extends StatelessWidget {
  const CounteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('Buil Call');
    }
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Consumer<Counter>(builder: (context, provideCounter, child) {
          return Column(
            children: [
              Text(
                '${provideCounter.counter}',
                style: const TextStyle(fontSize: 25.0),
              ),
              Switch(
                  value: provideCounter.ononValue,
                  onChanged: (sw) => provideCounter.onOff(sw)),
              Checkbox(
                  value: provideCounter.checkBox,
                  onChanged: (cb) => provideCounter.checkBoxChange(cb!)),
              TextButton(
                onPressed: () {
                  bool checkValue = provideCounter.checkBox;
                  bool switchValu = provideCounter.ononValue;
                  modalBottomSheet(
                      context, provideCounter, switchValu, checkValue);
                },
                child: const Text("Bottom Sheet"),
              )
            ],
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Provider.of<Counter>(context, listen: false).increment(),
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<dynamic> modalBottomSheet(BuildContext context, Counter provideCounter,
      bool switchValu, bool checkValue) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            children: [
              Text(
                '${provideCounter.counter}',
                style: const TextStyle(fontSize: 25.0),
              ),
              StatefulBuilder(
                builder: (context, setState) => Switch(
                    value: switchValu,
                    onChanged: (sw) {
                      setState(() => switchValu = sw);
                      provideCounter.onOff(sw);
                    }),
              ),
              StatefulBuilder(
                builder: (context, setState) => Checkbox(
                    value: checkValue,
                    onChanged: (cb) {
                      setState(() => checkValue = cb!);
                      provideCounter.checkBoxChange(cb!);
                    }),
              ),
            ],
          );
        });
  }
}

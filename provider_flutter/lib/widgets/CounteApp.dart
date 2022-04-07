import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../simple/Counter.dart';

class CounteApp extends StatelessWidget {
  const CounteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  showModalBottomSheet(
                      enableDrag: false,
                      context: context,
                      builder: (context) {
                        return Consumer<Counter>(builder: (context, provideCounter, child){
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
                                  onChanged: (cb) =>
                                      provideCounter.checkBoxChange(cb!)),
                            ],
                          ),
                        );
                      });
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
}

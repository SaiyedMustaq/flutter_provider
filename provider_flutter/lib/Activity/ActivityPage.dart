import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter/Activity/provider/ActivityProvider.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  late ActivityProvider activityProvider;
  @override
  void initState() {
    final activityProvider =
        Provider.of<ActivityProvider>(context, listen: false);

    activityProvider.getActivity(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dataModel = Provider.of<ActivityProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Activity Page')),
      body: dataModel.isLoading
          ? Center(
              child: TextLiquidFill(
                text: 'Loading...',
                waveColor: Colors.blueAccent,
                boxBackgroundColor: Colors.white,
                //boxHeight: double.infinity,
                waveDuration: Duration(seconds: 1),
                textStyle: const TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : ListView.builder(
              itemCount: 1,
              itemBuilder: (context, position) {
                return ListTile(
                  leading: Text(dataModel.activityModel.status!.toString()),
                  title: Text(
                    dataModel.activityModel.title.toString(),
                  ),
                  subtitle: Text(dataModel.activityModel.traceId!),
                );
              }),
    );
  }
}

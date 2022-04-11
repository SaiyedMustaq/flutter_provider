import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter/pagintaion/PhotoProvider.dart';
import 'package:provider_flutter/pagintaion/VideoListingPage.dart';
import 'package:provider_flutter/pagintaion/VideoProvider.dart';
import 'package:provider_flutter/simple/Counter.dart';

import 'Activity/ActivityPage.dart';
import 'Activity/provider/ActivityProvider.dart';

import 'pagintaion/PaginationProviderPage.dart';
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
        ChangeNotifierProvider<ActivityProvider>(
          create: (_) => ActivityProvider(),
        ),
        ChangeNotifierProvider<PhotoProvider>(create: (_) => PhotoProvider()),
        ChangeNotifierProvider<VideoProvider>(create: (_) => VideoProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const NavigationListPage(),
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
        TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ActivityPage()));
          },
          child: const Text("Api Call"),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PaginationProviderPage()));
          },
          child: const Text("Photo"),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => VideoPlayerPage()));
          },
          child: const Text("Video"),
        ),
      ]),
    );
  }
}

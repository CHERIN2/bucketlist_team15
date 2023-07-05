import 'package:flutter/material.dart';

import 'homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /** debugShowCheckedModeBanner는 에뮬레이터에 오른쪽 맨위에 DEBUG 띠 삭제를 위해 추가하였습니다 */
      debugShowCheckedModeBanner: false,
      title: 'BucketList_team15',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(name: 'LUNA'),
    );
  }
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Luna828 git branch',
          ),
          Text(
            '',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    ), // This trailing comma makes auto-formatting nicer for build methods.
  );
}

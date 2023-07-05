import 'package:bucketlist_team15/service/bucketList_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homePage.dart';

late SharedPreferences prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => BucketService())],
      child: const MyApp(),
    ),
  );
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
      home: const MyHomePage(),
    );
  }
}

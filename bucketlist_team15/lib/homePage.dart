import 'package:bucketlist_team15/BucketList.dart';
import 'package:bucketlist_team15/service/bucketList_service.dart';
import 'package:bucketlist_team15/widget/bucketListTile.dart';
import 'package:bucketlist_team15/widget/createDialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<BucketService>(builder: (context, bucketService, child) {
      List<BucketList> bucketList = bucketService.bucketList;

      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Bucket  List",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: bucketList.length,
                    itemBuilder: (context, index) {
                      return bucketListTile(index: index);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(225, 217, 183, 219),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return createDialog(service: bucketService);
                });
          },
          tooltip: '버킷리스트 추가하기',
          child: const Icon(
            Icons.add,
            size: 30,
          ),
        ),
      );
    });
  }
}

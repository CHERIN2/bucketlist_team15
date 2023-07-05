import 'package:bucketlist_team15/BucketList.dart';
import 'package:bucketlist_team15/widget/bucketListTile.dart';
import 'package:bucketlist_team15/widget/createDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.name});

  final String name;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool? isChecked = false;

  List<BucketList> bucketLists = [
    BucketList(content: "유럽가기"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "${widget.name}님,\n꿈을 향해 걸어나가봐요!",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              ),
              Expanded(
                child: ListView(
                  children: [
                    ...bucketListWidgets(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return createDialog();
              });
        },
        tooltip: '버킷리스트 추가하기',
        child: const Icon(Icons.add),
      ),
    );
  }

  List<Widget> bucketListWidgets() {
    List<Widget> lists = [];
    for (BucketList bucketList in bucketLists) {
      lists.add(bucketListTile(bucketList: bucketList));
    }
    return lists;
  }
}

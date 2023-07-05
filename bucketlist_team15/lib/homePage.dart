import 'package:bucketlist_team15/BucketList.dart';
import 'package:bucketlist_team15/service/bucketList_service.dart';
import 'package:bucketlist_team15/widget/bucketListTile.dart';
import 'package:bucketlist_team15/widget/createDialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.name});

  final String name;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<BucketService>(
      builder: (context, bucketService, child) {
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
                    "${widget.name}님,\n꿈을 향해 걸어나가봐요!",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: bucketList.length,
                      itemBuilder: (context, index){
                        BucketList bucket = bucketList[index];
                        return bucketListTile(bucketList: bucket);
                      },
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
    );
  }
}

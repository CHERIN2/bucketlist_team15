import 'package:bucketlist_team15/BucketList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../service/bucketList_service.dart';

class bucketListTile extends StatefulWidget {
  bucketListTile({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  State<bucketListTile> createState() => _bucketListTileState();
}

class _bucketListTileState extends State<bucketListTile> {

  @override
  Widget build(BuildContext context) {
    BucketService bucketService = context.read<BucketService>();

    return ListTile(
      // checkBox
      leading: Checkbox(
        value: bucketService.bucketList[widget.index].isChecked,
        onChanged: (value) {
          bucketService.bucketList[widget.index].isChecked = value!;
          bucketService.isCheckedBucket(index: widget.index, value: value);
        },
      ),
      // content
      title: Text(bucketService.bucketList[widget.index].content),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 수정
          IconButton(
            icon: Icon(Icons.edit),
            iconSize: 30,
            onPressed: () {},
            color: Colors.black,
          ),
          // 삭제
          IconButton(
            icon: Icon(Icons.delete),
            iconSize: 30,
            onPressed: () {},
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
import 'package:bucketlist_team15/BucketList.dart';
import 'package:bucketlist_team15/service/bucketList_service.dart';
import 'package:bucketlist_team15/widget/editDialog.dart';
import 'package:flutter/material.dart';

class bucketListTile extends StatefulWidget {
  bucketListTile(
      {Key? key, required this.service, this.bucketList, required this.index})
      : super(key: key);

  BucketService service;
  BucketList? bucketList;
  int index;

  @override
  State<bucketListTile> createState() => _bucketListTileState();
}

class _bucketListTileState extends State<bucketListTile> {
  BucketList? bucketList;

  @override
  void initState() {
    super.initState();
    bucketList = widget.bucketList;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // checkBox
      leading: Checkbox(
        fillColor: MaterialStatePropertyAll(Colors.cyan),
        value: bucketList!.isChecked,
        onChanged: (value) {
          bucketList!.isChecked = value!;
          setState(() {});
        },
      ),
      // content
      title: Text(bucketList!.content),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 수정
          IconButton(
            icon: Icon(Icons.edit),
            iconSize: 30,
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return editDialog(
                        service: widget.service, index: widget.index);
                  });
            },
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

  State<bucketListTile> createState() => _bucketListTile();
}

class _bucketListTile extends State<bucketListTile> {
  BucketList? bucketList;

  @override
  void initState() {
    super.initState();
    bucketList = widget.bucketList;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // checkBox
      leading: Checkbox(
        value: bucketList!.isChecked,
        fillColor: MaterialStatePropertyAll(Colors.cyan),
        onChanged: (value) => {bucketList!.isChecked = value!},
      ),
      // content
      title: Text(bucketList!.content),
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

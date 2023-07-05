import 'package:bucketlist_team15/BucketList.dart';
import 'package:flutter/material.dart';

class bucketListTile extends StatefulWidget {
  bucketListTile({Key? key, required this.bucketList}) : super(key: key);
  BucketList? bucketList;

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
            onPressed: (){},
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
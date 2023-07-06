import 'package:bucketlist_team15/BucketList.dart';
import 'package:bucketlist_team15/service/bucketList_service.dart';
import 'package:bucketlist_team15/widget/deleteDialog.dart';
import 'package:bucketlist_team15/widget/editDialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class bucketListTile extends StatefulWidget {
  bucketListTile({Key? key, required this.index}) : super(key: key);

  int index;

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
        fillColor: MaterialStatePropertyAll(Colors.cyan),
        value: bucketService.bucketList[widget.index].isChecked,
        onChanged: (value) {},
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
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return editDialog(
                        service: bucketService, index: widget.index);
                  });
            },
            color: Colors.black,
          ),
          // 삭제
          IconButton(
            icon: Icon(Icons.delete),
            iconSize: 30,
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return deleteDialog(
                        service: bucketService, index: widget.index);
                  });
            },
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}

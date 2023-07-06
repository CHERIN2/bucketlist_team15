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

    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListTile(
        // checkBox
        tileColor: const Color.fromARGB(255, 235, 227, 227),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        leading: Checkbox(
          fillColor:
              MaterialStatePropertyAll(Color.fromARGB(255, 116, 17, 155)),
          value: bucketService.bucketList[widget.index].isChecked,
          onChanged: (value) {
            // bucketService.bucketList[widget.index].isChecked = value!;
            // bucketService.isCheckedBucket(index: widget.index, value: value);
            bucketService.checkedBucket(index: widget.index);
          },
        ),
        // content
        title: Text(bucketService.bucketList[widget.index].content),
        titleTextStyle:
            TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
      ),
    );
  }
}

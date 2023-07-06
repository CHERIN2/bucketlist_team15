import 'package:bucketlist_team15/service/bucketList_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class editDialog extends StatefulWidget {
  editDialog({super.key, required this.service, required this.index});

  BucketService service;
  int index;

  @override
  State<editDialog> createState() => _editDialogState();
}

class _editDialogState extends State<editDialog> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: SizedBox(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 15),
            SizedBox(
              width: 250,
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: widget.service.bucketList[widget.index].content,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  onPressed: () {
                    widget.service.updateBucket(
                        index: widget.index, content: _textController.text);
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "수정",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "취소",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

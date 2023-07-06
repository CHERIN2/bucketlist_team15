import 'package:bucketlist_team15/service/bucketList_service.dart';
import 'package:flutter/material.dart';

class editDialog extends StatefulWidget {
  editDialog({super.key, required this.service, required this.index});

  BucketService service;
  int index;

  @override
  State<editDialog> createState() => _editDialogState();
}

class _editDialogState extends State<editDialog> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 15),
            SizedBox(
              width: 250,
              child: TextField(
                controller: textController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '수정할 내용을 입력해주세요',
                ),
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    widget.service.updateBucket(
                        index: widget.index, content: textController.text);
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "수정",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black)),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "취소",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
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

import 'package:bucketlist_team15/service/bucketList_service.dart';
import 'package:flutter/material.dart';

class deleteDialog extends StatefulWidget {
  deleteDialog({super.key, required this.service, required this.index});

  BucketService service;
  int index;

  @override
  State<deleteDialog> createState() => _deleteDialogState();
}

class _deleteDialogState extends State<deleteDialog> {
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
            Text("정말로 삭제하시겠습니까?"),
            SizedBox(
              width: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black)),
                    onPressed: () {
                      widget.service.deleteBucket(index: widget.index);
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "확인",
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
            )
          ],
        ),
      ),
    );
  }
}

import 'package:bucketlist_team15/BucketList.dart';
import 'package:bucketlist_team15/service/bucketList_service.dart';
import 'package:flutter/material.dart';

class createDialog extends StatefulWidget {
  const createDialog({super.key, required this.service});

  final BucketService service;

  @override
  State<createDialog> createState() => _createDialogState();
}

class _createDialogState extends State<createDialog> {
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
                    labelText: '목표를 작성해주세요',
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      widget.service.createBucket(content: textController.text);
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "생성",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                  ),
                  SizedBox(width: 10),
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
            ]),
      ),
    );
  }
}

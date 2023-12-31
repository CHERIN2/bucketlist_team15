import 'package:bucketlist_team15/service/bucketList_service.dart';
import 'package:flutter/material.dart';

class createDialog extends StatefulWidget {
  const createDialog({super.key, required this.service});

  final BucketService service;

  @override
  State<createDialog> createState() => _createDialogState();
}

class _createDialogState extends State<createDialog> {
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
                    labelText: '목표를 작성해주세요',
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
                      widget.service
                          .createBucket(content: _textController.text);
                      Navigator.pop(context);
                    },
                    child: Text(
                      "생성",
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
            ]),
      ),
    );
  }
}

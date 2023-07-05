import 'package:flutter/material.dart';

Widget bucketListTile() {
  return ListTile(
    // checkBox
    leading: Checkbox(
      value: false,
      onChanged: (value) => {},
    ),
    // content
    title: Text("버킷리스트"),
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

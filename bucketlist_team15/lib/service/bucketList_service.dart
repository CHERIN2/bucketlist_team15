import 'dart:convert';

import 'package:bucketlist_team15/BucketList.dart';
import 'package:bucketlist_team15/main.dart';
import 'package:flutter/material.dart';

class BucketService extends ChangeNotifier {
  BucketService() {
    // init data
    loadBucket();
  }

  List<BucketList> bucketList = [
    BucketList(content: "유럽 여행", isChecked: true),
    BucketList(content: "취업 성공", isChecked: false)
  ];

  // save
  saveBucket() {
    List bucketJson = bucketList.map((bucket) => bucket.toJson()).toList();
    String jsonString = jsonEncode(bucketJson);
    prefs.setString('bucketList', jsonString);
  }

  // load
  loadBucket() {
    String? jsonString = prefs.getString('bucketList');
    if (jsonString == null) return;
    List bucketJson = jsonDecode(jsonString);
    bucketList = bucketJson.map((json) => BucketList.froJson(json)).toList();
  }

  // create
  createBucket({required String content}) {
    BucketList bucket = BucketList(content: content);
    bucketList.add(bucket);
    notifyListeners();
    saveBucket();
  }

  // delete
  deleteBucket({required int index}) {
    bucketList.removeAt(index);
    notifyListeners();
    saveBucket();
  }

  // update
  updateBucket({required int index, required String content}) {
    BucketList bucket = bucketList[index];
    bucket.content = content;
    notifyListeners();
    saveBucket();
  }
}

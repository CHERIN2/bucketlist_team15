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
    BucketList(content: "유럽 여행", isChecked: false),
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
    bucketList.insert(0, bucket);
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

  // 은경
  isCheckedBucket({required int index, required bool value}) {
    BucketList bucket = bucketList[index];
    bucket.isChecked == !value;
    if (bucket.isChecked) {
      bucketList = [
        ...bucketList.where((element) => !element.isChecked),
        ...bucketList.where((element) => element.isChecked)
      ];
    } else {
      bucketList.removeAt(index);
      bucketList.insert(0, bucket);
    }
    notifyListeners();
    saveBucket();
  }

  // 진훈
  checkedBucket({required int index}) {
    BucketList bucket = bucketList[index];
    bucket.isChecked = bucket.isChecked ? false : true;
    bucketList.sort((first, second) {
      if (first.isChecked) {
        return 1;
      }
      return -1;
    });
    notifyListeners();
    saveBucket();
  }
}

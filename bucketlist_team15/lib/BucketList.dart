class BucketList {
  BucketList({required this.content, this.isChecked = false});

  String content;
  bool isChecked = false;

  Map toJson() {
    return {
      'content': content,
      'isChecked': isChecked,
    };
  }

  factory BucketList.froJson(json) {
    return BucketList(
      content: json['content'],
      isChecked: json['isChecked'],
    );
  }
}

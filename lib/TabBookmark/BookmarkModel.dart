// {"name": "땅콩", "path": "images/food4.png", "like": "123", "bookmark": "22"},

class BookmarkModel {
  String name;
  String path;
  String like;
  String bookmark;
  List<String> tags;

  BookmarkModel({this.name, this.path, this.like, this.bookmark, this.tags});

  BookmarkModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    path = json['path'];
    like = json['like'];
    bookmark = json['bookmark'];

    if (json['tags'] != null) {
      tags = <String>[];
      json['tags'].forEach((v) => tags.add(v));
    }
  }
}

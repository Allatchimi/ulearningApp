import 'dart:core';

class CourseRequestEntity{
  int? id;

  CourseRequestEntity({this.id});
  Map<String, dynamic> toJson() =>{ "id":id};
}

class SearchRequestEntity{
  String? search;
  SearchRequestEntity({this.search});
  Map<String,dynamic> toJson() => {"search": search};
}

class CourseListResponseEntity {
  final String code;
  final String msg;
  final List<CourseItem> data;

  CourseListResponseEntity({required this.code, required this.msg, required this.data});

  factory CourseListResponseEntity.fromJson(Map<String, dynamic> json) {
    return CourseListResponseEntity(
      code: json['code'],
      msg: json['msg'],
      data: List<CourseItem>.from(json['data'].map((item) => CourseItem.fromJson(item))),
    );
  }
}

//api post response msg
class CourseDetailResponseEntity{
  int? code;
  String? msg;
  CourseItem? data;

  CourseDetailResponseEntity({this.code, this.msg, this.data});
  factory CourseDetailResponseEntity.fromJson(Map<String, dynamic> json) =>
      CourseDetailResponseEntity(
        code: json["code"],
        msg: json["msg"],
        data: CourseItem.fromJson(json["data"]),
      );


  @override
  String toString() {
    return 'CourseDetailResponseEntity(code: $code, msg: $msg, data: $data)';
  }
}
// api post response msg
class AuthorResponseEntity{
  int? code;
  String? msg;
  AuthorItem? data;

  AuthorResponseEntity({this.code, this.msg, this.data});

  factory AuthorResponseEntity.fromJson(Map<String,dynamic> json) => 
      AuthorResponseEntity(
        code: json["code"],
        msg: json["msg"],
        data: AuthorItem.fromJson(json["data"]),
      );

}
class AuthorRequestEntity{
  String? token;

  AuthorRequestEntity({this.token});

  Map<String,dynamic> toJson()=>{
    "token": token,
  };
}
//login result
class AuthorItem{
  String? token;
  String? name;
  String? description;
  String? avatar;
  String? job;
  int? follow;
  int? score;
  String? download;
  bool? online;

  AuthorItem({this.token, this.name, this.description, this.avatar, this.job,
      this.follow, this.score, this.download, this.online});

  factory AuthorItem.fromJson(Map<String, dynamic> json) =>
      AuthorItem(
        token: json["token"],
        name: json["name"],
        description: json["description"],
        avatar: json["avatar"],
        job: json["job"],
        follow: json["follow"],
        score: json["score"],
        download: json["download"],
        online: json["online"],
      );

  Map<String,dynamic> toJson()=>{
    "token": token,
    "name": name,
    "description": description,
    "avatar": avatar,
    "job": job,
    "score":score,
    "online": online,
  };
}
// login result
class Category {
  int? categoryId;
  String? categoryName;
  String? description;

  Category({this.categoryId, this.categoryName, this.description});

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    categoryId: json["categoryId"],
    categoryName: json["categoryName"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "categoryId": categoryId,
    "categoryName": categoryName,
    "description": description,
  };
  @override
  String toString() {
    return 'Category('
        'categoryId: $categoryId, '
        'categoryName: $categoryName, '
        'description: $description'
        ')';
  }
}

class CourseItem {
  final int? id;
  final int? score;
  final int? lessonNum;
  final int? videoLen;
  final int? downNum;
  final int? follow;
  final String? userToken;
  final String? name;
  final String? description;
  final String? thumbnail;
  final String? video;
  final String? price;
  final String? amountTotal;
  final Category? categorie;

  CourseItem({
    this.id,
    this.score,
    this.lessonNum,
    this.videoLen,
    this.downNum,
    this.follow,
    this.userToken,
    this.name,
    this.description,
    this.thumbnail,
    this.video,
    this.price,
    this.amountTotal,
    this.categorie,
  });

  factory CourseItem.fromJson(Map<String, dynamic> json) {
    return CourseItem(
      id: json['id'],
      score: json['score'],
      lessonNum: json['lessonNum'],
      videoLen: json['videoLen'],
      downNum: json['downNum'],
      follow: json['follow'],
      userToken: json['userToken'],
      name: json['name'],
      description: json['description'],
      thumbnail: json['thumbnail'],
      video: json['video'],
      price: json['price'],
      amountTotal: json['amountTotal'],
      categorie: json['categorie'] != null
          ? Category.fromJson(json['categorie'])
          : null,
    );
  }
  // Method to convert CourseItem instance into JSON format
  Map<String, dynamic> toJson() => {
    'id': id,
    'score': score,
    'lessonNum': lessonNum,
    'videoLen': videoLen,
    'downNum': downNum,
    'follow': follow,
    'userToken': userToken,
    'name': name,
    'description': description,
    'thumbnail': thumbnail,
    'video': video,
    'price': price,
    'amountTotal': amountTotal,
    'categorie': categorie?.toJson(), // Assuming Category has a toJson method
  };
  @override
  String toString() {
    return 'CourseItem('
        'id: $id, '
        'score: $score, '
        'lessonNum: $lessonNum, '
        'videoLen: $videoLen, '
        'downNum: $downNum, '
        'follow: $follow, '
        'userToken: $userToken, '
        'name: $name, '
        'description: $description, '
        'thumbnail: $thumbnail, '
        'video: $video, '
        'price: $price, '
        'amountTotal: $amountTotal, '
        'categorie: ${categorie?.toString()}'
        ')';
  }


}

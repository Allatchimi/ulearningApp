import 'package:ulearning_app/common/models/course_entities.dart';

class LessonVideoItem {
  final String? name;
  final String? url;
  final String? thumbnail;
  final String? lessonName;
  final int? lessonId;
  final int? id;

  LessonVideoItem({this.name, this.url, this.thumbnail,this.lessonName,this.lessonId,this.id});
  factory LessonVideoItem.fromJson(Map<String, dynamic> json) =>
      LessonVideoItem(
        name: json["name"],
        url: json["url"],
        thumbnail: json["thumbnail"],
        lessonName: json["lessonName"],
        lessonId: json["lessonId"],
        id: json["id"]
      );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
    "thumbnail": thumbnail,
    "lessonName":lessonName,
    "lessonId": lessonId,
    "id":id
  };

  @override
  String toString() {
    return 'LessonVideoItem{name: $name, url: $url, thumbnail: $thumbnail, lessonName: $lessonName, lessonId: $lessonId, id: $id}';
  }
}

class LessonVideo {
  final List<LessonVideoItem> lessonItem;
  final Future<void>? initializeVideoPlayer;
  final bool isPlay;

  LessonVideo(
      {this.lessonItem = const <LessonVideoItem>[],
      this.initializeVideoPlayer,
      this.isPlay = false});
  LessonVideo copyWith(
      {List<LessonVideoItem>? lessonItem,
      Future<void>? initializeVideoPlayer,
      bool? isPlay}) {
    return LessonVideo(
        lessonItem: lessonItem ?? this.lessonItem,
        initializeVideoPlayer:
            initializeVideoPlayer ?? this.initializeVideoPlayer,
        isPlay: isPlay ?? this.isPlay);
  }
}

//login result
class LessonItem{
  String? name;
  String? thumbnail;
  String? description;
  int? id;

  LessonItem({this.name, this.thumbnail, this.description, this.id});
  factory LessonItem.fromJson(Map<String,dynamic> json)=>
    LessonItem(
      name: json["name"],
      description: json["description"],
      thumbnail: json["thumbnail"],
      id: json["id"]
  );
  Map<String,dynamic> toJson() => {
    "name": name,
    "description": description,
    "thumbnail": thumbnail,
    "id": id,
  };

  @override
  String toString() {
    return 'LessonItem{name: $name, thumbnail: $thumbnail, description: $description, id: $id}';
  }
}

class LessonDetailResponseEntity {
  int? code;
  String? msg;
  List<LessonVideoItem>? data;

  LessonDetailResponseEntity({this.code, this.msg, this.data});

  // Factory constructor to create an instance from JSON
  factory LessonDetailResponseEntity.fromJson(Map<String, dynamic> json) {
    return LessonDetailResponseEntity(
      code: json['code'] as int?,
      msg: json['msg'] as String?,
      data: json['data'] != null
          ? (json['data'] as List)
          .map((item) => LessonVideoItem.fromJson(item))
          .toList()
          : null,
    );
  }
}

class Lesson {
  final int? id;
  final String? name;
  final CourseItem? cour;
  final String? thumbnail;
  final String? description;
  final List<LessonVideoItem>? video;

  Lesson({
    this.id,
    this.name,
    this.cour,
    this.thumbnail,
    this.description,
    this.video,
  });

  // Factory method to create a Lesson instance from a JSON object
  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['id'] as int?,
      name: json['name'] as String?,
      cour: json['cour'] != null ? CourseItem.fromJson(json['cour']) : null,
      thumbnail: json['thumbnail'] as String?,
      description: json['description'] as String?,
      video: (json['video'] as List<dynamic>?)
          ?.map((item) => LessonVideoItem.fromJson(item))
          .toList(),
    );
  }

  // Method to convert a Lesson instance into a JSON object
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'cour': cour?.toJson(),
    'thumbnail': thumbnail,
    'description': description,
    'video': video?.map((item) => item.toJson()).toList(),
  };

  @override
  String toString() {
    return 'Lesson{id: $id, name: $name, cour: $cour, thumbnail: $thumbnail, description: $description, video: $video}';
  }
}

class LessonResponseEntity {
  final int? code;
  final String? msg;
  final LessonItem? data;

  LessonResponseEntity({this.code, this.msg, this.data});

  // Factory constructor to create an instance from JSON
  factory LessonResponseEntity.fromJson(Map<String, dynamic> json) {
    return LessonResponseEntity(
      code: json['code'] as int?,
      msg: json['msg'] as String?,
      data: json['data'] != null ? LessonItem.fromJson(json['data']) : null,
    );
  }

  // Convert object to JSON
  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'msg': msg,
      'data': data?.toJson(),
    };
  }
}

class LessonListResponseEntity {
  int? code;
  String? msg;
  List<LessonItem>? data;


  LessonListResponseEntity(
      {this.code,
      this.msg,
      this.data});// Factory constructor to create an instance from JSON
  factory LessonListResponseEntity.fromJson(Map<String, dynamic> json) {
    return LessonListResponseEntity(
      code: json['code'] as int?,
      msg: json['msg'] as String?,
      data: json['data'] != null ? List<LessonItem>.from(json['data']) : null,
    );
  }

}

class LessonRequestEntity {
  int? lessonId;
  //final String? additionalInfo; // Example: Any additional data you want to send with the request

  LessonRequestEntity({this.lessonId, /*this.additionalInfo*/});

  // Convert object to JSON
  Map<String, dynamic> toJson() {
    return {
      'lessonId': lessonId,
      //'additionalInfo': additionalInfo,
    };
  }
}




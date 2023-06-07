import 'dart:convert';

PhotosModel photosModelFromJson(String str) =>
    PhotosModel.fromJson(json.decode(str));

String photosModelToJson(PhotosModel data) => json.encode(data.toJson());

class PhotosModel {
  final bool success;
  final String message;
  final int offset;
  final int limit;
  final List<Photo> photos;

  PhotosModel({
    required this.success,
    required this.message,
    required this.offset,
    required this.limit,
    required this.photos,
  });

  PhotosModel copyWith({
    bool? success,
    String? message,
    int? offset,
    int? limit,
    List<Photo>? photos,
  }) =>
      PhotosModel(
        success: success ?? this.success,
        message: message ?? this.message,
        offset: offset ?? this.offset,
        limit: limit ?? this.limit,
        photos: photos ?? this.photos,
      );

  factory PhotosModel.fromJson(Map<String, dynamic> json) => PhotosModel(
        success: json["success"],
        message: json["message"],
        offset: json["offset"],
        limit: json["limit"],
        photos: List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "offset": offset,
        "limit": limit,
        "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
      };
}

class Photo {
  final String description;
  final String url;
  final String title;
  final int user;
  final int id;

  Photo({
    required this.description,
    required this.url,
    required this.title,
    required this.user,
    required this.id,
  });

  Photo copyWith({
    String? description,
    String? url,
    String? title,
    int? user,
    int? id,
  }) =>
      Photo(
        description: description ?? this.description,
        url: url ?? this.url,
        title: title ?? this.title,
        user: user ?? this.user,
        id: id ?? this.id,
      );

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        description: json["description"],
        url: json["url"],
        title: json["title"],
        user: json["user"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "url": url,
        "title": title,
        "user": user,
        "id": id,
      };
}

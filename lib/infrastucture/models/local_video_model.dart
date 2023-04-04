import 'dart:convert';

import 'package:toktik/domain/entities/video_post.dart';

List<LocalVideoModel> localVideoModelFromJson(String str) =>
    List<LocalVideoModel>.from(
        json.decode(str).map((x) => LocalVideoModel.fromJson(x)));

String localVideoModelToJson(List<LocalVideoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LocalVideoModel {
  LocalVideoModel({
    required this.name,
    required this.videoUrl,
    required this.likes,
    required this.views,
  });

  final String name;
  final String videoUrl;
  final int likes;
  final int views;

  factory LocalVideoModel.fromJson(Map<String, dynamic> json) =>
      LocalVideoModel(
        name: json["name"] ?? 'No name',
        videoUrl: json["videoUrl"],
        likes: json["likes"] ?? 0,
        views: json["views"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "videoUrl": videoUrl, 
        "likes": likes,
        "views": views,
      };

  VideoPost toVideoPostEntity() => VideoPost(
        caption: name,
        videoUrl: videoUrl,
        likes: likes,
        views: views,
      );
}

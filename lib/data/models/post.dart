import 'package:freezed_annotation/freezed_annotation.dart';

// Post postFromJson(String str) => Post.fromJson(json.decode(str));

// String postToJson(Post data) => json.encode(data.toJson());

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  factory Post({
    required int userId,
    required int id,
    required String title,
    required String body,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}

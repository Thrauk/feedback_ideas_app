/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class IdeaComment implements _i1.SerializableModel {
  IdeaComment._({
    required this.id,
    required this.uuid,
    required this.authorUuid,
    required this.ideaUuid,
    required this.postedAt,
    required this.content,
  });

  factory IdeaComment({
    required int id,
    required String uuid,
    required String authorUuid,
    required String ideaUuid,
    required DateTime postedAt,
    required String content,
  }) = _IdeaCommentImpl;

  factory IdeaComment.fromJson(Map<String, dynamic> jsonSerialization) {
    return IdeaComment(
      id: jsonSerialization['id'] as int,
      uuid: jsonSerialization['uuid'] as String,
      authorUuid: jsonSerialization['authorUuid'] as String,
      ideaUuid: jsonSerialization['ideaUuid'] as String,
      postedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['postedAt']),
      content: jsonSerialization['content'] as String,
    );
  }

  int id;

  String uuid;

  String authorUuid;

  String ideaUuid;

  DateTime postedAt;

  String content;

  IdeaComment copyWith({
    int? id,
    String? uuid,
    String? authorUuid,
    String? ideaUuid,
    DateTime? postedAt,
    String? content,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uuid': uuid,
      'authorUuid': authorUuid,
      'ideaUuid': ideaUuid,
      'postedAt': postedAt.toJson(),
      'content': content,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _IdeaCommentImpl extends IdeaComment {
  _IdeaCommentImpl({
    required int id,
    required String uuid,
    required String authorUuid,
    required String ideaUuid,
    required DateTime postedAt,
    required String content,
  }) : super._(
          id: id,
          uuid: uuid,
          authorUuid: authorUuid,
          ideaUuid: ideaUuid,
          postedAt: postedAt,
          content: content,
        );

  @override
  IdeaComment copyWith({
    int? id,
    String? uuid,
    String? authorUuid,
    String? ideaUuid,
    DateTime? postedAt,
    String? content,
  }) {
    return IdeaComment(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      authorUuid: authorUuid ?? this.authorUuid,
      ideaUuid: ideaUuid ?? this.ideaUuid,
      postedAt: postedAt ?? this.postedAt,
      content: content ?? this.content,
    );
  }
}

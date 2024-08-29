/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod_serialization/serverpod_serialization.dart';

abstract class Idea
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  Idea._({
    this.id,
    required this.uuid,
    required this.postedAt,
    required this.title,
    required this.content,
    required this.authorUuid,
    required this.votesNumber,
    required this.commentsNumber,
  });

  factory Idea({
    int? id,
    required String uuid,
    required DateTime postedAt,
    required String title,
    required String content,
    required String authorUuid,
    required int votesNumber,
    required int commentsNumber,
  }) = _IdeaImpl;

  factory Idea.fromJson(Map<String, dynamic> jsonSerialization) {
    return Idea(
      id: jsonSerialization['id'] as int?,
      uuid: jsonSerialization['uuid'] as String,
      postedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['postedAt']),
      title: jsonSerialization['title'] as String,
      content: jsonSerialization['content'] as String,
      authorUuid: jsonSerialization['authorUuid'] as String,
      votesNumber: jsonSerialization['votesNumber'] as int,
      commentsNumber: jsonSerialization['commentsNumber'] as int,
    );
  }

  int? id;

  String uuid;

  DateTime postedAt;

  String title;

  String content;

  String authorUuid;

  int votesNumber;

  int commentsNumber;

  Idea copyWith({
    int? id,
    String? uuid,
    DateTime? postedAt,
    String? title,
    String? content,
    String? authorUuid,
    int? votesNumber,
    int? commentsNumber,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'uuid': uuid,
      'postedAt': postedAt.toJson(),
      'title': title,
      'content': content,
      'authorUuid': authorUuid,
      'votesNumber': votesNumber,
      'commentsNumber': commentsNumber,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'uuid': uuid,
      'postedAt': postedAt.toJson(),
      'title': title,
      'content': content,
      'authorUuid': authorUuid,
      'votesNumber': votesNumber,
      'commentsNumber': commentsNumber,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _IdeaImpl extends Idea {
  _IdeaImpl({
    int? id,
    required String uuid,
    required DateTime postedAt,
    required String title,
    required String content,
    required String authorUuid,
    required int votesNumber,
    required int commentsNumber,
  }) : super._(
          id: id,
          uuid: uuid,
          postedAt: postedAt,
          title: title,
          content: content,
          authorUuid: authorUuid,
          votesNumber: votesNumber,
          commentsNumber: commentsNumber,
        );

  @override
  Idea copyWith({
    Object? id = _Undefined,
    String? uuid,
    DateTime? postedAt,
    String? title,
    String? content,
    String? authorUuid,
    int? votesNumber,
    int? commentsNumber,
  }) {
    return Idea(
      id: id is int? ? id : this.id,
      uuid: uuid ?? this.uuid,
      postedAt: postedAt ?? this.postedAt,
      title: title ?? this.title,
      content: content ?? this.content,
      authorUuid: authorUuid ?? this.authorUuid,
      votesNumber: votesNumber ?? this.votesNumber,
      commentsNumber: commentsNumber ?? this.commentsNumber,
    );
  }
}

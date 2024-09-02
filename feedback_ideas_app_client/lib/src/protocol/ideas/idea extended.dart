/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class IdeaExtended implements _i1.SerializableModel {
  IdeaExtended._({
    this.id,
    required this.uuid,
    required this.postedAt,
    required this.title,
    required this.content,
    required this.authorUuid,
    required this.authorFirstName,
    required this.authorLastName,
    required this.votesNumber,
    required this.commentsNumber,
    required this.votedByCurrentUser,
  });

  factory IdeaExtended({
    int? id,
    required String uuid,
    required DateTime postedAt,
    required String title,
    required String content,
    required String authorUuid,
    required String authorFirstName,
    required String authorLastName,
    required int votesNumber,
    required int commentsNumber,
    required int votedByCurrentUser,
  }) = _IdeaExtendedImpl;

  factory IdeaExtended.fromJson(Map<String, dynamic> jsonSerialization) {
    return IdeaExtended(
      id: jsonSerialization['id'] as int?,
      uuid: jsonSerialization['uuid'] as String,
      postedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['postedAt']),
      title: jsonSerialization['title'] as String,
      content: jsonSerialization['content'] as String,
      authorUuid: jsonSerialization['authorUuid'] as String,
      authorFirstName: jsonSerialization['authorFirstName'] as String,
      authorLastName: jsonSerialization['authorLastName'] as String,
      votesNumber: jsonSerialization['votesNumber'] as int,
      commentsNumber: jsonSerialization['commentsNumber'] as int,
      votedByCurrentUser: jsonSerialization['votedByCurrentUser'] as int,
    );
  }

  int? id;

  String uuid;

  DateTime postedAt;

  String title;

  String content;

  String authorUuid;

  String authorFirstName;

  String authorLastName;

  int votesNumber;

  int commentsNumber;

  int votedByCurrentUser;

  IdeaExtended copyWith({
    int? id,
    String? uuid,
    DateTime? postedAt,
    String? title,
    String? content,
    String? authorUuid,
    String? authorFirstName,
    String? authorLastName,
    int? votesNumber,
    int? commentsNumber,
    int? votedByCurrentUser,
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
      'authorFirstName': authorFirstName,
      'authorLastName': authorLastName,
      'votesNumber': votesNumber,
      'commentsNumber': commentsNumber,
      'votedByCurrentUser': votedByCurrentUser,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _IdeaExtendedImpl extends IdeaExtended {
  _IdeaExtendedImpl({
    int? id,
    required String uuid,
    required DateTime postedAt,
    required String title,
    required String content,
    required String authorUuid,
    required String authorFirstName,
    required String authorLastName,
    required int votesNumber,
    required int commentsNumber,
    required int votedByCurrentUser,
  }) : super._(
          id: id,
          uuid: uuid,
          postedAt: postedAt,
          title: title,
          content: content,
          authorUuid: authorUuid,
          authorFirstName: authorFirstName,
          authorLastName: authorLastName,
          votesNumber: votesNumber,
          commentsNumber: commentsNumber,
          votedByCurrentUser: votedByCurrentUser,
        );

  @override
  IdeaExtended copyWith({
    Object? id = _Undefined,
    String? uuid,
    DateTime? postedAt,
    String? title,
    String? content,
    String? authorUuid,
    String? authorFirstName,
    String? authorLastName,
    int? votesNumber,
    int? commentsNumber,
    int? votedByCurrentUser,
  }) {
    return IdeaExtended(
      id: id is int? ? id : this.id,
      uuid: uuid ?? this.uuid,
      postedAt: postedAt ?? this.postedAt,
      title: title ?? this.title,
      content: content ?? this.content,
      authorUuid: authorUuid ?? this.authorUuid,
      authorFirstName: authorFirstName ?? this.authorFirstName,
      authorLastName: authorLastName ?? this.authorLastName,
      votesNumber: votesNumber ?? this.votesNumber,
      commentsNumber: commentsNumber ?? this.commentsNumber,
      votedByCurrentUser: votedByCurrentUser ?? this.votedByCurrentUser,
    );
  }
}

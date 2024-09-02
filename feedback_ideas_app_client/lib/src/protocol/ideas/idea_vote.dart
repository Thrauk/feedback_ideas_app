/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class IdeaVote implements _i1.SerializableModel {
  IdeaVote._({
    this.id,
    required this.userUuid,
    required this.ideaUuid,
    required this.votedAt,
  });

  factory IdeaVote({
    int? id,
    required String userUuid,
    required String ideaUuid,
    required DateTime votedAt,
  }) = _IdeaVoteImpl;

  factory IdeaVote.fromJson(Map<String, dynamic> jsonSerialization) {
    return IdeaVote(
      id: jsonSerialization['id'] as int?,
      userUuid: jsonSerialization['userUuid'] as String,
      ideaUuid: jsonSerialization['ideaUuid'] as String,
      votedAt: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['votedAt']),
    );
  }

  int? id;

  String userUuid;

  String ideaUuid;

  DateTime votedAt;

  IdeaVote copyWith({
    int? id,
    String? userUuid,
    String? ideaUuid,
    DateTime? votedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userUuid': userUuid,
      'ideaUuid': ideaUuid,
      'votedAt': votedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _IdeaVoteImpl extends IdeaVote {
  _IdeaVoteImpl({
    int? id,
    required String userUuid,
    required String ideaUuid,
    required DateTime votedAt,
  }) : super._(
          id: id,
          userUuid: userUuid,
          ideaUuid: ideaUuid,
          votedAt: votedAt,
        );

  @override
  IdeaVote copyWith({
    Object? id = _Undefined,
    String? userUuid,
    String? ideaUuid,
    DateTime? votedAt,
  }) {
    return IdeaVote(
      id: id is int? ? id : this.id,
      userUuid: userUuid ?? this.userUuid,
      ideaUuid: ideaUuid ?? this.ideaUuid,
      votedAt: votedAt ?? this.votedAt,
    );
  }
}

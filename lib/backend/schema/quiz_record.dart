import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuizRecord extends FirestoreRecord {
  QuizRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "QuizName" field.
  String? _quizName;
  String get quizName => _quizName ?? '';
  bool hasQuizName() => _quizName != null;

  // "duration" field.
  int? _duration;
  int get duration => _duration ?? 0;
  bool hasDuration() => _duration != null;

  // "totalQuestions" field.
  int? _totalQuestions;
  int get totalQuestions => _totalQuestions ?? 0;
  bool hasTotalQuestions() => _totalQuestions != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "coverPhoto" field.
  String? _coverPhoto;
  String get coverPhoto => _coverPhoto ?? '';
  bool hasCoverPhoto() => _coverPhoto != null;

  void _initializeFields() {
    _quizName = snapshotData['QuizName'] as String?;
    _duration = castToType<int>(snapshotData['duration']);
    _totalQuestions = castToType<int>(snapshotData['totalQuestions']);
    _description = snapshotData['description'] as String?;
    _coverPhoto = snapshotData['coverPhoto'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Quiz');

  static Stream<QuizRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuizRecord.fromSnapshot(s));

  static Future<QuizRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuizRecord.fromSnapshot(s));

  static QuizRecord fromSnapshot(DocumentSnapshot snapshot) => QuizRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuizRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuizRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuizRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuizRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuizRecordData({
  String? quizName,
  int? duration,
  int? totalQuestions,
  String? description,
  String? coverPhoto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'QuizName': quizName,
      'duration': duration,
      'totalQuestions': totalQuestions,
      'description': description,
      'coverPhoto': coverPhoto,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuizRecordDocumentEquality implements Equality<QuizRecord> {
  const QuizRecordDocumentEquality();

  @override
  bool equals(QuizRecord? e1, QuizRecord? e2) {
    return e1?.quizName == e2?.quizName &&
        e1?.duration == e2?.duration &&
        e1?.totalQuestions == e2?.totalQuestions &&
        e1?.description == e2?.description &&
        e1?.coverPhoto == e2?.coverPhoto;
  }

  @override
  int hash(QuizRecord? e) => const ListEquality().hash([
        e?.quizName,
        e?.duration,
        e?.totalQuestions,
        e?.description,
        e?.coverPhoto
      ]);

  @override
  bool isValidKey(Object? o) => o is QuizRecord;
}

import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class FlashCardsRecord extends FirestoreRecord {
  FlashCardsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  // "Answer" field.
  String? _answer;
  String get answer => _answer ?? '';
  bool hasAnswer() => _answer != null;

  // "refID" field.
  DocumentReference? _refID;
  DocumentReference? get refID => _refID;
  bool hasRefID() => _refID != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _question = snapshotData['Question'] as String?;
    _answer = snapshotData['Answer'] as String?;
    _refID = snapshotData['refID'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('flashCards')
          : FirebaseFirestore.instance.collectionGroup('flashCards');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('flashCards').doc(id);

  static Stream<FlashCardsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FlashCardsRecord.fromSnapshot(s));

  static Future<FlashCardsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FlashCardsRecord.fromSnapshot(s));

  static FlashCardsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FlashCardsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FlashCardsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FlashCardsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FlashCardsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FlashCardsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFlashCardsRecordData({
  String? question,
  String? answer,
  DocumentReference? refID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Question': question,
      'Answer': answer,
      'refID': refID,
    }.withoutNulls,
  );

  return firestoreData;
}

class FlashCardsRecordDocumentEquality implements Equality<FlashCardsRecord> {
  const FlashCardsRecordDocumentEquality();

  @override
  bool equals(FlashCardsRecord? e1, FlashCardsRecord? e2) {
    return e1?.question == e2?.question &&
        e1?.answer == e2?.answer &&
        e1?.refID == e2?.refID;
  }

  @override
  int hash(FlashCardsRecord? e) =>
      const ListEquality().hash([e?.question, e?.answer, e?.refID]);

  @override
  bool isValidKey(Object? o) => o is FlashCardsRecord;
}

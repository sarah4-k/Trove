import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class DisbourdRecord extends FirestoreRecord {
  DisbourdRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "chat" field.
  DocumentReference? _chat;
  DocumentReference? get chat => _chat;
  bool hasChat() => _chat != null;

  void _initializeFields() {
    _chat = snapshotData['chat'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('disbourd');

  static Stream<DisbourdRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DisbourdRecord.fromSnapshot(s));

  static Future<DisbourdRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DisbourdRecord.fromSnapshot(s));

  static DisbourdRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DisbourdRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DisbourdRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DisbourdRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DisbourdRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DisbourdRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDisbourdRecordData({
  DocumentReference? chat,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'chat': chat,
    }.withoutNulls,
  );

  return firestoreData;
}

class DisbourdRecordDocumentEquality implements Equality<DisbourdRecord> {
  const DisbourdRecordDocumentEquality();

  @override
  bool equals(DisbourdRecord? e1, DisbourdRecord? e2) {
    return e1?.chat == e2?.chat;
  }

  @override
  int hash(DisbourdRecord? e) => const ListEquality().hash([e?.chat]);

  @override
  bool isValidKey(Object? o) => o is DisbourdRecord;
}

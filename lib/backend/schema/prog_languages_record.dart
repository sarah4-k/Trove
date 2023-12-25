import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ProgLanguagesRecord extends FirestoreRecord {
  ProgLanguagesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  bool hasLogo() => _logo != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _logo = snapshotData['logo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ProgLanguages');

  static Stream<ProgLanguagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProgLanguagesRecord.fromSnapshot(s));

  static Future<ProgLanguagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProgLanguagesRecord.fromSnapshot(s));

  static ProgLanguagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProgLanguagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProgLanguagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProgLanguagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProgLanguagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProgLanguagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProgLanguagesRecordData({
  String? name,
  String? logo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'logo': logo,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProgLanguagesRecordDocumentEquality
    implements Equality<ProgLanguagesRecord> {
  const ProgLanguagesRecordDocumentEquality();

  @override
  bool equals(ProgLanguagesRecord? e1, ProgLanguagesRecord? e2) {
    return e1?.name == e2?.name && e1?.logo == e2?.logo;
  }

  @override
  int hash(ProgLanguagesRecord? e) =>
      const ListEquality().hash([e?.name, e?.logo]);

  @override
  bool isValidKey(Object? o) => o is ProgLanguagesRecord;
}

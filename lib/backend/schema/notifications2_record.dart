import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class Notifications2Record extends FirestoreRecord {
  Notifications2Record._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userid" field.
  DocumentReference? _userid;
  DocumentReference? get userid => _userid;
  bool hasUserid() => _userid != null;

  // "postid" field.
  DocumentReference? _postid;
  DocumentReference? get postid => _postid;
  bool hasPostid() => _postid != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userid = snapshotData['userid'] as DocumentReference?;
    _postid = snapshotData['postid'] as DocumentReference?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Notifications2')
          : FirebaseFirestore.instance.collectionGroup('Notifications2');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Notifications2').doc();

  static Stream<Notifications2Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => Notifications2Record.fromSnapshot(s));

  static Future<Notifications2Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => Notifications2Record.fromSnapshot(s));

  static Notifications2Record fromSnapshot(DocumentSnapshot snapshot) =>
      Notifications2Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static Notifications2Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      Notifications2Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'Notifications2Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is Notifications2Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotifications2RecordData({
  DocumentReference? userid,
  DocumentReference? postid,
  DateTime? timestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userid': userid,
      'postid': postid,
      'timestamp': timestamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class Notifications2RecordDocumentEquality
    implements Equality<Notifications2Record> {
  const Notifications2RecordDocumentEquality();

  @override
  bool equals(Notifications2Record? e1, Notifications2Record? e2) {
    return e1?.userid == e2?.userid &&
        e1?.postid == e2?.postid &&
        e1?.timestamp == e2?.timestamp;
  }

  @override
  int hash(Notifications2Record? e) =>
      const ListEquality().hash([e?.userid, e?.postid, e?.timestamp]);

  @override
  bool isValidKey(Object? o) => o is Notifications2Record;
}

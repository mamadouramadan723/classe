import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AttendancesRecord extends FirestoreRecord {
  AttendancesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "studentName" field.
  String? _studentName;
  String get studentName => _studentName ?? '';
  bool hasStudentName() => _studentName != null;

  // "studentEmail" field.
  String? _studentEmail;
  String get studentEmail => _studentEmail ?? '';
  bool hasStudentEmail() => _studentEmail != null;

  // "attendanceTime" field.
  DateTime? _attendanceTime;
  DateTime? get attendanceTime => _attendanceTime;
  bool hasAttendanceTime() => _attendanceTime != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _studentName = snapshotData['studentName'] as String?;
    _studentEmail = snapshotData['studentEmail'] as String?;
    _attendanceTime = snapshotData['attendanceTime'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('attendances')
          : FirebaseFirestore.instance.collectionGroup('attendances');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('attendances').doc();

  static Stream<AttendancesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AttendancesRecord.fromSnapshot(s));

  static Future<AttendancesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AttendancesRecord.fromSnapshot(s));

  static AttendancesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AttendancesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AttendancesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AttendancesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AttendancesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AttendancesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAttendancesRecordData({
  String? studentName,
  String? studentEmail,
  DateTime? attendanceTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'studentName': studentName,
      'studentEmail': studentEmail,
      'attendanceTime': attendanceTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class AttendancesRecordDocumentEquality implements Equality<AttendancesRecord> {
  const AttendancesRecordDocumentEquality();

  @override
  bool equals(AttendancesRecord? e1, AttendancesRecord? e2) {
    return e1?.studentName == e2?.studentName &&
        e1?.studentEmail == e2?.studentEmail &&
        e1?.attendanceTime == e2?.attendanceTime;
  }

  @override
  int hash(AttendancesRecord? e) => const ListEquality()
      .hash([e?.studentName, e?.studentEmail, e?.attendanceTime]);

  @override
  bool isValidKey(Object? o) => o is AttendancesRecord;
}

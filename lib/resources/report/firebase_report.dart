import 'package:cloud_firestore/cloud_firestore.dart';

class ReportRepository {
  FirebaseFirestore firestoreInstance;

  ReportRepository() {
    this.firestoreInstance = FirebaseFirestore.instance;
  }

  Future<bool> insertTroca(String reportedId, String reportedName,
      String report, String trocaId, String fromId, String fromName) async {
    return await firestoreInstance.collection('report').add({
      'userReportedId': reportedId,
      'userReportedName': reportedName,
      'fromReportId': fromId,
      'fromReportName': fromName,
      'report': report,
      'trocaId': trocaId,
      'timestamp': DateTime.now().millisecondsSinceEpoch.toString(),
    }).then((value) {
      return true;
    }).catchError((error) => throw error);
  }

  Future<bool> existeReport(String fromId, String trocaId) async {
    bool existe = false;
    try {
      QuerySnapshot snapshot = await firestoreInstance
          .collection('troca')
          .where("fromReportId", isEqualTo: fromId)
          .where('trocaId', isEqualTo: trocaId)
          .where('timestamp',
              isGreaterThan: DateTime.now()
                  .subtract(Duration(days: 30))
                  .millisecondsSinceEpoch
                  .toString())
          .limit(1)
          .get();
      if (snapshot.docs.length > 0) {
        existe = true;
      }
    } catch (error) {
      throw error;
    }
    return existe;
  }
}

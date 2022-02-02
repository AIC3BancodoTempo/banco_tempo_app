class Log {
  List logHoras;

  Log({this.logHoras});

  Log.fromSnapshot(Map<String, dynamic> data, String id) {
    logHoras = data['logHoras'] != null ? data['logHoras'] : [];
  }
}

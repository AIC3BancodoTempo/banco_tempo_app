class BankModel {
  double horas;

  BankModel({this.horas});

  BankModel.fromSnapshot(Map data) {
    horas = data['horas'] != null ? data['horas'].toDouble() : 0;
  }
}

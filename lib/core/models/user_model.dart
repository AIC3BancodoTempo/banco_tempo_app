class UserModel {
  String key;
  String nome;
  String email;
  double horas;
  bool isAdmin;
  int reports;
  String foto;

  UserModel({
    this.key,
    this.nome,
    this.horas,
    this.email,
    this.isAdmin,
    this.reports,
    this.foto
  });

  UserModel.fromSnapshot(Map<String, dynamic> data, String id) {
    key = id;
    nome = data['nome'] != null ? data['nome'] : '';
    horas = data['horas'] != null ? data['horas'].toDouble() : 0;
    email = data['email'] != null ? data['email'] : '';
    isAdmin = data['is_admin'] != null ? data['is_admin'] : false;
    reports = data['reports'] != null ? data['reports'] : 0;
    foto = data['foto'] != null ? data['foto'] : "";
  }
}

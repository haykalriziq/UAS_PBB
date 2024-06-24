class Products {
  final int id;
  final String nama;
  final String email;
  final String no_hp;
  final String tgl_janji;
  final int umur;
  final String dentist;
  final String createdAt;
  final String updatedAt;

  Products({
    required this.id,
    required this.nama,
    required this.email,
    required this.no_hp,
    required this.tgl_janji,
    required this.umur,
    required this.dentist,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['id'],
      nama: json['nama'],
      email: json['email'],
      no_hp: json['no_hp'],
      tgl_janji: json['tgl_janji'],
      umur: json['umur'],
      dentist: json['dentist'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

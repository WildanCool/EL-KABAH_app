class SuratModel {

  final int nomor;

  final String nama;

  final String namaLatin;

  final int jumlahAyat;

  final String arti;

  SuratModel({
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
    required this.arti,
  });

  factory SuratModel.fromJson(
    Map<String, dynamic> json,
  ) {

    return SuratModel(
      nomor: json["nomor"],

      nama: json["nama"],

      namaLatin: json["namaLatin"],

      jumlahAyat: json["jumlahAyat"],

      arti: json["arti"],
    );
  }
}
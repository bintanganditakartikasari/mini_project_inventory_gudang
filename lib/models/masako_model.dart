import 'dart:convert';

class Masako {
  String? id;
  String nama;
  String berat;
  String jumlah;
  String tanggalProduksi;
  String tanggalExpired;

  Masako({this.id, required this.nama, required this.berat, required this.jumlah, required this.tanggalProduksi, required this.tanggalExpired});

  factory Masako.fromJson(Map<String, dynamic> map) {
    return Masako(
      id: map['id'].toString(), 
      nama: map['nama produk'].toString(), 
      berat: map['berat produk'].toString(), 
      jumlah: map['jumlah produk'].toString(), 
      tanggalProduksi: map['tanggal produksi'].toString(), 
      tanggalExpired: map['tanggal expired'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama produk': nama,
      'berat produk': berat,
      'jumlah produk': jumlah,
      'tanggal produksi': tanggalProduksi,
      'tanggal expired': tanggalExpired,
    };
  }

  @override 
  String toString() {
    return 'Masako{id: $id, nama produk: $nama, berat produk: $berat, jumlah produk: $jumlah, tanggal produksi: $tanggalProduksi, tanggal expired: $tanggalExpired}';
  }

  static List<Masako> masakoFromJson(String jsonData) {
    final data = jsonDecode(jsonData);
    return List<Masako>.from(
      data['Masako'].map((item) => Masako.fromJson(item))
    );
  }

  static String masakoToJson(Masako data) {
    final jsonData = data.toJson();
    return jsonEncode(jsonData);
  }
}
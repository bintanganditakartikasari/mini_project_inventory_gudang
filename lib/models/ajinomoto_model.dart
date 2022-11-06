import 'dart:convert';

class Ajinomoto {
  String? id;
  String nama;
  String berat;
  String jumlah;
  String tanggalProduksi;
  String tanggalExpired;

  Ajinomoto({this.id, required this.nama, required this.berat, required this.jumlah, required this.tanggalProduksi, required this.tanggalExpired});

  factory Ajinomoto.fromJson(Map<String, dynamic> map) {
    return Ajinomoto(
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
    return 'Ajinomoto{id: $id, nama produk: $nama, berat produk: $berat, jumlah produk: $jumlah, tanggal produksi: $tanggalProduksi, tanggal expired: $tanggalExpired}';
  }

  static List<Ajinomoto> ajinomotoFromJson(String jsonData) {
    final data = jsonDecode(jsonData);
    return List<Ajinomoto>.from(
      data['Ajinomoto'].map((item) => Ajinomoto.fromJson(item))
    );
  }

  static String ajinomotoToJson(Ajinomoto data) {
    final jsonData = data.toJson();
    return jsonEncode(jsonData);
  }
}
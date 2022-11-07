import 'dart:convert';

class Sajiku {
  String? id;
  String nama;
  String berat;
  String jumlah;
  String tanggalProduksi;
  String tanggalExpired;

  Sajiku({this.id, required this.nama, required this.berat, required this.jumlah, required this.tanggalProduksi, required this.tanggalExpired});

  factory Sajiku.fromJson(Map<String, dynamic> map) {
    return Sajiku(
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
    return 'Sajiku{id: $id, nama produk: $nama, berat produk: $berat, jumlah produk: $jumlah, tanggal produksi: $tanggalProduksi, tanggal expired: $tanggalExpired}';
  }

  static List<Sajiku> sajikuFromJson(String jsonData) {
    final data = jsonDecode(jsonData);
    return List<Sajiku>.from(
      data['values'].map((item) => Sajiku.fromJson(item))
    );
  }

  static String sajikuToJson(Sajiku data) {
    final jsonData = data.toJson();
    return jsonEncode(jsonData);
  }
}
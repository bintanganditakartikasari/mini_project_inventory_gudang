// class Sajiku{
//   String? key;
//   SajikuData sajikuData;

//   Sajiku({this.key, required this.sajikuData});
// }

// class SajikuData{
//   late String id;
//   String? nama;
//   String? berat;
//   String? jumlah;
//   String? tanggalProduksi;
//   String? tanggalExpired;

//   SajikuData({required this.id, this.nama, this.berat, this.jumlah, this.tanggalProduksi, this.tanggalExpired});

//   SajikuData.fromJson(Map<dynamic, dynamic> json){
//     nama = json['nama produk'];
//     berat = json['berat produk'];
//     jumlah = json['jumlah produk'];
//     tanggalProduksi = json['tanggal produksi'];
//     tanggalExpired = json['tanggal expired'];
//   }
// }

// class Sajiku {
//   String? key;
//   String nama;
//   String berat;
//   String jumlah;
//   String tanggalProduksi;
//   String tanggalExpired;

//   Sajiku({required this.key, required this.nama, required this.berat, required this.jumlah, required this.tanggalProduksi, required this.tanggalExpired});
  
//   factory Sajiku.fromJson(Map<String, dynamic> json) {
//     return Sajiku(
//       key: json['key'],
//       nama: json['nama produk'], 
//       berat: json['berat produk'], 
//       jumlah: json['jumlah produk'], 
//       tanggalProduksi: json['tanggal produksi'], 
//       tanggalExpired: json['tanggal expired']);
//   }

//   Map<String, dynamic> toJson() => {
//     'key': key,
//     'nama produk': nama,
//     'berat produk': berat,
//     'jumlah produk': jumlah,
//     'tanggal produksi': tanggalProduksi,
//     'tanggal expired': tanggalExpired,
//   };
// }

import 'dart:convert';

class Sajiku {
  String? id;
  String nama;
  String berat;
  String jumlah;
  String tanggalProduksi;
  String tanggalExpired;

  Sajiku({required this.id, required this.nama, required this.berat, required this.jumlah, required this.tanggalProduksi, required this.tanggalExpired});

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
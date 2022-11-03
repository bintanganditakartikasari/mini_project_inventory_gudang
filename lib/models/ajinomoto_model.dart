// class Ajinomoto{
//   String? key;
//   AjinomotoData ajinomotoData;

//   Ajinomoto({this.key, required this.ajinomotoData});
// }

// class AjinomotoData{
//   String? nama;
//   String? berat;
//   String? jumlah;
//   String? tanggalProduksi;
//   String? tanggalExpired;

//   AjinomotoData({this.nama, this.berat, this.jumlah, this.tanggalProduksi, this.tanggalExpired});

//   AjinomotoData.fromJson(Map<dynamic, dynamic> json){
//     nama = json['nama produk'];
//     berat = json['berat produk'];
//     jumlah = json['jumlah produk'];
//     tanggalProduksi = json['tanggal produksi'];
//     tanggalExpired = json['tanggal expired'];
//   }


//   Map<String, dynamic> toJson() => {
//     'nama produk': nama,
//     'berat produk': berat,
//     'jumlah produk': jumlah,
//     'tanggal produksi': tanggalProduksi,
//     'tanggal expired': tanggalExpired,
//   };
// }

// class Ajinomoto {
//   int? id;
//   String nama;
//   String berat;
//   String jumlah;
//   DateTime tanggalProduksi;
//   DateTime tanggalExpired;

//   Ajinomoto({required this.id, required this.nama, required this.berat, required this.jumlah, required this.tanggalProduksi, required this.tanggalExpired});
  
//   factory Ajinomoto.fromJson(Map<String, dynamic> json) {
//     return Ajinomoto(
//       id: json['id'],
//       nama: json['nama produk'], 
//       berat: json['berat produk'], 
//       jumlah: json['jumlah produk'], 
//       tanggalProduksi: json['tanggal produksi'], 
//       tanggalExpired: json['tanggal expired']);
//   }

//   Map<String, dynamic> toJson() => {
//     'id': id,
//     'nama produk': nama,
//     'berat produk': berat,
//     'jumlah produk': jumlah,
//     'tanggal produksi': tanggalProduksi,
//     'tanggal expired': tanggalExpired,
//   };
// }

import 'dart:convert';

class Ajinomoto {
  String? id;
  String nama;
  String berat;
  String jumlah;
  String tanggalProduksi;
  String tanggalExpired;

  Ajinomoto({required this.id, required this.nama, required this.berat, required this.jumlah, required this.tanggalProduksi, required this.tanggalExpired});

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
      data['values'].map((item) => Ajinomoto.fromJson(item))
    );
  }

  static String ajinomotoToJson(Ajinomoto data) {
    final jsonData = data.toJson();
    return jsonEncode(jsonData);
  }
}
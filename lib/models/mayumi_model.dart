// class Mayumi{
//   String? key;
//   MayumiData mayumiData;

//   Mayumi({this.key, required this.mayumiData});
// }

// class MayumiData{
//   late String id;
//   String? nama;
//   String? berat;
//   String? jumlah;
//   String? tanggalProduksi;
//   String? tanggalExpired;

//   MayumiData({required this.id, this.nama, this.berat, this.jumlah, this.tanggalProduksi, this.tanggalExpired});

//   MayumiData.fromJson(Map<dynamic, dynamic> json){
//     nama = json['nama produk'];
//     berat = json['berat produk'];
//     jumlah = json['jumlah produk'];
//     tanggalProduksi = json['tanggal produksi'];
//     tanggalExpired = json['tanggal expired'];
//   }
// }

// class Mayumi {
//   String? key;
//   String nama;
//   String berat;
//   String jumlah;
//   String tanggalProduksi;
//   String tanggalExpired;

//   Mayumi({required this.key, required this.nama, required this.berat, required this.jumlah, required this.tanggalProduksi, required this.tanggalExpired});
  
//   factory Mayumi.fromJson(Map<String, dynamic> json) {
//     return Mayumi(
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

class Mayumi {
  String? id;
  String nama;
  String berat;
  String jumlah;
  String tanggalProduksi;
  String tanggalExpired;

  Mayumi({required this.id, required this.nama, required this.berat, required this.jumlah, required this.tanggalProduksi, required this.tanggalExpired});

  factory Mayumi.fromJson(Map<String, dynamic> map) {
    return Mayumi(
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
    return 'Mayumi{id: $id, nama produk: $nama, berat produk: $berat, jumlah produk: $jumlah, tanggal produksi: $tanggalProduksi, tanggal expired: $tanggalExpired}';
  }

  static List<Mayumi> mayumiFromJson(String jsonData) {
    final data = jsonDecode(jsonData);
    return List<Mayumi>.from(
      data['values'].map((item) => Mayumi.fromJson(item))
    );
  }

  static String mayumiToJson(Mayumi data) {
    final jsonData = data.toJson();
    return jsonEncode(jsonData);
  }
}
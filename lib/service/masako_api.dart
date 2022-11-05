import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mini_project_inventory_gudang/models/Masako_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MasakoAPI {
  static const baseURL = 'https://cloudminiproject-inventory-default-rtdb.asia-southeast1.firebasedatabase.app/Masako';
  // final Dio _dio = Dio();

  // Future<List<Masako>> getMasako() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   if(!prefs.containsKey('Masako')){
  //     return [];
  //   }

  //   List<Masako> data = [];
  //   final extractedMasakoData = jsonDecode(prefs.getString('Masako').toString());
  //   try {
  //     final response = await Dio().get(baseURL);
  //     if (response.data != null && response.data.isNotEmpty) {
  //     final extractedData = response.data as Map<String, dynamic>;
  //     if(extractedData.isEmpty) {
  //       return [];
  //     }
  //     extractedData.forEach((key, value) {
  //       data.add(
  //         Masako(
  //           id: key.toString(),
  //           nama: value['nama produk'].toString(),
  //           berat: value['berat produk'].toString(),
  //           jumlah: value['jumlah produk'].toString(),
  //           tanggalProduksi: value['tanggal produksi'].toString(),
  //           tanggalExpired: value['tanggal expired'].toString(),
  //         ),
  //       );
  //     });
  //   } 
  //   } catch (e) {
  //     rethrow;
  //   }
  //   return data;
  // }

  static Future<List<Masako>> getMasako() async {
    final prefs = await SharedPreferences.getInstance();
    if(!prefs.containsKey('Masako')){
      return [];
    }

    List<Masako> data = [];
    final extractedMasakoData = jsonDecode(prefs.getString('Masako').toString());
    try {
      final response = await Dio().get(baseURL);
      if (response.data != null && response.data.isNotEmpty) {
      final extractedData = response.data as Map<String, dynamic>;
      if(extractedData.isEmpty) {
        return [];
      }
      extractedData.forEach((key, value) {
        data.add(
          Masako(
            id: key.toString(),
            nama: value['nama produk'].toString(),
            berat: value['berat produk'].toString(),
            jumlah: value['jumlah produk'].toString(),
            tanggalProduksi: value['tanggal produksi'].toString(),
            tanggalExpired: value['tanggal expired'].toString(),
          ),
        );
      });
    } 
    } catch (e) {
      rethrow;
    }
    return data;
  }

  static Future<Masako?> addMasako(Masako masako) async {
    final prefs = await SharedPreferences.getInstance();
    if(!prefs.containsKey('Masako')){
      return null;
    }

    final extractedMasakoData = jsonDecode(prefs.getString('Masako').toString());
    try {
      final response = await Dio().post(
        baseURL,
        data: jsonEncode(
          {
            'nama produk': masako.nama,
            'berat produk': masako.berat,
            'jumlah produk': masako.jumlah,
            'tanggal produksi': masako.tanggalProduksi,
            'tanggal expired': masako.tanggalExpired,
          },
        ),
      );
      final newMasako = Masako(
        id: response.data['Masako'], 
        nama: masako.nama, 
        berat: masako.berat, 
        jumlah: masako.jumlah, 
        tanggalProduksi: masako.tanggalProduksi,
        tanggalExpired: masako.tanggalExpired,
      );
      return newMasako;
    } catch (error) {
      rethrow;
    }
  }

  static Future<bool> updateMasako(Masako newMasako) async {
    final prefs = await SharedPreferences.getInstance();
    if(!prefs.containsKey('Masako')){
      return false;
    }

    final extractedMasakoData = jsonDecode(prefs.getString('Masako').toString());
    try{
      await Dio().patch(
        baseURL,
        data: jsonEncode(
          {
            'nama produk': newMasako.nama,
            'berat produk': newMasako.berat,
            'jumlah produk': newMasako.jumlah,
            'tanggal produksi': newMasako.tanggalProduksi,
            'tanggal expired': newMasako.tanggalExpired,
          }
        )
      );
      return true;
    } catch (error) {
      rethrow;
    }
  }

  static Future<bool> deleteMasako(String id) async {
    final prefs = await SharedPreferences.getInstance();
    if(!prefs.containsKey('Masako')){
      return false;
    }

    final extractedMasakoData = jsonDecode(prefs.getString('Masako').toString());
    try {
      await Dio().delete(baseURL);
      return true;
    } catch (error) {
      rethrow;
    }
  }

  // Future<bool> editMasako(Masako Masako) async {
  //   final response = await _dio.put('$baseURL/${Masako.id}',
  //   data: Masako.toJson(),
  //   );
  //   if (response.data['id'] > 0) {
  //     return true;
  //   }
  //   return false;
  // }
}
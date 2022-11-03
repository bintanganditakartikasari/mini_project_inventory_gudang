import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mini_project_inventory_gudang/models/Sajiku_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SajikuAPI {
  static const baseURL = 'https://cloudminiproject-inventory-default-rtdb.asia-southeast1.firebasedatabase.app/Sajiku';
  // final Dio _dio = Dio();

  Future<List<Sajiku>> getSajiku() async {
    final prefs = await SharedPreferences.getInstance();
    if(!prefs.containsKey('Sajiku')){
      return [];
    }

    List<Sajiku> data = [];
    final extractedSajikuData = jsonDecode(prefs.getString('Sajiku').toString());
    try {
      final response = await Dio().get(baseURL);
      if (response.data != null && response.data.isNotEmpty) {
      final extractedData = response.data as Map<String, dynamic>;
      if(extractedData.isEmpty) {
        return [];
      }
      extractedData.forEach((key, value) {
        data.add(
          Sajiku(
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

  static Future<Sajiku?> addSajiku(Sajiku sajiku) async {
    final prefs = await SharedPreferences.getInstance();
    if(!prefs.containsKey('Sajiku')){
      return null;
    }

    final extractedSajikuData = jsonDecode(prefs.getString('Sajiku').toString());
    try {
      final response = await Dio().post(
        baseURL,
        data: jsonEncode(
          {
            'nama produk': sajiku.nama,
            'berat produk': sajiku.berat,
            'jumlah produk': sajiku.jumlah,
            'tanggal produksi': sajiku.tanggalProduksi,
            'tanggal expired': sajiku.tanggalExpired,
          },
        ),
      );
      final newSajiku = Sajiku(
        id: response.data['Sajiku'], 
        nama: sajiku.nama, 
        berat: sajiku.berat, 
        jumlah: sajiku.jumlah, 
        tanggalProduksi: sajiku.tanggalProduksi,
        tanggalExpired: sajiku.tanggalExpired,
      );
      return newSajiku;
    } catch (error) {
      rethrow;
    }
  }

  static Future<bool> updateSajiku(Sajiku newSajiku) async {
    final prefs = await SharedPreferences.getInstance();
    if(!prefs.containsKey('Sajiku')){
      return false;
    }

    final extractedSajikuData = jsonDecode(prefs.getString('Sajiku').toString());
    try{
      await Dio().patch(
        baseURL,
        data: jsonEncode(
          {
            'nama produk': newSajiku.nama,
            'berat produk': newSajiku.berat,
            'jumlah produk': newSajiku.jumlah,
            'tanggal produksi': newSajiku.tanggalProduksi,
            'tanggal expired': newSajiku.tanggalExpired,
          }
        )
      );
      return true;
    } catch (error) {
      rethrow;
    }
  }

  static Future<bool> deleteSajiku(String id) async {
    final prefs = await SharedPreferences.getInstance();
    if(!prefs.containsKey('Sajiku')){
      return false;
    }

    final extractedSajikuData = jsonDecode(prefs.getString('Sajiku').toString());
    try {
      await Dio().delete(baseURL);
      return true;
    } catch (error) {
      rethrow;
    }
  }
}
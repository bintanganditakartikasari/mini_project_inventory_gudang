import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mini_project_inventory_gudang/models/Sajiku_model.dart';

class SajikuAPI {
  static const baseURL = 'https://cloudminiproject-inventory-default-rtdb.asia-southeast1.firebasedatabase.app/Sajiku.json';

  Future<List<Sajiku>> getSajiku() async {

    List<Sajiku> data = [];

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

  Future<Sajiku?> addSajiku(Sajiku sajiku) async {
    
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

  Future<bool> updateSajiku(Sajiku newSajiku) async {
    
    try{
      await Dio().patch(
        'https://cloudminiproject-inventory-default-rtdb.asia-southeast1.firebasedatabase.app/Sajiku/${newSajiku.id}.json',
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

  Future<bool> deleteSajiku(String id) async {
    
    try {
      await Dio().delete('https://cloudminiproject-inventory-default-rtdb.asia-southeast1.firebasedatabase.app/Sajiku/$id.json');
      return true;
    } catch (error) {
      rethrow;
    }
  }
}
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mini_project_inventory_gudang/models/Masako_model.dart';

class MasakoAPI {
  static const baseURL = 'https://cloudminiproject-inventory-default-rtdb.asia-southeast1.firebasedatabase.app/Masako.json';
  final Dio _dio = Dio();

  Future<List<Masako>> getMasako() async {

    List<Masako> data = [];
    
    try {
      final response = await _dio.get(baseURL);
      if (response.data != null) {
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

  Future<Masako?> addMasako(Masako masako) async {

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

  Future<bool> updateMasako(Masako newMasako) async {
    
    try{
      await Dio().patch(
        'https://cloudminiproject-inventory-default-rtdb.asia-southeast1.firebasedatabase.app/Masako/${newMasako.id}.json',
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

  Future<bool> deleteMasako(String id) async {
    
    try {
      await Dio().delete('https://cloudminiproject-inventory-default-rtdb.asia-southeast1.firebasedatabase.app/Masako/$id.json');
      return true;
    } catch (error) {
      rethrow;
    }
  }
}
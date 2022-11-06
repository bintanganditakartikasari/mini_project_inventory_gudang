import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mini_project_inventory_gudang/models/ajinomoto_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AjinomotoAPI {
  static const baseURL = 'https://cloudminiproject-inventory-default-rtdb.asia-southeast1.firebasedatabase.app/Ajinomoto.json';
  late Dio _dio;

  AjinomotoAPI(){
    _dio = Dio();
  }

  Future<List<Ajinomoto>> getAjinomoto() async {
    final prefs = await SharedPreferences.getInstance();
    if(!prefs.containsKey('Ajinomoto')){
      return [];
    }

    List<Ajinomoto> dataAjinomoto = [];
    
    try {
      final response = await _dio.get(baseURL);
      if (response.data != null) {
      final extractedData = response.data as Map<String, dynamic>;
      if(extractedData.isEmpty) {
        return [];
      }
      extractedData.forEach((key, value) {
        dataAjinomoto.add(
          Ajinomoto(
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
    return dataAjinomoto;
  }
  

  static Future<Ajinomoto?> addAjinomoto(Ajinomoto ajinomoto) async {
    final prefs = await SharedPreferences.getInstance();
    if(!prefs.containsKey('Ajinomoto')){
      return null;
    }

    // final extractedAjinomotoData = jsonDecode(prefs.getString('Ajinomoto').toString());
    try {
      final response = await Dio().post(
        baseURL,
        data: jsonEncode(
          {
            'nama produk': ajinomoto.nama,
            'berat produk': ajinomoto.berat,
            'jumlah produk': ajinomoto.jumlah,
            'tanggal produksi': ajinomoto.tanggalProduksi,
            'tanggal expired': ajinomoto.tanggalExpired,
          },
        ),
      );
      final newAjinomoto = Ajinomoto(
        id: response.data['ajinomoto'], 
        nama: ajinomoto.nama, 
        berat: ajinomoto.berat, 
        jumlah: ajinomoto.jumlah, 
        tanggalProduksi: ajinomoto.tanggalProduksi,
        tanggalExpired: ajinomoto.tanggalExpired,
      );
      return newAjinomoto;
    } catch (error) {
      rethrow;
    }
  }

  static Future<bool> updateAjinomoto(Ajinomoto newAjinomoto) async {
    final prefs = await SharedPreferences.getInstance();
    if(!prefs.containsKey('Ajinomoto')){
      return false;
    }

    final extractedAjinomotoData = jsonDecode(prefs.getString('Ajinomoto').toString());
    try{
      await Dio().patch(
        baseURL,
        data: jsonEncode(
          {
            'nama produk': newAjinomoto.nama,
            'berat produk': newAjinomoto.berat,
            'jumlah produk': newAjinomoto.jumlah,
            'tanggal produksi': newAjinomoto.tanggalProduksi,
            'tanggal expired': newAjinomoto.tanggalExpired,
          }
        )
      );
      return true;
    } catch (error) {
      rethrow;
    }
  }

  static Future<bool> deleteAjinomoto(String id) async {
    final prefs = await SharedPreferences.getInstance();
    if(!prefs.containsKey('Ajinomoto')){
      return false;
    }

    final extractedAjinomotoData = jsonDecode(prefs.getString('Ajinomoto').toString());
    try {
      await Dio().delete(baseURL);
      return true;
    } catch (error) {
      rethrow;
    }
  }

  // Future<bool> editAjinomoto(Ajinomoto ajinomoto) async {
  //   final response = await _dio.put('$baseURL/${ajinomoto.id}',
  //   data: ajinomoto.toJson(),
  //   );
  //   if (response.data['id'] > 0) {
  //     return true;
  //   }
  //   return false;
  // }
}
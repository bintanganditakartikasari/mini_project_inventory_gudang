import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mini_project_inventory_gudang/models/Mayumi_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MayumiAPI {
  static const baseURL = 'https://cloudminiproject-inventory-default-rtdb.asia-southeast1.firebasedatabase.app/Mayumi.json';

  Future<List<Mayumi>> getMayumi() async {

    List<Mayumi> data = [];
   
    try {
      final response = await Dio().get(baseURL);
      if (response.data != null && response.data.isNotEmpty) {
      final extractedData = response.data as Map<String, dynamic>;
      if(extractedData.isEmpty) {
        return [];
      }
      extractedData.forEach((key, value) {
        data.add(
          Mayumi(
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

  Future<Mayumi?> addMayumi(Mayumi mayumi) async {
    
    try {
      final response = await Dio().post(
        baseURL,
        data: jsonEncode(
          {
            'nama produk': mayumi.nama,
            'berat produk': mayumi.berat,
            'jumlah produk': mayumi.jumlah,
            'tanggal produksi': mayumi.tanggalProduksi,
            'tanggal expired': mayumi.tanggalExpired,
          },
        ),
      );
      final newMayumi = Mayumi(
        id: response.data['Mayumi'], 
        nama: mayumi.nama, 
        berat: mayumi.berat, 
        jumlah: mayumi.jumlah, 
        tanggalProduksi: mayumi.tanggalProduksi,
        tanggalExpired: mayumi.tanggalExpired,
      );
      return newMayumi;
    } catch (error) {
      rethrow;
    }
  }

  Future<bool> updateMayumi(Mayumi newMayumi) async {
    
    try{
      await Dio().patch(
        'https://cloudminiproject-inventory-default-rtdb.asia-southeast1.firebasedatabase.app/Mayumi/${newMayumi.id}.json',
        data: jsonEncode(
          {
            'nama produk': newMayumi.nama,
            'berat produk': newMayumi.berat,
            'jumlah produk': newMayumi.jumlah,
            'tanggal produksi': newMayumi.tanggalProduksi,
            'tanggal expired': newMayumi.tanggalExpired,
          }
        )
      );
      return true;
    } catch (error) {
      rethrow;
    }
  }

  Future<bool> deleteMayumi(String id) async {
  
    try {
      await Dio().delete('https://cloudminiproject-inventory-default-rtdb.asia-southeast1.firebasedatabase.app/Mayumi/$id.json');
      return true;
    } catch (error) {
      rethrow;
    }
  }
}
import 'package:flutter/foundation.dart';
import 'package:mini_project_inventory_gudang/models/Masako_model.dart';
import 'package:mini_project_inventory_gudang/service/Masako_api.dart';
import 'package:flutter/material.dart';

class MasakoViewModel with ChangeNotifier {
  List<Masako> _masako = [];

  List<Masako> get masako {
    return [..._masako];
  }

  // getMasakoData() async {
  //   final masakoData = await MasakoAPI.getMasako();
  //   _masako = masakoData;
  //   notifyListeners();
  // }

  Future<void> getMasakoData() async {
    try {
      final result = await MasakoAPI.getMasako();
      result.sort(
        ((a, b) => a.tanggalProduksi.toString().compareTo(b.tanggalProduksi.toString()))
      );
      _masako = result;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  // Future<void> getMasakoData() async {
  //   try {
  //     final result = await MasakoAPI.getMasako();
  //     result.sort(
  //       ((a, b) => a.tanggalProduksi.toString().compareTo(b.tanggalProduksi.toString()))
  //     );
  //     _masako = result;
  //     notifyListeners();
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future<void> addMasako(Masako newMasako) async {
    try{
      final result = await MasakoAPI.addMasako(newMasako);
      if (result != null) {
        _masako.add(result);
        _masako.sort(
          (a, b) => a.tanggalProduksi.toString().compareTo(b.tanggalProduksi.toString()),
        );
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateMasako(Masako newMasako) async {
    final masakoIndex = _masako.indexWhere((masako) => masako.id == newMasako.id);
    if(masakoIndex >= 0) {
      try {
        final result = await MasakoAPI.updateMasako(newMasako);
        if(result == true) {
          _masako[masakoIndex] = newMasako;
          _masako.sort(
            (a, b) => a.tanggalProduksi.toString().compareTo(b.tanggalProduksi.toString()),
          );
          notifyListeners();
        }
      } catch (e) {
        rethrow;
      }
    }
  }

  Future<void> deleteMasako(String id) async {
    final masakoIndex = _masako.indexWhere((masako) => masako.id == id);
    if ( masakoIndex >= 0) {
      try {
        final result = await MasakoAPI.deleteMasako(id);
        if (result == true) {
          _masako.removeAt(masakoIndex);
          notifyListeners();
        }
      } catch (e) {
        rethrow;
      }
    }
  }
}
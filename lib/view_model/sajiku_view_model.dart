import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mini_project_inventory_gudang/models/Sajiku_model.dart';
import 'package:mini_project_inventory_gudang/service/Sajiku_api.dart';

class SajikuViewModel with ChangeNotifier {
  List<Sajiku> _sajiku = [];

  List<Sajiku> get sajiku {
    return [..._sajiku];
  }

  SajikuViewModel() {
    getSajikuData();
  }

  Future<void> getSajikuData() async {
    try {
      final result = await SajikuAPI().getSajiku();
      result.sort(
        ((a, b) => a.tanggalProduksi.toString().compareTo(b.tanggalProduksi.toString()))
      );
      _sajiku = result;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  // Future<void> getSajikuData() async {
  //   try {
  //     final result = await SajikuAPI.getSajiku();
  //     result.sort(
  //       ((a, b) => a.tanggalProduksi.toString().compareTo(b.tanggalProduksi.toString()))
  //     );
  //     _sajiku = result;
  //     notifyListeners();
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future<void> addSajiku(Sajiku newSajiku) async {
    try{
      final result = await SajikuAPI.addSajiku(newSajiku);
      if (result != null) {
        _sajiku.add(result);
        _sajiku.sort(
          (a, b) => a.tanggalProduksi.toString().compareTo(b.tanggalProduksi.toString()),
        );
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateSajiku(Sajiku newSajiku) async {
    final sajikuIndex = _sajiku.indexWhere((sajiku) => sajiku.id == newSajiku.id);
    if(sajikuIndex >= 0) {
      try {
        final result = await SajikuAPI.updateSajiku(newSajiku);
        if(result == true) {
          _sajiku[sajikuIndex] = newSajiku;
          _sajiku.sort(
            (a, b) => a.tanggalProduksi.toString().compareTo(b.tanggalProduksi.toString()),
          );
          notifyListeners();
        }
      } catch (e) {
        rethrow;
      }
    }
  }

  Future<void> deleteSajiku(String id) async {
    final sajikuIndex = _sajiku.indexWhere((sajiku) => sajiku.id == id);
    if ( sajikuIndex >= 0) {
      try {
        final result = await SajikuAPI.deleteSajiku(id);
        if (result == true) {
          _sajiku.removeAt(sajikuIndex);
          notifyListeners();
        }
      } catch (e) {
        rethrow;
      }
    }
  }
}
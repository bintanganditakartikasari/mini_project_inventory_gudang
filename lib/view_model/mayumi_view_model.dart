import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mini_project_inventory_gudang/models/Mayumi_model.dart';
import 'package:mini_project_inventory_gudang/service/mayumi_api.dart';

class MayumiViewModel with ChangeNotifier {
  List<Mayumi> _mayumi = [];

  List<Mayumi> get mayumi {
    return [..._mayumi];
  }

  MayumiViewModel() {
    getMayumiData();
  }

  Future<void> getMayumiData() async {
    try {
      final result = await MayumiAPI().getMayumi();
      result.sort(
        ((a, b) => a.tanggalProduksi.toString().compareTo(b.tanggalProduksi.toString()))
      );
      _mayumi = result;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addMayumi(Mayumi newMayumi) async {
    try{
      final result = await MayumiAPI().addMayumi(newMayumi);
      if (result != null) {
        _mayumi.add(result);
        _mayumi.sort(
          (a, b) => a.tanggalProduksi.toString().compareTo(b.tanggalProduksi.toString()), 
        );
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateMayumi(Mayumi newMayumi) async {
    final mayumiIndex = _mayumi.indexWhere((mayumi) => mayumi.id == newMayumi.id);
    if(mayumiIndex >= 0) {
      try {
        final result = await MayumiAPI().updateMayumi(newMayumi);
        if(result == true) {
          _mayumi[mayumiIndex] = newMayumi;
          _mayumi.sort(
            (a, b) => a.tanggalProduksi.toString().compareTo(b.tanggalProduksi.toString()),
          );
          notifyListeners();
        }
      } catch (e) {
        rethrow;
      }
    }
  }

  Future<void> deleteMayumi(String id) async {
    final mayumiIndex = _mayumi.indexWhere((mayumi) => mayumi.id == id);
    if ( mayumiIndex >= 0) {
      try {
        final result = await MayumiAPI().deleteMayumi(id);
        if (result == true) {
          _mayumi.removeAt(mayumiIndex);
          notifyListeners();
        }
      } catch (e) {
        rethrow;
      }
    }
  }
}
import 'package:flutter/foundation.dart';
import 'package:mini_project_inventory_gudang/models/ajinomoto_model.dart';
import 'package:mini_project_inventory_gudang/service/ajinomoto_api.dart';

class AjinomotoViewModel with ChangeNotifier {
  List<Ajinomoto> _ajinomoto = [];

  List<Ajinomoto> get ajinomoto {
    return [..._ajinomoto];
  }

  // getAjinomotoData() async {
  //   final ajinomotoData = await AjinomotoAPI.getAjinomoto();
  //   _ajinomoto = ajinomotoData;
  //   notifyListeners();
  // }

  Future<void> getAjinomotoData() async {
    try {
      final result = await AjinomotoAPI.getAjinomoto();
      result.sort(
        ((a, b) => a.tanggalProduksi.toString().compareTo(b.tanggalProduksi.toString()))
      );
      _ajinomoto = result;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addAjinomoto(Ajinomoto newAjinomoto) async {
    try{
      final result = await AjinomotoAPI.addAjinomoto(newAjinomoto);
      if (result != null) {
        _ajinomoto.add(result);
        _ajinomoto.sort(
          (a, b) => a.tanggalProduksi.toString().compareTo(b.tanggalProduksi.toString()),
        );
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateAjinomoto(Ajinomoto newAjinomoto) async {
    final ajinomotoIndex = _ajinomoto.indexWhere((ajinomoto) => ajinomoto.id == newAjinomoto.id);
    if(ajinomotoIndex >= 0) {
      try {
        final result = await AjinomotoAPI.updateAjinomoto(newAjinomoto);
        if(result == true) {
          _ajinomoto[ajinomotoIndex] = newAjinomoto;
          _ajinomoto.sort(
            (a, b) => a.tanggalProduksi.toString().compareTo(b.tanggalProduksi.toString()),
          );
          notifyListeners();
        }
      } catch (e) {
        rethrow;
      }
    }
  }

  Future<void> deleteAjinomoto(String id) async {
    final ajinomotoIndex = _ajinomoto.indexWhere((ajinomoto) => ajinomoto.id == id);
    if ( ajinomotoIndex >= 0) {
      try {
        final result = await AjinomotoAPI.deleteAjinomoto(id);
        if (result == true) {
          _ajinomoto.removeAt(ajinomotoIndex);
          notifyListeners();
        }
      } catch (e) {
        rethrow;
      }
    }
  }
}
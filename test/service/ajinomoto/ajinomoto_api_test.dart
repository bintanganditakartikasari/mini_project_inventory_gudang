import 'package:mini_project_inventory_gudang/models/ajinomoto_model.dart';
import 'package:mini_project_inventory_gudang/service/ajinomoto_api.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'ajinomoto_api_test.mocks.dart';

@GenerateMocks([AjinomotoAPI])
void main() {
  group('AjinomotoAPI', () {

    AjinomotoAPI ajinomotoAPI = MockAjinomotoAPI();

    test('get data ajinomoto product', () async {
      when(ajinomotoAPI.getAjinomoto()).thenAnswer(
        (_) async => <Ajinomoto>[
          Ajinomoto(
            nama: 'AJI-NO-MOTO', 
            berat: '24', 
            jumlah: '5000', 
            tanggalProduksi: '21/05/2021', 
            tanggalExpired: '30/11/2027')
        ]
      );
      var ajinomoto = await ajinomotoAPI.getAjinomoto();
      expect(ajinomoto.isNotEmpty, true);
    });
  });
}
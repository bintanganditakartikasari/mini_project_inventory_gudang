import 'package:mini_project_inventory_gudang/service/Sajiku_api.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([SajikuAPI])
void main() {

  group('SajikuAPI', (){
    test('get sajiku data', () async {
      var sajiku = await SajikuAPI().getSajiku();
      expect(sajiku.isNotEmpty, true);
    });
  });
}
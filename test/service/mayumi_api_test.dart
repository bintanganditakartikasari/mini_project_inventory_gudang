import 'package:mini_project_inventory_gudang/service/mayumi_api.dart';
import 'package:mockito/annotations.dart';
import 'package:test/test.dart';

@GenerateMocks([MayumiAPI])

void main() {
  group('MayumiPI', () {
    test('get mayumi data', () async {
      var mayumi = await MayumiAPI().getMayumi();
      expect(mayumi.isNotEmpty, true);
    });
  });
}
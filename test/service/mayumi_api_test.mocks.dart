// Mocks generated by Mockito 5.3.2 from annotations
// in mini_project_inventory_gudang/test/service/mayumi_api_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mini_project_inventory_gudang/service/mayumi_api.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [MayumiAPI].
///
/// See the documentation for Mockito's code generation for more information.
class MockMayumiAPI extends _i1.Mock implements _i2.MayumiAPI {
  MockMayumiAPI() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<dynamic>> getMayumi() => (super.noSuchMethod(
        Invocation.method(
          #getMayumi,
          [],
        ),
        returnValue: _i3.Future<List<dynamic>>.value(<dynamic>[]),
      ) as _i3.Future<List<dynamic>>);
  @override
  _i3.Future<dynamic> addMayumi(dynamic mayumi) => (super.noSuchMethod(
        Invocation.method(
          #addMayumi,
          [mayumi],
        ),
        returnValue: _i3.Future<dynamic>.value(),
      ) as _i3.Future<dynamic>);
  @override
  _i3.Future<bool> updateMayumi(dynamic newMayumi) => (super.noSuchMethod(
        Invocation.method(
          #updateMayumi,
          [newMayumi],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);
  @override
  _i3.Future<bool> deleteMayumi(String? id) => (super.noSuchMethod(
        Invocation.method(
          #deleteMayumi,
          [id],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);
}

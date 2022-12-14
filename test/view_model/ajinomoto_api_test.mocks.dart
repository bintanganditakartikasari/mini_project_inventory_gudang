// Mocks generated by Mockito 5.3.2 from annotations
// in mini_project_inventory_gudang/test/view_model/ajinomoto_api_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mini_project_inventory_gudang/models/ajinomoto_model.dart'
    as _i4;
import 'package:mini_project_inventory_gudang/service/ajinomoto_api.dart'
    as _i2;
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

/// A class which mocks [AjinomotoAPI].
///
/// See the documentation for Mockito's code generation for more information.
class MockAjinomotoAPI extends _i1.Mock implements _i2.AjinomotoAPI {
  MockAjinomotoAPI() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.Ajinomoto>> getAjinomoto() => (super.noSuchMethod(
        Invocation.method(
          #getAjinomoto,
          [],
        ),
        returnValue: _i3.Future<List<_i4.Ajinomoto>>.value(<_i4.Ajinomoto>[]),
      ) as _i3.Future<List<_i4.Ajinomoto>>);
  @override
  _i3.Future<_i4.Ajinomoto?> addAjinomoto(_i4.Ajinomoto? ajinomoto) =>
      (super.noSuchMethod(
        Invocation.method(
          #addAjinomoto,
          [ajinomoto],
        ),
        returnValue: _i3.Future<_i4.Ajinomoto?>.value(),
      ) as _i3.Future<_i4.Ajinomoto?>);
  @override
  _i3.Future<bool> updateAjinomoto(_i4.Ajinomoto? newAjinomoto) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateAjinomoto,
          [newAjinomoto],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);
  @override
  _i3.Future<bool> deleteAjinomoto(String? id) => (super.noSuchMethod(
        Invocation.method(
          #deleteAjinomoto,
          [id],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);
}

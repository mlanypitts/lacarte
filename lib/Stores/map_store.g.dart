// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MapStore on _MapStore, Store {
  late final _$markersAtom = Atom(name: '_MapStore.markers', context: context);

  @override
  Set<Marker> get markers {
    _$markersAtom.reportRead();
    return super.markers;
  }

  @override
  set markers(Set<Marker> value) {
    _$markersAtom.reportWrite(value, super.markers, () {
      super.markers = value;
    });
  }

  late final _$myCurrentPositionAtom =
      Atom(name: '_MapStore.myCurrentPosition', context: context);

  @override
  LatLng? get myCurrentPosition {
    _$myCurrentPositionAtom.reportRead();
    return super.myCurrentPosition;
  }

  @override
  set myCurrentPosition(LatLng? value) {
    _$myCurrentPositionAtom.reportWrite(value, super.myCurrentPosition, () {
      super.myCurrentPosition = value;
    });
  }

  late final _$searchVisibleAtom =
      Atom(name: '_MapStore.searchVisible', context: context);

  @override
  bool get searchVisible {
    _$searchVisibleAtom.reportRead();
    return super.searchVisible;
  }

  @override
  set searchVisible(bool value) {
    _$searchVisibleAtom.reportWrite(value, super.searchVisible, () {
      super.searchVisible = value;
    });
  }

  late final _$initialPositionAtom =
      Atom(name: '_MapStore.initialPosition', context: context);

  @override
  CameraPosition get initialPosition {
    _$initialPositionAtom.reportRead();
    return super.initialPosition;
  }

  @override
  set initialPosition(CameraPosition value) {
    _$initialPositionAtom.reportWrite(value, super.initialPosition, () {
      super.initialPosition = value;
    });
  }

  late final _$checkLocationPermissionAsyncAction =
      AsyncAction('_MapStore.checkLocationPermission', context: context);

  @override
  Future<void> checkLocationPermission() {
    return _$checkLocationPermissionAsyncAction
        .run(() => super.checkLocationPermission());
  }

  late final _$getCurrentLocationAsyncAction =
      AsyncAction('_MapStore.getCurrentLocation', context: context);

  @override
  Future<void> getCurrentLocation() {
    return _$getCurrentLocationAsyncAction
        .run(() => super.getCurrentLocation());
  }

  @override
  String toString() {
    return '''
markers: ${markers},
myCurrentPosition: ${myCurrentPosition},
searchVisible: ${searchVisible},
initialPosition: ${initialPosition}
    ''';
  }
}

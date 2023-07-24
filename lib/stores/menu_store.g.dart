// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MenuStore on _MenuStore, Store {
  late final _$foodItemsAtom =
      Atom(name: '_MenuStore.foodItems', context: context);

  @override
  List<FoodItemModel> get foodItems {
    _$foodItemsAtom.reportRead();
    return super.foodItems;
  }

  @override
  set foodItems(List<FoodItemModel> value) {
    _$foodItemsAtom.reportWrite(value, super.foodItems, () {
      super.foodItems = value;
    });
  }

  late final _$selectedItemsAtom =
      Atom(name: '_MenuStore.selectedItems', context: context);

  @override
  List<FoodItemModel> get selectedItems {
    _$selectedItemsAtom.reportRead();
    return super.selectedItems;
  }

  @override
  set selectedItems(List<FoodItemModel> value) {
    _$selectedItemsAtom.reportWrite(value, super.selectedItems, () {
      super.selectedItems = value;
    });
  }

  late final _$getMenuListAsyncAction =
      AsyncAction('_MenuStore.getMenuList', context: context);

  @override
  Future<void> getMenuList() {
    return _$getMenuListAsyncAction.run(() => super.getMenuList());
  }

  late final _$_MenuStoreActionController =
      ActionController(name: '_MenuStore', context: context);

  @override
  dynamic addToCart(FoodItemModel menuSelected) {
    final _$actionInfo =
        _$_MenuStoreActionController.startAction(name: '_MenuStore.addToCart');
    try {
      return super.addToCart(menuSelected);
    } finally {
      _$_MenuStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeFromCart(FoodItemModel menuSelected) {
    final _$actionInfo = _$_MenuStoreActionController.startAction(
        name: '_MenuStore.removeFromCart');
    try {
      return super.removeFromCart(menuSelected);
    } finally {
      _$_MenuStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
foodItems: ${foodItems},
selectedItems: ${selectedItems}
    ''';
  }
}

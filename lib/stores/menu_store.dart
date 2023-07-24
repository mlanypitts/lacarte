import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import '../models/food_model.dart';
import '../repositories/menu_repository.dart';
part 'menu_store.g.dart';

class MenuStore = _MenuStore with _$MenuStore;

abstract class _MenuStore with Store {
  final MenuRepository menuRepository= GetIt.I.get<MenuRepository>();

  @observable
  List<FoodItemModel> foodItems = ObservableList<FoodItemModel>();

  @observable
  List<FoodItemModel> selectedItems = ObservableList<FoodItemModel>();

  @action
  Future<void> getMenuList() async {
    foodItems = await menuRepository.readJsonData();
  }

  @action
  addToCart(FoodItemModel menuSelected){
    selectedItems.add(menuSelected);
  }

  @action
  removeFromCart(FoodItemModel menuSelected){
    selectedItems.remove(menuSelected);
  }


 }


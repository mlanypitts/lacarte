import 'dart:convert';

import 'package:flutter/services.dart' as rootBundle;

import '../models/food_model.dart';

class MenuRepository{

  Future <List<FoodItemModel>> readJsonData()  async {
    final jsonData = await rootBundle.rootBundle.loadString("assets/files/menu.json");
    final menulist = json.decode(jsonData) as List<dynamic>;
    return
      menulist.map((e) => FoodItemModel.fromJson(e)).toList();
  }

}
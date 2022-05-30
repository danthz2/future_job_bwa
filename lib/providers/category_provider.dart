import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:future_job/models/category_model.dart';
import 'package:http/http.dart' as http;

class CategoryProvider extends ChangeNotifier {
  Future<List<CategoryModel>> getCategory() async {
    var response =
        await http.get(Uri.parse("https://bwa-jobs.herokuapp.com/categories"));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      List<CategoryModel> category = data.map((e) {
        return CategoryModel.fromJson(e);
      }).toList();
      return category;
    } else {
      return <CategoryModel>[];
    }
  }
}

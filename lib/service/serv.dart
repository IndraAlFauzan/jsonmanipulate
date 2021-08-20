import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:test2/model/data_model.dart';

class Serv {
  static Future<List<DataModel>> readJson(String query) async {
    final String response = await rootBundle.loadString('assets/data.json');
    final List data = json.decode(response);

    return data.map((e) => DataModel.fromJson(e)).where((element) {
      final data1 = element.name!.toLowerCase();

      final filter = query.toLowerCase();

      return data1.contains(filter);
    }).toList();
  }
}

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:test2/model/data_model.dart';

class Serv {
  static Future<List<DataModel>> readJson(String query) async {
    final String response = await rootBundle.loadString('assets/data.json');
    final List data = json.decode(response);

    return data.map((e) => DataModel.fromJson(e)).where((element) {
      final data1 = element.type!.toLowerCase();
      final data2 = element.inventoryId!.toString();
      final data3 = element.name!.toLowerCase();
      final data4 = element.placement!.name.toString().toLowerCase();
      final data5 = element.tags!.toList().toString().toLowerCase();
      final data6 = element.placement!.roomId.toString().toLowerCase();

      final filter = query.toLowerCase();

      return data1.contains(filter) ||
          data2.contains(filter) ||
          data3.contains(filter) ||
          data4.contains(filter) ||
          data5.contains(filter) ||
          data6.contains(filter);
    }).toList();
  }
}

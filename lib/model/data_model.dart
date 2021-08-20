
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'data_model.g.dart';

List<DataModel> dataFromJson(String str) => List<DataModel>.from(json.decode(str).map((x) => DataModel.fromJson(x)));

String dataToJson(List<DataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
@JsonSerializable()
class DataModel {
    DataModel({
        this.inventoryId,
        this.name,
        this.type,
        this.tags,
        this.purchasedAt,
        this.placement,
    });

    int? inventoryId;
    String? name;
    String? type;
    List<String>? tags;
    int? purchasedAt;
    Placement? placement;

    DataModel copyWith({
        int? inventoryId,
        String? name,
        String? type,
        List<String>? tags,
        int? purchasedAt,
        Placement? placement,
    }) => 
        DataModel(
            inventoryId: inventoryId ?? this.inventoryId,
            name: name ?? this.name,
            type: type ?? this.type,
            tags: tags ?? this.tags,
            purchasedAt: purchasedAt ?? this.purchasedAt,
            placement: placement ?? this.placement,
        );

    factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        inventoryId: json["inventory_id"] ,
        name: json["name"],
        type: json["type"] ,
        tags: json["tags"] == null ? null : List<String>.from(json["tags"].map((x) => x)),
        purchasedAt: json["purchased_at"],
        placement: json["placement"] == null ? null : Placement.fromJson(json["placement"]),
    );

    Map<String, dynamic> toJson() => {
        "inventory_id": inventoryId ,
        "name": name ,
        "type": type,
        "tags": tags == null ? null : List<dynamic>.from(tags!.map((x) => x)),
        "purchased_at": purchasedAt ,
        "placement": placement == null ? null : placement!.toJson(),
    };
}

class Placement {
    Placement({
        this.roomId,
        this.name,
    });

    int? roomId;
    String? name;

    Placement copyWith({
        int? roomId,
        String? name,
    }) => 
        Placement(
            roomId: roomId ?? this.roomId,
            name: name ?? this.name,
        );

    factory Placement.fromJson(Map<String, dynamic> json) => Placement(
        roomId: json["room_id"] ,
        name: json["name"] ,
    );

    Map<String, dynamic> toJson() => {
        "room_id": roomId ,
        "name": name ,
    };
}

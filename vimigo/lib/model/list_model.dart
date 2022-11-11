import 'package:g_json/g_json.dart';

class ListModel {
  String name;
  String code;
  String imageURL;

  ListModel({
    required this.name,
    required this.code,
    required this.imageURL,
  });

  factory ListModel.fromJson(JSON json) {
    String name = json["name"].stringValue;
    String code = json["code"].stringValue;
    String imageURL = json["image_url"].stringValue;

    return ListModel(
      name: name,
      code: code,
      imageURL: imageURL,
    );
  }
}

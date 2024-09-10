

abstract class JsonSerializable {
  Map<String, dynamic> toJson();
}

class Data<T extends JsonSerializable> {
  final T? data;
  final String? dataType;

  Data({this.data, this.dataType});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      data: _getData<T>(json['data'][json['type']]),
      dataType: json['type'],
    );
  }

  static T? _getData<T extends JsonSerializable>(Map<String, dynamic> e) {
    if (T == String) {
      return e as T;
    }
    return null;
  }

  Map<String, dynamic> toJson() {
    if (dataType != null && dataType!.isNotEmpty) {
      return {
        'data': {
          dataType!: data?.toJson(),
        }
      };
    } else {
      return {
        'data': data?.toJson(),
      };
    }
  }
}

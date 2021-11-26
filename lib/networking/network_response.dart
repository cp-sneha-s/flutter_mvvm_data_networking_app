import 'dart:convert';

class Networkresponse {
  final String? message;

  Networkresponse({this.message});

  factory Networkresponse.fromRawJson(String str) =>
      Networkresponse.fromJson(jsonDecode(str));

  factory Networkresponse.fromJson(Map<String, dynamic> json) =>
      Networkresponse(message: json['company']['catchPhrase']);

  Map<String, dynamic> toJson() => {'message': message};
}

import 'dart:convert';
import 'package:http/http.dart';
import 'package:networking_example_app/model/person_model.dart';
import 'package:networking_example_app/networking/request_type.dart';

class PersonClient {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com/users';
  final Client _client;

  PersonClient(this._client);

  Future<Response> request(
      {required RequestType requestType, Person? person}) async {
    switch (requestType) {
      case RequestType.GET:
        return _client.get(Uri.parse(_baseUrl));
      case RequestType.POST:
        return _client.post(Uri.parse(_baseUrl),
            headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
            body: jsonEncode(<String, dynamic>{
              'name':person!.name,
              'city':person!.city,
              'email': person!.email,
            })

        );
      case RequestType.DELETE:
        return _client.delete(Uri.parse(_baseUrl),
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},);
      default:
        return throw Exception(
            'the http request method is not found');
    }
  }
}

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:networking_example_app/networking/request_type.dart';

class PersonClient {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com/users';
  final Client _client;

  PersonClient(this._client);

  Future<Response> request(
      {required RequestType requestType, dynamic parameter}) async {
    switch (requestType) {
      case RequestType.GET:
        return _client.get(Uri.parse(_baseUrl));
      case RequestType.POST:
        return _client.post(Uri.parse(_baseUrl),
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
            body: jsonEncode(parameter));
      case RequestType.DELETE:
        return _client.delete(Uri.parse(_baseUrl));
      default:
        return throw RequestTypeNotFoundException(
            'the http request method is not found');
    }
  }
}

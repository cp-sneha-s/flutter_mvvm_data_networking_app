import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:networking_example_app/model/person_model.dart';
import 'package:networking_example_app/networking/person_client.dart';
import 'package:networking_example_app/networking/request_type.dart';

class RemotedataSource {
  PersonClient client = PersonClient(Client());

  Future<List<Person>> getPerson() async {
    final response = await client.request(requestType: RequestType.GET);
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Person> persons= data.map((e) => Person.fromJson(e)).toList();
      print(persons.toString());

      return persons;

    } else {
      throw Exception('failed to load data!');
    }
  }

  Future<List<Person>> createPerson(Person person)async{
    final response = await client.request(requestType: RequestType.POST,person:person);
    if (response.statusCode == 201) {
     var data = jsonDecode(response.body);
      List<Person> persons= data.map((e) => Person.fromJson(e)).toList();
      print(persons.toString());
      return persons;
    } else {
      throw Exception('failed to load data!');
    }

  }
  Future<List<Person>> deletePerson(int index)async{
    final response = await client.request(requestType: RequestType.DELETE,);
    if (response.statusCode == 201) {
      var data = jsonDecode(response.body);
      List<Person> persons= data.map((e) => Person.fromJson(e)).toList();
      print(persons.toString());
      return persons;
    } else {
      throw Exception('failed to load data!');
    }

  }
}
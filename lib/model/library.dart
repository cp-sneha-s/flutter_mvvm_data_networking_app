import 'dart:convert';

import 'package:networking_example_app/model/person_model.dart';

class Library{
  final List<Person>? persons;
  Library({this.persons});
  factory Library.fromRawjson(String str)=>Library.fromJson(json.decode(str));

  factory Library.fromJson(Map<String, dynamic> json){
    return Library(persons: List<Person>.from(json))
  }

}
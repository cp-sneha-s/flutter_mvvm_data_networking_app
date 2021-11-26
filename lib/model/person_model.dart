class Person {
  String? name;
  String? city;
  String? email;
  Person({this.name, this.city, this.email});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      name: json['name'],
      city: json['address']['city'],
      email: json['email'],
    );
  }
  Map<String, dynamic> toJson() {
    return {'name': name, 'city': city, 'email': email};
  }
}

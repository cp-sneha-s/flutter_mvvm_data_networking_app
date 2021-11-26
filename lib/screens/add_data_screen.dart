import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:networking_example_app/model/person_model.dart';
import 'package:networking_example_app/networking/remote_data_source.dart';

class AddDataScreen extends StatefulWidget {
  @override
  _AddDataScreenState createState() => _AddDataScreenState();
}

class _AddDataScreenState extends State<AddDataScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  RemotedataSource _apiResponse = RemotedataSource();
  late Future<List<Person>> personList ;

  @override
  void initState() {
    super.initState();
   personList= _apiResponse.getPerson();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Add data'),
          ),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  onSubmitted: (name) {
                    nameController.text = name;
                  },
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: Text('Add Name'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: cityController,
                  onSubmitted: (name) {
                    cityController.text = name;
                  },
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: Text('Add city'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: emailController,
                  onSubmitted: (name) {
                    emailController.text = name;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    label: Text('Add Email'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Person person = Person(name: nameController.text,
                      city: cityController.text,
                      email: emailController.text);
                  setState(() {
                    personList= _apiResponse.createPerson(person);
                  });


                  print(person.toString());
                  Navigator.pop(context);
                },
                child: Text('ADD DATA'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

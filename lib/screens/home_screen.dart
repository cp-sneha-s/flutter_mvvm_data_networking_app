import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:networking_example_app/model/person_model.dart';
import 'package:networking_example_app/networking/remote_data_source.dart';
import 'add_data_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RemotedataSource _apiResponse = RemotedataSource();
 late Future<List<Person>> list;

  @override
  void initState() {
    super.initState();
    list= _apiResponse.getPerson();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('data Networking'),
          ),
          body: FutureBuilder(
              future: _apiResponse.getPerson(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Person>? personList = snapshot.data as List<Person>?;
                  return Center(
                    child: ListView.builder(
                      itemCount: personList!.length,
                      itemBuilder: (BuildContext context, int index) {

                        var person = personList![index];
                        return Dismissible(
                          onDismissed: (direction){
                                setState(() {
                                  personList.removeAt(index);
                                  list= _apiResponse.deletePerson(index);
                                });
                          },
                          key: UniqueKey(),
                          child: ListTile(
                            title: Text(
                              person.name,
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w600),
                            ),
                            subtitle: Text(
                              person.email,
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w600),
                            ),
                            trailing: Text(
                              person.city,
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w600),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  String errorMessage = snapshot.error.toString();
                  return Text((errorMessage));
                } else {
                  return CircularProgressIndicator();
                }
              }),

          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              print('Button Tapped!');
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddDataScreen()));
            },
          ),
        ),
      ), );
  }
}



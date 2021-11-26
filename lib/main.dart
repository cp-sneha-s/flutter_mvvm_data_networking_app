import 'package:flutter/material.dart';
import 'package:networking_example_app/add_data_screen.dart';

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('data Networking'),
          ),
          body: const Center(
            child: Text(
              'Starter Project',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              print('Button Tapped!');
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddDataScreen()));
            },
          ),
        ),
      ),
    );
  }
}

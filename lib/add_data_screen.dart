import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddDataScreen extends StatefulWidget {
  @override
  _AddDataScreenState createState() => _AddDataScreenState();
}

class _AddDataScreenState extends State<AddDataScreen> {
  TextEditingController controller = TextEditingController();
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
                  controller: controller,
                  onSubmitted: (name) {
                    controller.text = name;
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
                  controller: controller,
                  onSubmitted: (name) {
                    controller.text = name;
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
                  controller: controller,
                  onSubmitted: (name) {
                    controller.text = name;
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

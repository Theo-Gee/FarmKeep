import 'package:flutter/material.dart';
import "package:flutter/material.dart";

class AddRecordItem extends StatelessWidget {
  const AddRecordItem({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Add Record",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 2,
        backgroundColor: Colors.white,
      ),
      body: Form(
          child: ListView(
        padding: EdgeInsets.all(15),
        children: [
          SizedBox(
            height: 5.0,
          ),
          Text("Select product image",
              style: TextStyle(fontSize: 18, color: Colors.black)),
          GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                        title: Text("Select image source"),
                        content:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          ListTile(
                            title: Text("Select from Camera"),
                          )
                        ]));
                    Divider();

                    ListTile(
                      title: Text("Select from Gallery"),
                    );
                  });
            },
            child: Image.asset("assets/image11.png"),
          ),
        TextFormField(
        decoration: InputDecoration(
        labelText: 
        ),



        ),

        ],
      )),
    );
  }
}

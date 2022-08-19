// ignore_for_file: prefer_const_constructors

import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myproject/addrecorditem.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'recorditem.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1589117673827-5764002b0787?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"),
            ),
          )
        ],
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: RichText(
          text: TextSpan(
            text: "Farm",
            style: TextStyle(color: Colors.green),
            children: [
              TextSpan(
                  text: 'Keep',
                  style: TextStyle(
                      color: Colors.green, fontStyle: FontStyle.italic))
            ],
          ),
        ),
      ),
      drawer: const Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddRecordItem(),
              ));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.lightGreen,
      ),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Record Book for ',
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Farm 1',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      showDialog(
                        barrierDismissible: true,
                        context: context,
                        builder: (context) {
                          return Dialog(
                            child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: QrImage(
                                          data: 'This is a simple QR code',
                                          version: QrVersions.auto,
                                          size: 320,
                                          gapless: false),
                                    ),
                                    Text(
                                      "Scan QR code to download record book",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    SizedBox(height: 8),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("close",
                                          style: TextStyle(color: Colors.red)),
                                    ),
                                  ],
                                )),
                          );
                        },
                      );
                    },
                    child: Row(
                        // mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'GENERATE QR CODE',
                            style: TextStyle(
                                color: Colors.black,
                                decoration: TextDecoration.underline),
                          ),
                          Icon(Icons.qr_code),
                        ]),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          RecordItem(),
        ],
      ),
    );
  }
}

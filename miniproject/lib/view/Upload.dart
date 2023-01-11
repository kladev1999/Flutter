import 'dart:io';

import 'package:flutter/material.dart';

class Upload extends StatefulWidget {
  const Upload({super.key});

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  TextEditingController songnameController=TextEditingController();
  TextEditingController artistnameController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: ()=>selectfile(),
              child: const Text("Select Song"),
            ),
            ElevatedButton(
              onPressed: ()=>selectimage(),
              child: const Text("Select background image"),
            ),
            Padding(
              padding:const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              child:TextField(
                controller: songnameController,
              decoration: const InputDecoration(
                hintText: "Enter the name of Song"
              ),
            ),
            ),
            Padding(
              padding:const EdgeInsets.fromLTRB(20.0,10.0, 20.0, 10.0),
              child:TextField(
                controller: artistnameController,
              decoration: const InputDecoration(
                hintText: "Enter the name of the artist"
              ),
            ),
            ),

            ElevatedButton(
              onPressed: (){
                finalupload();
              },
              child: const Text("Submit"),
            )  
          ],
        ),
    );
  }
  
  void finalupload() {}
}

selectimage() {
}

selectfile() {
}
import 'dart:io';

import 'package:database_one/model/data.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import '../../db/functions/db_functions.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({Key? key}) : super(key: key);

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  final _nameController = TextEditingController();

  final _ageController = TextEditingController();

  final _numController = TextEditingController();

  final _mailController = TextEditingController();

  String? imagePath;

// builder----------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Student'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              dpImage(),
              szdBox,
              textFieldName(myController: _nameController, hintName: "Name"),
              szdBox,
              textFieldName(myController: _ageController, hintName: "Age"),
              szdBox,
              textFieldName(
                  myController: _numController, hintName: "phone Number"),
              szdBox,
              textFieldName(myController: _mailController, hintName: "E-mail"),
              szdBox,
              elavatedbtn(
                  myIcon: const Icon(Icons.person_add_alt_outlined),
                  myLabel: const Text('Add student')),
            ]),
          ),
        ));
  }

  // final ImagePicker _picker = ImagePicker();

//functionss-----------------------------------------

  Future<void> StudentAddBtn() async {
    final _name = _nameController.text.trim();
    final _age = _ageController.text.trim();
    final _number = _numController.text.trim();
    final _mail = _mailController.text.trim();

    if (_name.isEmpty || _age.isEmpty || _number.isEmpty || _mail.isEmpty) {
      return;
    }
    print('$_name $_age $_number $_mail');

    final _students = Student(
      name: _name,
      age: _age,
      number: _number,
      mail: _mail,
      image: imagePath!,
    );

    addStudent(_students);
  }

  Widget elavatedbtn({required Icon myIcon, required Text myLabel}) {
    return ElevatedButton.icon(
      onPressed: () {
        StudentAddBtn();

        Navigator.of(context).pop();
      },
      icon: myIcon,
      label: myLabel,
    );
  }

  Widget textFieldName(
      {required TextEditingController myController, hintName}) {
    return TextFormField(
      controller: myController,
      cursorColor: Colors.black,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        filled: true,
        fillColor: Color.fromRGBO(234, 236, 238, 2),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        hintText: hintName,
      ),
    );
  }

  Widget dpImage() {
    return Stack(
      children: [
        CircleAvatar(
          radius: 75,
          backgroundImage: imagePath == null
              ? AssetImage('assests/images.png') as ImageProvider
              : FileImage(File(imagePath!)),
        ),
        Positioned(
            bottom: 10,
            right: 25,
            child: InkWell(
                child: const Icon(
                  Icons.add_a_photo_outlined,
                  size: 30,
                ),
                onTap: () {
                  takePhoto();
                })),
      ],
    );
  }

  Future<void> takePhoto() async {
    final PickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (PickedFile != null) {
      setState(() {
        imagePath = PickedFile.path;
      });
    }
  }

  Widget szdBox = const SizedBox(height: 20);
}


  import 'dart:io';

import 'package:database_one/db/functions/db_functions.dart';
import 'package:database_one/model/data.dart';
import 'package:database_one/screens/widgets/list_student_widget.dart';

import 'package:database_one/screens/widgets/edit_profile_widget.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class StudentProfile extends StatelessWidget {
  final double coverHeight = 200;
  final double profileHeight = 200;

  StudentProfile({
    Key? key,
    required this.passValue,
    required this.passId,
  }) : super(key: key);

  Student passValue;
  final int passId;

//functions or widgets========================================================

  Widget content() {
    return Container(
      width: 200,
      height: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ProfileImage(),
          Text(
            ' ${passValue.name}',
            style: const TextStyle(fontSize: 28, fontFamily: 'Ubuntu'),
          ),
          Text('Age : ${passValue.age}',
              style: const TextStyle(fontSize: 18, color: Colors.grey)),
          Text('PH No : ${passValue.number}',
              style: const TextStyle(fontSize: 18, color: Colors.grey)),
          Text('E-mail : ${passValue.mail}',
              style: const TextStyle(fontSize: 18, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget ProfileImage() => CircleAvatar(
        backgroundImage: FileImage(File(passValue.image)),
        radius: profileHeight / 2,
      );

  Widget floatbtn(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EditProfile(
                        passValueProfile: passValue,
                        index: passId,
                      )));
        },
        child: const Icon(Icons.edit_outlined));
  }

//builder====================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: floatbtn(context),
        appBar: AppBar(
          title: const Text('Profile'),
          centerTitle: true,
        ),
        body: ListView(children: <Widget>[
          content(),
        ]));
  }
}



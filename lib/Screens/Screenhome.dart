import 'package:database_one/db/functions/db_functions.dart';
import 'package:database_one/screens/search.dart';
import 'package:database_one/screens/widgets/list_student_widget.dart';
import 'package:database_one/screens/widgets/add_student_widget.dart';
import 'package:flutter/material.dart';

class Screenhome extends StatelessWidget {
  const Screenhome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getStudents();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student List'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: ((context) => SearchScreen())));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: Column(
        children: const [
          Expanded(
            child: ListStudent(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddStudent()));
          // AddStudent();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}


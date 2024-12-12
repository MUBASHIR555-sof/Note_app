import 'dart:io';

import 'package:flutter/material.dart';
import 'package:note_app/function/db_function.dart';
import 'package:note_app/model/model.dart';
import 'package:note_app/screen/home.dart';

class AddPage extends StatefulWidget {
  AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController titleCtrl = TextEditingController();

  TextEditingController noteCrtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Icon(Icons.add_alert_outlined),
          SizedBox(
            width: 20,
          ),
          Icon(Icons.archive_outlined),
          SizedBox(width: 10)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(children: [
          Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: titleCtrl,
                style: const TextStyle(
                  fontSize: 20,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Title',
                ),
              ),
              TextField(
                controller: noteCrtl,
                style: const TextStyle(
                  fontSize: 14,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Note',
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                      },
                      icon: const Icon(Icons.add_box_outlined)),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.palette_outlined)),
                  const Icon(
                    Icons.format_color_text,
                    color: Colors.grey,
                  ),
                  const Spacer(),
                  const Text(
                    "Edited just now",
                    style: TextStyle(fontSize: 10),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  IconButton(
                      onPressed: () {
                        submitBtn(context);
                      },
                      icon: const Icon(Icons.check)),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.more_vert)),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }

  
  void submitBtn(BuildContext context) {
    var title = titleCtrl.text.trim();
    var note = noteCrtl.text.trim();
    if (title.isEmpty || note.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Title or Note is Empty")));
    } else {
      final addvalue = NoteData(title: title, note: note);
      adddata(addvalue);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    }
  }
}
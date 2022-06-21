import 'package:flutter/material.dart';
import 'package:notes_app_unpersisted/models/notes_model.dart';

class NotesPage extends StatefulWidget {
  NotesPage({Key? key, required this.model}) : super(key: key);

  NotesModel model;

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Note"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                initialValue: widget.model.title ?? "",
                //This function validates data and checks if it is right
                validator: (value) {
                  if (value == "" || value == null) {
                    return "Name cannot be empty";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  //When form is validated, this function is called and value is given to user
                  widget.model.title = value!;
                },
                //The text box is decorated to look like a text box with label and hint in it
                decoration: const InputDecoration(
                    labelText: "Note Name",
                    hintText: "Enter your note name here",
                    filled: true,
                    border: OutlineInputBorder()),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue: widget.model.content ?? "",
                  expands: true,
                  //This function validates data and checks if it is right
                  validator: (value) {
                    if (value == "" || value == null) {
                      return "Note cannot be empty";
                    } else {
                      return null;
                    }
                  },
                  maxLines: null,
                  onSaved: (value) {
                    //When form is validated, this function is called and value is given to user
                    widget.model.content = value!;
                  },
                  //The text box is decorated to look like a text box with label and hint in it
                  decoration: const InputDecoration(
                      labelText: "Note",
                      hintText: "Enter your note here",
                      filled: true,
                      border: OutlineInputBorder()),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();

            Navigator.of(context).pop();
          }
        },
        child: const Icon(Icons.done),
      ),
    );
  }
}

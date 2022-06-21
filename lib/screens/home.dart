import 'package:flutter/material.dart';
import 'package:notes_app_unpersisted/screens/take_notes.dart';

import '../models/notes_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<NotesModel> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
      ),
      body: list.isNotEmpty
          ? ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Text(list[index].title ?? "This note has no title"),
                    subtitle: Text(
                      list[index].content ?? "This note has no body",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          list.removeAt(index);
                        });
                      },
                    ),
                    onTap: () async {
                      await Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return NotesPage(
                          model: list[index],
                        );
                      }));
                      setState(() {});
                    },
                  ),
                );
              },
            )
          : const Center(
              child: Text("Add new notes!"),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          list.add(NotesModel());
          await Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return NotesPage(
              model: list.last,
            );
          }));
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

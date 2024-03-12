// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/models.dart'; 
import 'package:flutter_application_1/pages/search_page.dart'; 

class GroupDetailPage extends StatefulWidget {
  final Group group;

  const GroupDetailPage({Key? key, required this.group}) : super(key: key);

  @override
  _GroupDetailPageState createState() => _GroupDetailPageState();
}

class _GroupDetailPageState extends State<GroupDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.group.name),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: widget.group.items.length,
          itemBuilder: (context, index) {
            final item = widget.group.items[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: CheckboxListTile(
                secondary: const Icon(Icons.fastfood),
                title: Text(
                  item.name,
                  style: TextStyle(fontSize: 20),
                ),
                value: item.isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    item.isChecked = value!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SearchPage()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.deepOrange[200],
      ),
    );
  }
}

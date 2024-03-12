// group_detail_page.dart
import 'package:flutter/material.dart';
import 'groups_page.dart'; 

class GroupDetailPage extends StatelessWidget {
  final Group group;

  const GroupDetailPage({Key? key, required this.group}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(group.name),
      ),
      body: ListView.builder(
        itemCount: group.items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(group.items[index]),
          );
        },
      ),
    );
  }
}

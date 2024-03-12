// groups_page.dart
import 'package:flutter/material.dart';
import 'group_detail_page.dart';

class Group {
  String name;
  List<String> items;

  Group({required this.name, required this.items});
}

class GroupsPage extends StatefulWidget {
  @override
  _GroupsPageState createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
  List<Group> groups = [
    Group(name: 'Group 1', items: ['Bread', 'Apple', 'Milk']),
    Group(name: 'Group 2', items: ['Eggs', 'Flour', 'Sugar']),
    Group(name: 'Group 3', items: ['Tea', 'Coffee', 'Honey']),
  ];

  void _showAddGroupDialog() {
    TextEditingController _groupNameController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add New Group'),
          content: TextField(
            controller: _groupNameController,
            decoration: InputDecoration(hintText: "Group Name"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                if (_groupNameController.text.isNotEmpty) {
                  setState(() {
                    groups.add(Group(name: _groupNameController.text, items: []));
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Groups'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _showAddGroupDialog,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: groups.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(groups[index].name),
            onDismissed: (direction) {
              setState(() {
                groups.removeAt(index);
              });

              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('Group removed')));
            },
            background: Container(color: Colors.red),
            child: ListTile(
              title: Text(groups[index].name),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GroupDetailPage(group: groups[index]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

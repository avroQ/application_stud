// groups_page.dart
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'group_detail_page.dart';
import 'package:flutter_application_1/models/models.dart';

class GroupsPage extends StatefulWidget {
  @override
  _GroupsPageState createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
  List<Group> groups = [
    Group(name: 'Группа 1', items: [Item(name: 'Хлеб'), Item(name: 'Яблоки'), Item(name: 'Молоко')]),
    Group(name: 'Группа 2', items: [Item(name: 'Яйца'), Item(name: 'Ягодки'), Item(name: 'Сахар')]),
    Group(name: 'Группа 3', items: [Item(name: 'Чай'), Item(name: 'Кофе'), Item(name: 'Мед')])
  ];

 void _showDeleteDialog(int index) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Удалить группу"),
        content: Text("Вы уверене, что хотите удалить группу?"),
        actions: [
          TextButton(
            child: Text("Отменить"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text("Удалить"),
            onPressed: () {
              setState(() {
                groups.removeAt(index);
              });
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}


  void _showAddGroupDialog() {
    TextEditingController _groupNameController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Добавить новую группу'),
          content: TextField(
            controller: _groupNameController,
            decoration: InputDecoration(hintText: "Название"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Отменить'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Добавить'),
              onPressed: () {
                if (_groupNameController.text.isNotEmpty) {
                  setState(() {
                    groups
                        .add(Group(name: _groupNameController.text, items: []));
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
        title: Text(
          'Список покупок',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.deepOrange[200], 
        elevation: 4,
        centerTitle: true,
      ),
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Количество столбцов
          crossAxisSpacing: 15, // Промежуток между столбцами
          mainAxisSpacing: 15, // Промежуток между рядами
        ),
        itemCount: groups.length,
        itemBuilder: (context, index) {
          return _buildGroupTile(groups[index]);
        },
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        _showAddGroupDialog();
      },
      child: Icon(Icons.add),
      backgroundColor: Colors.pink[100],
    ),
  );
}


Widget _buildGroupTile(Group group) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => GroupDetailPage(group: group)),
      );
    },
onLongPress: () {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Удалить группу"),
        content: Text("Вы уверены, что хотите удалить ${group.name}?"),
        actions: <Widget>[
          TextButton(
            child: Text("Отменить"),
            onPressed: () {
              Navigator.of(context).pop(); // Закрывает диалог без действий
            },
          ),
          TextButton(
            child: const Text("Удалить"),
            onPressed: () {
              setState(() {
                groups.remove(group); // Удаляет группу
              });
              Navigator.of(context).pop(); // Закрывает диалог
            },
          ),
        ],
      );
    },
  );
},

    child: Container(
      padding: const EdgeInsets.only(top:25, left: 25),
      margin: const EdgeInsets.only(top:25, right: 15, left: 15),
      decoration: BoxDecoration(
        color: Colors.deepOrange[200], 
        borderRadius: BorderRadius.circular(30), 
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            group.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: group.items.length,
              itemBuilder: (context, index) {
                return Text('• ${group.items[index].name}');
              },
            ),
          ),
        ],
      ),
    ),
  );
}

}

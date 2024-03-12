// models.dart


class Item {
  String name;
  bool isChecked;

  Item({required this.name, this.isChecked = false});
}

class Group {
  String name;
  List<Item> items;

  Group({required this.name, required this.items});
}

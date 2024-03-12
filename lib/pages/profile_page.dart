import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class User { // для бэка должно быть
  String name;
  bool isFavorite;

  User({required this.name, this.isFavorite = false});
}

class _ProfilePageState extends State<ProfilePage> {
  String username = ""; // Начальное значение логина
  String avatarUrl = ""; // Начальный URL аватарки
  List<User> users = [
    User(name: 'Иван', isFavorite: true),
    User(name: 'Сергей'),
    User(name: 'Ольга', isFavorite: true),
  ]; // Список пользователей в группе с начальными значениями

  @override
  void initState() {
    super.initState();
    loadUserProfile(); // Предполагаемый метод для загрузки профиля пользователя
  }

  void loadUserProfile() {
    // Здесь должен быть код для загрузки данных пользователя из бэкенда
    // Сейчас это просто пример без смысла и логики
    setState(() {
      username = "UserUser"; // Получение с бэка
      avatarUrl = "../../assets/images/startava.png"; // Получение с бэка, как я понял можно сделать запрос в БД и он подтянет
                                                        // Сейчас это актив проекта, поэтому в строке 63 backgroundImage: AssetImage(avatarUrl) используем AssetImage
                                                        // после добавления скорее всего надо будет менять на другой ассет
    });
  }

  void showExitConfirmation(BuildContext context) {
    // Показываем AlertDialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Подтверждение'),
          content: const Text('Вы уверены, что хотите выйти?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Отмена'),
              onPressed: () {
                Navigator.of(context).pop(); // Закрываем диалог
              },
            ),
            TextButton(
              child: const Text('Выйти'),
              onPressed: () {
                // Здесь должна быть логика выхода из учетной записи
                // Например, очистка данных пользователя и переход на экран входа
                Navigator.of(context).pop(); // Закрываем диалог
              },
            ),
          ],
        );
      },
    );
  }

  void addUserToGroup() {
    final controller = TextEditingController();
    // Отображение диалогового окна для добавления пользователя, это пример для бэка, вроде как то так должно быть
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Добавить пользователя'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'Никнейм пользователя',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Отмена'),
          ),
          TextButton(
            onPressed: () {
              // Логика добавления пользователя (пример)
              final name = controller.text.trim();
              if (name.isNotEmpty) {
                setState(() {
                  users.add(User(name: name));
                });
              }
              Navigator.pop(context);
            },
            child: const Text('Добавить'),
          ),
        ],
      ),
    );
  }

  void removeUser(User user) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Удалить пользователя'),
          content: Text('Вы уверены, что хотите удалить ${user.name}?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Отмена'),
              onPressed: () {
                Navigator.of(context).pop(); // Закрываем диалог
              },
            ),
            TextButton(
              child: const Text('Удалить'),
              onPressed: () {
                setState(() {
                  users.remove(user);
                });
                Navigator.of(context).pop(); // Закрываем диалог
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Получение размеров экрана
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Расчет размера аватара в зависимости от размера экрана
    double avatarSize = screenWidth * 0.3; // Аватар будет 30% от ширины экрана

    // Адаптация размера шрифта
    double fontSize = screenHeight * 0.035; // Размер шрифта будет 3.5% от высоты экрана

    return Scaffold(
      appBar: AppBar(
        title: Text('Профиль'),
        backgroundColor: Colors.deepOrange[200],
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => showExitConfirmation(context),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 25.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: avatarSize / 2,
                  backgroundImage: AssetImage(avatarUrl), // Используем переменную для URL
                ),
                SizedBox(width: screenWidth * 0.13),
                Expanded(
                  child: Text(
                    username,
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          Container(
            color: Color.fromARGB(103, 255, 171, 145),
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Семья',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: addUserToGroup,
                      icon: const Icon(Icons.add_circle_outline),
                      color: Colors.black,
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    children: [
                      ...users.map((user) => UserTile(user: user, onRemove: () => removeUser(user))).toList(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


// это пример логики для бэка, корзина и фаворит
class UserTile extends StatefulWidget {
  final User user;
  final VoidCallback onRemove;

  const UserTile({Key? key, required this.user, required this.onRemove}) : super(key: key);

  @override
  _UserTileState createState() => _UserTileState();
}

class _UserTileState extends State<UserTile> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.user.isFavorite;
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
      widget.user.isFavorite = _isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.user.name,
        style: const TextStyle(fontSize: 16.0),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(_isFavorite ? Icons.star : Icons.star_border, color: _isFavorite ? Color.fromRGBO(255, 222, 113, 1) : null),
            onPressed: _toggleFavorite,
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: widget.onRemove,
          ),
        ],
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: ProfilePage()));
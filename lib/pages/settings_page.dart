// login_page.dart
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Настройки',
          style: TextStyle(fontSize: 30.0),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange[200],
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
        children: [
          ListTile(
            title: Text('Изменить пароль', style: TextStyle(fontSize: 20.0)),
            leading: Icon(Icons.lock),
            onTap: () {
              // Анимация при нажатии
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          ),
          ListTile(
            title: Text('Уведомления', style: TextStyle(fontSize: 20.0)),
            leading: Icon(Icons.notifications),
            trailing: Switch(
              value: true,
              onChanged: (bool value) {
                // Логика для включения/отключения уведомлений
              },
            ),
          ),
          ListTile(
            title: Text('Изменить профиль', style: TextStyle(fontSize: 20.0)),
            leading: Icon(Icons.person),
            onTap: () {
              // Анимация при нажатии
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          ),
          ListTile(
            title: Text('Настройки приватности', style: TextStyle(fontSize: 20.0)),
            leading: Icon(Icons.lock_outline),
            onTap: () {
              // Анимация при нажатии
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          ),
          ListTile(
            title: Text('Удалить аккаунт', style: TextStyle(fontSize: 20.0)),
            leading: Icon(Icons.delete),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Подтверить удаление аккаунта'),
                    content: Text('Вы уверены?'),
                    actions: [
                      TextButton(
                        child: Text('Отмена'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text('Удалить'),
                        onPressed: () {
                          // Логика для удаления аккаунта
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],   
      ),
    );
  }
}
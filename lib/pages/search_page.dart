import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Поиск'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(46.0),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search...',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(),
            ),
            prefixIcon: Icon(Icons.search),
          ),
          onSubmitted: (String value) {
            // Здесь логика поиска
            print('Пользователь ввёл для поиска: $value');
          },
          textInputAction: TextInputAction.search, // Устанавливаем действие клавиатуры на "поиск"
        ),
      ),
    );
  }
}

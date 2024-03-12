// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.deepOrange[200], 
        elevation: 4,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Column(
          children: <Widget>[
            _buildNotificationCard(
              context,
              'Notification 1',
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s',
            ),
            SizedBox(height: 16),
            _buildNotificationCard(
                context, 'Notification 2', 'This is a notification'),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationCard(
      BuildContext context, String title, String message) {
    return GestureDetector(
      onTap: () {
        _showNotificationDialog(context, title, message);
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.deepOrange[200],
        child: ListTile(
          leading: Icon(Icons.notifications_sharp),
          title: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            _truncateText(message, 40), // Динамически сокращаем текст
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  String _truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return text.substring(0, maxLength) + '...';
    }
  }

  void _showNotificationDialog(
      BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: Text(message),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

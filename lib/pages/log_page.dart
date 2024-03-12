import 'package:flutter/material.dart';
import '/pages/baza_page.dart'; // Предполагается, что у вас есть страница, на которую пользователь будет перенаправлен после входа

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginPage({super.key});

  void _login(BuildContext context) {
    // Здесь вы можете добавить вашу логику входа
    // Проверьте введенные данные и выполните вход

    // Временно мы просто переходим на главную страницу после входа
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => BazaPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            ElevatedButton(
              onPressed: () {
                _login(context);
              },
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () {
                // Отправить пользователя на страницу восстановления пароля
              },
              child: Text('Forgot Password?'),
            ),
          ],
        ),
      ),
    );
  }
}
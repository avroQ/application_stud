// registration_page.dart
import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // Здесь код для регистрации пользователя
      print('Form is valid (email: $_email, password: $_password)');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Screen'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
              validator: (value) => value!.isEmpty ? 'Please enter your email' : null,
              onSaved: (value) => _email = value!,
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
              validator: (value) => value!.isEmpty ? 'Please enter a password' : null,
              onSaved: (value) => _password = value!,
            ),
            // Добавьте дополнительные поля, если нужно
            ElevatedButton(
              onPressed: _submit,
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _textController = TextEditingController();
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Masukkan teks (A-Z atau a-z)',
                errorText: _errorMessage,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _validateInput();
              },
              child: Text('Kirim'),
            ),
          ],
        ),
      ),
    );
  }

  void _validateInput() {
    // Pola regular expression untuk alfabet A-Z atau a-z
    RegExp regex = RegExp(r'^[a-zA-Z]+$');

    String userInput = _textController.text;

    // Validasi
    if (userInput.isEmpty) {
      setState(() {
        _errorMessage = 'Teks tidak boleh kosong.';
      });
    } else if (!regex.hasMatch(userInput)) {
      setState(() {
        _errorMessage = 'Teks hanya boleh berisi alfabet A-Z atau a-z.';
      });
    } else {
      // Input valid, cetak ke log
      print('Input Valid: $userInput');
      setState(() {
        _errorMessage = ''; // Bersihkan pesan error jika ada
      });
    }
  }
}

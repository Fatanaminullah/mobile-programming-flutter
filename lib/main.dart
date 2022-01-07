import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'UAS';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
          appBar: AppBar(
            title: const Text(appTitle),
          ),
          body: const Padding(
            padding: EdgeInsets.all(16.0),
            child: MyForm(),
          )),
    );
  }
}

class FormData {
  final String nama;
  final String nim;

  FormData(this.nama, this.nim);
}

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  MyFormState createState() {
    return MyFormState();
  }
}

class MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  final nama = TextEditingController();
  final nim = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Image.network(
                "https://upload.wikimedia.org/wikipedia/id/1/1d/Logo_umc.gif",
                fit: BoxFit.fill),
          ),
          TextField(
            controller: nama,
            decoration: const InputDecoration(hintText: 'Nama Lengkap'),
          ),
          TextField(
            controller: nim,
            decoration: const InputDecoration(hintText: 'NIM'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(fixedSize: const Size(400, 40)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ConfirmationScreen(),
                    settings:
                        RouteSettings(arguments: FormData(nama.text, nim.text)),
                  ),
                );
              },
              child: const Text('Masuk'),
            ),
          ),
        ],
      ),
    );
  }
}

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as FormData;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Konfirmasi"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 4),
              child: const Text(
                'Nama Lengkap',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            Text(
              data.nama,
              style: TextStyle(fontSize: 22),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 4, top: 20),
              child: const Text(
                'NIM',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            Text(
              data.nim,
              style: TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}

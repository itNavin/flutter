import 'package:flutter/material.dart';
import 'validators.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Styling Demo';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatelessWidget {
  MyCustomForm({super.key});
  final TextEditingController name = TextEditingController();
  final TextEditingController studentId = TextEditingController();
  final TextEditingController email = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: name,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your Name',
                  ),
                  validator: Validators.compose([
                    Validators.required('Name is required'),
                    Validators.nameString('Name must contain only alphabets'),
                  ]),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: studentId,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your Student ID',
                  ),
                  validator: Validators.compose([
                    Validators.required('Student ID is required'),
                    Validators.studentId(
                        'Student ID must contain only numbers and 11 digits'),
                  ]),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: email,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your Email',
                  ),
                  validator: Validators.compose([
                    Validators.required('Email is required'),
                    Validators.email('Enter a valid email'),
                  ]),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    print('button pressed!');
                    bool validate = _formKey.currentState!.validate();
                    if (validate) {
                      print(name.text);
                      print(studentId.text);
                      print(email.text);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ConfirmPage(
                            name: name.text,
                            studentId: studentId.text,
                            email: email.text,
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ConfirmPage extends StatelessWidget {
  final String name;
  final String studentId;
  final String email;

  ConfirmPage(
      {super.key,
      required this.name,
      required this.studentId,
      required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirm Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Confirm your details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Name: $name'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Student ID: $studentId'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Email: $email'),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Edit',
                          style: TextStyle(color: Colors.red)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Confirmed()),
                        );
                      },
                      child: const Text(
                        'Confirm',
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Confirmed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmed'),
      ),
      body: const Center(
        child: Text('Details Confirmed!',
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.green)),
      ),
    );
  }
}

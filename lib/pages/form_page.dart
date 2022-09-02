import "package:flutter/material.dart";
import 'package:the_pay/pages/home.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  var name = '';
  String number = '';
  String email = '';
  String data = '';
  @override
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    print(name);
    return Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Sign Up Form",
                  style: TextStyle(fontSize: 30, color: Colors.red),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'name: ${name},number: ${number},email: ${email}',
                  style: TextStyle(fontSize: 20, color: Colors.green),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Enter your name"),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return "Enter correct name";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) => {
                    setState(() => {name = value})
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Enter your number"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter correct number";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) => {setState(() => number = value)},
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Enter your email"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter correct email";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) => {
                    setState(() => {email = value})
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a Snackbar.
                        // Scaffold.of(context).showSnackBar(
                        //     SnackBar(content: Text('Data is in processing.')));
                      }
                    },
                    child: const Text('submit')),
                ElevatedButton(
                    onPressed: () async {
                      data = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Home(
                                  name: name, number: number, email: email)));
                      print(data);
                      setState(() {
                        data = data;
                      });
                    },
                    child: const Text('Push to Home Page')),
                Text('Data:${data}')
              ],
            )));
  }
}

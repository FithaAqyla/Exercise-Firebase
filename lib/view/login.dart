import 'package:cloud/controller/auth_controller.dart';
import 'package:cloud/model/user_model.dart';
import 'package:cloud/view/contact.dart';
import 'package:cloud/view/register.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final authCtr = AuthController();
  final _formkey = GlobalKey<FormState>();
  bool tooglepass = true;
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage("assets/image/login.jpg"),
                        radius: 100,
                      ),
                      SizedBox(
                        height: 50,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "HAII!.",
                                style: TextStyle(
                                    fontSize: 34,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              ),
                            ]),
                      ),
                      SizedBox(
                        height: 30.0,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "login dulu kaka",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                            ]),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person_outline_outlined),
                              labelText: 'Name',
                              hintText: 'Enter your name',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              bool valid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value!);

                              if (value == null || value.isEmpty) {
                                return 'Enter your name!';
                              }
                            },
                            onChanged: (value) {
                              email = value;
                            },
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          TextFormField(
                            //keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock_outlined),
                                labelText: 'Password',
                                hintText: 'Enter your password',
                                border: OutlineInputBorder(),
                                suffix: InkWell(
                                  onTap: () {
                                    setState(() {
                                      tooglepass = !tooglepass;
                                    });
                                  },
                                  child: Icon(tooglepass
                                      ? Icons.visibility_off
                                      : Icons.visibility_off),
                                )),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 400,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            backgroundColor: Colors.blue,
                          ),
                          onPressed: () async {
                            if (_formkey.currentState!.validate()) {
                              UserModel? loginUser =
                                  await authCtr.signInWithEmailAndPassword(
                                      email!, password!);
                              if (loginUser != null) {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Login Berhasil'),
                                        content: const Text(
                                            'anda telah berhasil melakukan login'),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Contact()));
                                              print(loginUser.email);
                                            },
                                            child: const Text('ok'),
                                          )
                                        ],
                                      );
                                    });
                              }
                            }
                          },
                          child: Text(
                            'Login'.toUpperCase(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Dont have an account?",
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Register()));
                              },
                              child: const Text(
                                "Register",
                                style: TextStyle(color: Colors.blue),
                              ))
                        ],
                      ),
                    ],
                  ),
                ))));
  }
}

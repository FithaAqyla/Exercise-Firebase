import 'package:cloud/controller/contact_controller.dart';
import 'package:cloud/model/contact_model.dart';
import 'package:cloud/view/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AddContact extends StatefulWidget {
  const AddContact({super.key});

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  var contactController = ContactController();
  final formkey = GlobalKey<FormState>();
  String? name;
  String? phone;
  String? email;
  String? adress;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
            key: formkey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Name'),
                  onChanged: (value) {
                    name = value;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Phone'),
                  onChanged: (value) {
                    phone = value;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Email'),
                  onChanged: (value) {
                    email = value;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Address'),
                  onChanged: (value) {
                    adress = value;
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      ContactModel cm = ContactModel(
                          name: name!,
                          phone: phone!,
                          email: email!,
                          address: adress!);
                      contactController.addContact(cm);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Contact()));
                    },
                    child: const Text('Add Contact'))
              ],
            )),
      ),
    );
  }
}

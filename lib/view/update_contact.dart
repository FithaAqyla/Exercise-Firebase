import 'package:cloud/controller/contact_controller.dart';
import 'package:cloud/model/contact_model.dart';
import 'package:cloud/view/contact.dart';
import 'package:flutter/material.dart';

class UpdateContact extends StatefulWidget {
  const UpdateContact(
      {super.key,
      this.id,
      this.nname,
      this.pphone,
      this.eemail,
      this.aaddress});

  final String? id;
  final String? nname;
  final String? pphone;
  final String? eemail;
  final String? aaddress;
  @override
  State<UpdateContact> createState() => _UpdateContactState();
}

class _UpdateContactState extends State<UpdateContact> {
  var contactController = ContactController();
  final formkey = GlobalKey<FormState>();
  String? name;
  String? phone;
  String? email;
  String? adress;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    initialValue: widget.nname),
                TextFormField(
                    decoration: const InputDecoration(hintText: 'Phone'),
                    onChanged: (value) {
                      phone = value;
                    },
                    initialValue: widget.pphone),
                TextFormField(
                    decoration: const InputDecoration(hintText: 'Email'),
                    onChanged: (value) {
                      email = value;
                    },
                    initialValue: widget.eemail),
                TextFormField(
                    decoration: const InputDecoration(hintText: 'Address'),
                    onChanged: (value) {
                      adress = value;
                    },
                    initialValue: widget.aaddress),
                ElevatedButton(
                    onPressed: () {
                      ContactModel cm = ContactModel(
                          id: widget.id!,
                          name: name!,
                          phone: phone!,
                          email: email!,
                          address: adress!);
                      contactController.updateContact(cm);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Contact()));
                    },
                    child: const Text('Update Contact'))
              ],
            )),
      ),
    );
  }
}

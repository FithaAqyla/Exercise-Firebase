import 'package:cloud/controller/contact_controller.dart';
import 'package:cloud/view/add_contact.dart';
import 'package:cloud/view/update_contact.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  var cc = ContactController();

  @override
  void initState() {
    super.initState();
    cc.getContact();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Contact List',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: StreamBuilder<List<DocumentSnapshot>>(
                stream: cc.stream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  final List<DocumentSnapshot> datas = snapshot.data!;

                  return ListView.builder(
                    itemCount: datas.length,
                    itemBuilder: (context, index) {
                      final data = datas[index];
                      // if ((data.data() as Map<String, dynamic>).isEmpty) {
                      //   return const SizedBox.shrink();
                      // }
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UpdateContact(
                                          id: (data.id).toString(),
                                          nname: data.get('name').toString(),
                                          pphone: data.get('phone').toString(),
                                          eemail: data.get('email').toString(),
                                          aaddress:
                                              data.get('address').toString(),
                                        )));
                          },
                          child: Card(
                            elevation: 10,
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.blue,
                                child: Text(
                                  // '${snapshot.data!.data()!.containsKey("name") ? snapshot.data!.get("name") : "null"}',
                                  data
                                      .get('name')
                                      .substring(0, 1)
                                      .toUpperCase(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              title: Text(data.get('name')),
                              subtitle: Text(data.get('phone')),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  cc.deleteContact(data.id).then((value) {
                                    setState(() {
                                      cc.getContact();
                                    });
                                  });
                                  // cc
                                  //     .deleteContact(data.get('id').toString())
                                  //     .then((value) {
                                  //   setState(() {
                                  //     cc.getContact();
                                  //   });
                                  // });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Contact Deleted')));
                                },
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddContact()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

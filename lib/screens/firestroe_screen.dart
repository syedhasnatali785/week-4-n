import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> addUser() async {
    await FirebaseFirestore.instance.collection('users').add({
      'name': 'Hasnat',
      'email': 'test@mail.com',
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Firestore Data")),
      floatingActionButton: FloatingActionButton(
        onPressed: addUser,
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const CircularProgressIndicator();

          final docs = snapshot.data!.docs;

          return ListView(
            children: docs.map((doc) {
              return ListTile(
                title: Text(doc['name']),
                subtitle: Text(doc['email']),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

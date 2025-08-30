import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cinema App',
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  final CollectionReference movies =
      FirebaseFirestore.instance.collection('movies');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Movies")),
      body: StreamBuilder<QuerySnapshot>(
        stream: movies.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text("Błąd przy pobieraniu danych"));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data!.docs;

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              var movie = data[index];
              return ListTile(
                title: Text(movie['title']),
                subtitle: Text("Rok: ${movie['year']}"),
              );
            },
          );
        },
      ),
    );
  }
}
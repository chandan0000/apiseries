import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExampleTwo extends StatefulWidget {
  const ExampleTwo({Key? key}) : super(key: key);

  @override
  _ExampleTwoState createState() => _ExampleTwoState();
}

class _ExampleTwoState extends State<ExampleTwo> {
  List<Photos> photoList = [];
  Future<List<Photos>> getPhtot() async {
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        Photos photos = Photos(
          title_id: i['title'],
          url: i['url'],
          id: i["id"],
        );
        photoList.add(photos);
      }
      return photoList;
    } else {
      return photoList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api Course"),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
            future: getPhtot(),
            builder: (context, AsyncSnapshot<List<Photos>> snapshot) {
              return ListView.builder(
                  itemCount: photoList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(snapshot.data![index].url.toString()),
                      ),
                      subtitle: Text(snapshot.data![index].title_id.toString()),
                      title: Text(
                          "Notes id: ${snapshot.data![index].id}"),
                    );
                  });
            },
          ))
        ],
      ),
    );
  }
}

class Photos {
  String title_id, url;
  int id;
  Photos({required this.title_id, required this.url, required this.id});
}

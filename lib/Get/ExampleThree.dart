import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Model/UsersModel.dart';

class ExampleThree extends StatefulWidget {
  const ExampleThree({Key? key}) : super(key: key);

  @override
  _ExampleThreeState createState() => _ExampleThreeState();
}

class _ExampleThreeState extends State<ExampleThree> {
  List<UsersModel> userList = [];

  Future<List<UsersModel>> getUserApi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        print('name');
        userList.add(UsersModel.fromJson(i));
      }
      return userList;
    } else {
      return userList;
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
            future: getUserApi(),
            builder: (context, AsyncSnapshot<List<UsersModel>> snapshoot) {
              if (!snapshoot.hasData) {
                return const CircularProgressIndicator();
              } else {
                return ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            ReusbaleRow(
                                title: 'Name: ',
                                vale: snapshoot.data![index].name.toString(),
                            ),
                            ReusbaleRow(
                              title: 'username: ',
                              vale: snapshoot.data![index].username.toString(),
                            ),
                            ReusbaleRow(
                              title: 'Email: ',
                              vale: snapshoot.data![index].email.toString(),
                            ),
                            ReusbaleRow(
                              title: 'Address: ',
                              vale: snapshoot.data![index].address!.city.toString() +
                                  snapshoot.data![index].address!.geo!.lat.toString(),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ))
        ],
      ),
    );
  }
}

class ReusbaleRow extends StatelessWidget {
  String title, vale;

  ReusbaleRow({Key? key, required this.title, required this.vale})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(vale),
        ],
      ),
    );
  }
}

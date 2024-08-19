import 'package:flutter/material.dart';
// import 'package:http_request/post_result_model.dart';
// import 'user_model.dart';
import 'user_all_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // PostResult? postResult = null;
  // User? user = null;
  String output = "no data";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("API Demo"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ///// Punya model Post Result /////
              //  Text((postResult != null)
              //     ? '${postResult!.id} | ${postResult!.name} | ${postResult!.created}'
              //     : "Tidak ada data"),
              // ElevatedButton(
              //   onPressed: () {
              //     PostResult.connectToAPI("Hasnita", "Programmer")
              //         .then((value) {
              //       postResult = value;
              //       // update tampilan
              //       setState(() {});
              //     });
              //   },
              //   child: Text("POST"),
              // ),

              ///// Punya User model (Single data) /////
              // Text((user != null)
              //     ? '${user!.id} | ${user!.name} | '
              //     : "Tidak ada data"),
              // ElevatedButton(
              //   onPressed: () {
              //     User.connectToAPI("5").then((value) {
              //       user = value;
              //       setState(() {});
              //     });
              //   },
              //   child: Text("GET"),
              // ),

              ///// Membuat model untuk kumpulan banyak data /////
              Text(output),
              ElevatedButton(
                  onPressed: () {
                    UserAll.getUsers("2").then((users) {
                      output = "";
                      for (int i = 0; i < users.length; i++)
                        output = output + "[ " + users[i].name + " ] ";

                      setState(() {});
                    });
                  },
                  child: Text("GET"))
            ],
          ),
        ),
      ),
    );
  }
}

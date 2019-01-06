import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String data = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Simple Json Fetching"),
          backgroundColor: Colors.blueAccent,
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              MaterialButton(
                  child: Text("GET DATA"),
                  onPressed: () {
                    fetchPost();
                  }),
              Text(data)
            ],
          ),
        ));
  }
  Future<http.Response> fetchPost() async {
    /* var response = await http.get('https://reqres.in/api/users/2');
    setState(() {
    Map<String,dynamic> value = json.decode(response.body);
     var data_obj = value['data'];
     var name = data_obj['first_name'];
     data = name;

    }); */
   /* var response = await http.get('https://jsonplaceholder.typicode.com/users');
    setState(() {
      List<dynamic> value = json.decode(response.body);
      for(int i = 0 ; i< value.length ; i++)
        {
          var obj = value[i];
          var name = obj['name'];
          var address_obj = obj['address'];
          var street = address_obj['street'];
          print(street);
        }
    }); */
   var response = await http.get('https://reqres.in/api/users?page=2');
   setState(() {
     Map<String,dynamic> value = json.decode(response.body);
     var page = value['page'];
     List<dynamic> data = value['data'];
     for(int i = 0 ; i < data.length ; i++)
       {
         var obj = data[i];
         var first_name = obj['first_name'];
         print(first_name);
       }
   });
    return response;
  }
}





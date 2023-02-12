import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:restapiget/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<MahirData> mahirData = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context, Snapshot) {
        if(Snapshot.hasData){
          return ListView.builder(
          itemCount: mahirData.length,
          itemBuilder: (contex, index) {
            return Container(
              height: 115,
              color: Color.fromARGB(255, 15, 215, 245),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('User id: ${mahirData[index].userId}', 
                  style: TextStyle(fontSize: 18),
                  ),
                  Text('id: ${mahirData[index].id}', 
                  style: TextStyle(fontSize: 18),
                  ),
                  Text('Title: ${mahirData[index].title}', 
                  maxLines: 1,
                  style: TextStyle(fontSize: 18),
                  ),
                  Text('Body: ${mahirData[index].body}', 
                  maxLines: 1,
                  style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            );
          }
        );
        }
        else{
          return Center(child: CircularProgressIndicator(),
          );
        }
      }
    );
  }
    

    Future<List<MahirData>> getData() async{
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      var data = jsonDecode(response.body.toString());

      if(response.statusCode ==200){
        for(Map<String, dynamic> index in data){
          mahirData.add(MahirData.fromJson(index));
        }
        return mahirData;
      }else{
        return mahirData;
      }
    }


}

import 'package:flutter/material.dart';
import 'package:myapi/apiservice.dart';


import 'model/Products.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Apiservice apiservice=Apiservice();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(future: apiservice.fetchdata(), builder: (BuildContext context, AsyncSnapshot<List<Products>?> snapshot) {
        if (snapshot.hasError){
          return Text("ERROR..");
        }
        else if(snapshot.hasData){
          return ListView.builder(itemCount: snapshot.data!.length, itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage("${snapshot.data![index].thumbnail}"),
              ),
              title: Text("${snapshot.data![index].title}"),
              subtitle: Text("${snapshot.data![index].price}"),
            );
          },);
        }else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },

      ),

    );
  }
}



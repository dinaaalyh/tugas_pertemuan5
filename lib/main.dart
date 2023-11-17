import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'details.dart';
import 'newdata.dart';

void main()=>runApp(MaterialApp(
  title: "Dina Aaliyah 20210120061",
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    primarySwatch: Colors.indigo,
  ),
  home: const Home(),
));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List> getData() async{
  var url = Uri.parse('http://192.168.56.1/restapi5/list.php'); //Api Link
  final response = await http.post(url);
  return jsonDecode(response.body);
  }
  @override
  void initState() {
  getData();
  super.initState();
  }
  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar (
    title: const Center(child: Text("MyAplikasi"),),
    shape: const BeveledRectangleBorder(
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight:
      Radius.circular(20))
    ),
  ),
  // floatingActionButton: FloatingActionButton(
  //   onPressed: ()=>Navigator.of(context).push(
  //     MaterialPageRoute(
  //     builder: (BuildContext context)=> NewData(),
  //     ),
  //   ),
  //   child: const Icon(Icons.add),
  // ),
  body:FutureBuilder<List>(
    future: getData(),
    builder: (ctx,ss) {
      if(ss.hasError){
        print("error");
      }
      if(ss.hasData){
      return Items(list:ss.data!);
      }
      else{
      return const CircularProgressIndicator();
      }
    },
  ),
);
}
}

class Items extends StatelessWidget {
  List list;
  Items({Key? key, required this.list}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // ignore: unnecessary_null_comparison
      itemCount: list==null?0:list.length,
      itemBuilder: (ctx,i){
    return ListTile(
      leading: const Icon(Icons.text_snippet_outlined),
      title: Text(list[i]['name']), //Key
      subtitle: Text(list[i]['address']),
      trailing: Text(list[i]['salary']), //Key
      onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext
      context)=>Details(list:list,index:i),
      )),
    );
    }
    );
  }
  // @override
  // Widget Build(BuildContext context){
  //   var widget;
  //   return Scaffold(
  //     body: Center(child: Column(
  //       children: [
  //         Container(
  //           padding: const EdgeInsets.all(10),
  //           child: MaterialButton(
  //             color: Colors.amber,
  //             child: const Text("New Data"),
  //             onPressed: () => Navigator.of(context).push(
  //               MaterialPageRoute(
  //                 builder: (BuildContext context) => 
  //                 NewData(index: widget.index, list: widget.list)),
  //             ),
  //           )
  //         )
  //       ],
  //     )),
  //   );
  // }
}


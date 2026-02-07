import 'package:api_app/model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Dio dio = Dio();
  List<Model> data = [];
  getData() async {
    var response = await dio.get(
      "https://dummyjson.com/products/category/mens-shirts",
    );

    List jsonBody = response.data['products'];

    List<Model> listData = jsonBody.map((e) => Model.fromJson(e)).toList();
    data = listData;
    setState(() {});
    return listData;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      appBar: AppBar(
        title: Text("API COURSE"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Text(data[0].name ?? " "),
          Text(data[0].image ?? " "),
          Text(data[0].description ?? " "),
        ],
      ),
    );
  }
}


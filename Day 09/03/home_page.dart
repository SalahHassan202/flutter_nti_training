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
      body: data.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      data[index].name ?? "",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 8),

                    Image.network(
                      data[index].image ?? "",
                      height: 200,
                      width: 200,
                      fit: BoxFit.fill,
                    ),

                    SizedBox(height: 12),
                    Text(data[index].description ?? ""),
                    Divider(thickness: 1),
                  ],
                );
              },
            ),
    );
  }
}


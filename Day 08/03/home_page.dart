import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Dio dio = Dio();

  List list = [];

  Future<void> getData() async {
    var response = await dio.get(
      "https://fakestoreapi.com/products/category/electronics",
    );
    var jsonBody = response.data;

    list = jsonBody;

    setState(() {});
    return jsonBody;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Api NTI"), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (list.isNotEmpty)
              Image.network(list[0]['image'], height: 300, fit: BoxFit.fill)
            else
              const CircularProgressIndicator(),

            const SizedBox(height: 20),

            IconButton(
              onPressed: () {
                getData();
              },
              icon: const Icon(Icons.refresh, size: 30),
            ),
          ],
        ),
      ),
    );
  }
}


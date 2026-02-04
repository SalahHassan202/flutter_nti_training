import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Dio dio = Dio();

  String image = "";
  String text = "";

  Future<void> getData() async {
    var response = await dio.get("https://random-d.uk/api/v2/random");
    var jsonBody = response.data;

    image = jsonBody["url"];
    text = jsonBody["message"];

    setState(() {});
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
            if (image.isNotEmpty)
              Image.network(image, height: 300, fit: BoxFit.fill)
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


import 'package:api_app/list_view_widget.dart';
import 'package:api_app/model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// a523fc764ef04f7ba22f2968684499bd   ===> api keys
class _HomePageState extends State<HomePage> {
  Dio dio = Dio();
  Future<List<NewsModel>> getData() async {
    var response = await Dio().get(
      "https://newsapi.org/v2/everything?q=tesla&from=2026-01-07&sortBy=publishedAt&apiKey=a523fc764ef04f7ba22f2968684499bd",
    );

    List jsonBody = response.data['articles'] ?? [];

    return jsonBody.map((e) => NewsModel.fromJson(e)).toList();
  }

  // @override
  // void initState() {
  //   super.initState();
  //   getData();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      appBar: AppBar(
        title: Text("API COURSE"),
        centerTitle: true,
        elevation: 0,
      ),
      body: FutureBuilder<List<NewsModel>>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error"));
          } else if (snapshot.hasData) {
            return ListViewWidget(data: snapshot.data!);
          }

          return Container();
        },
      ),
    );
  }
}


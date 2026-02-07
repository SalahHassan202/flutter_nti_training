import 'package:api_app/list_view_widget.dart';
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

  Future<List<MealModel>> getData() async {
    var response = await dio.get(
      "https://www.themealdb.com/api/json/v1/1/search.php?s=chicken",
    );

    List jsonBody = response.data['meals'];

    return jsonBody.map((e) => MealModel.fromJson(e)).toList();
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
      body: FutureBuilder<List<MealModel>>(
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


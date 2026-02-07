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

  Future<List<Model>> getData() async
  {
    var response = await dio.get(
      "https://images-api.nasa.gov/search?q=moon&media_type=image",
    );

    List jsonBody = response.data['collection']['items'];

    return jsonBody.map((e) => Model.fromJson(e)).toList();
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
      body: FutureBuilder<List<Model>>(
        future: getData(),
        builder: (context, snapshot)
        {
          if (snapshot.connectionState == ConnectionState.waiting)
          {
            return Center(child: CircularProgressIndicator());
          }
          else if (snapshot.hasError)
          {
            return Center(child: Text("Error"));
          }
          else if (snapshot.hasData)
          {
            return ListViewWidget(data: snapshot.data!);
          }

          return Container();
        },
      ),
    );
  }
}


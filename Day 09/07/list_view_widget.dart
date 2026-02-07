import 'package:api_app/model.dart';
import 'package:flutter/material.dart';

class ListViewWidget extends StatelessWidget {
  final List<NewsModel> data;
  const ListViewWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: data[index].image != null
              ? Image.network(data[index].image!, width: 60, fit: BoxFit.cover)
              : null,
          title: Text(data[index].title),
          subtitle: Text(data[index].name),
        );
      },
    );
  }
}


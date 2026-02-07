import 'package:api_app/model.dart';
import 'package:flutter/material.dart';

class ListViewWidget extends StatelessWidget {
  final List<Model> data;
  const ListViewWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
    );
  }
}

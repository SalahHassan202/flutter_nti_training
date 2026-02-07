import 'package:api_app/model.dart';
import 'package:flutter/material.dart';

class ListViewWidget extends StatelessWidget {
  final List<MealModel> data;
  const ListViewWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                data[index].image,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 200,
                    color: Colors.grey[300],
                    child: const Icon(Icons.broken_image, size: 40),
                  );
                },
              ),

              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  data[index].name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  data[index].category,
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ),

              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }
}


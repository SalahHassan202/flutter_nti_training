import 'package:api_app/features/home/models/article_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getProducts(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF6F6F6),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Products",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is HomeSuccess) {
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  final ProductModel product = state.products[index];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey
                              // ignore: deprecated_member_use
                              .withOpacity(0.15),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                          child: Image.network(
                            product.image,
                            height: 220,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// Title
                              Text(
                                product.title,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 8),

                              /// Description
                              Text(
                                product.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(color: Colors.grey),
                              ),

                              const SizedBox(height: 12),

                              /// Price + Rating
                              Row(
                                children: [
                                  Text(
                                    "\$${product.price}",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                                  ),

                                  const Spacer(),

                                  const Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 18,
                                  ),

                                  const SizedBox(width: 4),

                                  Text(product.rating.toString()),
                                ],
                              ),

                              const SizedBox(height: 10),

                              /// Tags
                              Wrap(
                                spacing: 8,
                                children: product.tags
                                    .map(
                                      (tag) => Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                        child: Text(
                                          "#$tag",
                                          style: const TextStyle(fontSize: 12),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }

            if (state is HomeError) {
              return Center(child: Text(state.message));
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}

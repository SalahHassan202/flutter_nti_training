import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import "../models/article_model.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getArticles(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF3F3F3),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Articles",
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
                itemCount: state.articles.length,
                itemBuilder: (context, index) {
                  final ArticleModel article = state.articles[index];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          // ignore: deprecated_member_use
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (article.image.isNotEmpty)
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                            child: Image.network(
                              article.image,
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
                              Text(
                                article.title,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 8),

                              Text(
                                article.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(color: Colors.grey),
                              ),

                              const SizedBox(height: 16),

                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 18,
                                    backgroundImage: NetworkImage(
                                      article.authorImage,
                                    ),
                                  ),

                                  const SizedBox(width: 10),

                                  Text(
                                    article.author,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),

                                  const Spacer(),

                                  const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 18,
                                  ),

                                  const SizedBox(width: 4),

                                  Text(article.likes.toString()),

                                  const SizedBox(width: 12),

                                  const Icon(
                                    Icons.comment,
                                    color: Colors.blue,
                                    size: 18,
                                  ),

                                  const SizedBox(width: 4),

                                  Text(article.comments.toString()),
                                ],
                              ),

                              const SizedBox(height: 14),

                              /// Tags
                              Wrap(
                                spacing: 8,
                                runSpacing: 6,
                                children: article.tags.map<Widget>((tag) {
                                  return Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      "#$tag",
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  );
                                }).toList(),
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
              return const Center(child: Text("Error loading data"));
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}

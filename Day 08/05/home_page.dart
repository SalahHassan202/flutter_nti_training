import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
   const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Dio dio = Dio();
  List products = [];
  bool loading = true;

  Future<void> getData() async {
    try {
      var response = await dio.get(
        "https://dummyjson.com/products/category/smartphones",
      );

      products = response.data['products'];
    } catch (e) {
      debugPrint(e.toString());
    }

    loading = false;
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
      backgroundColor:  Color(0xffF5F5F5),
      appBar: AppBar(
        title:  Text("API COURSE"),
        centerTitle: true,
        elevation: 0,
      ),
      body: loading
          ?  Center(child: CircularProgressIndicator())
          : GridView.builder(
              padding:  EdgeInsets.all(16),
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 14,
                childAspectRatio: 0.65,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final item = products[index];

                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        // ignore: deprecated_member_use
                        color: Colors.black.withOpacity(.05),
                        blurRadius: 8,
                        offset:  Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius:  BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                        child: Image.network(
                          item['images'][0],
                          height: 160,
                          width: double.infinity,
                          fit: BoxFit.contain,
                        ),
                      ),

                       SizedBox(height: 8),

                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          item['title'],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:  TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                       Spacer(),

                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Text(
                              "\$${item['price']}",
                              style:  TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                             Spacer(),
                             Icon(
                              Icons.star,
                              size: 16,
                              color: Colors.amber,
                            ),
                             SizedBox(width: 4),
                            Text(
                              item['rating'].toString(),
                              style:  TextStyle(fontSize: 13),
                            ),
                          ],
                        ),
                      ),

                       SizedBox(height: 12),
                    ],
                  ),
                );
              },
            ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/blogProvider.dart';

class BlogDetailScreen extends StatelessWidget {
  static const String routeName = "/blogDetail-screen";
  final String id;
  BlogDetailScreen({required this.id});

  @override
  Widget build(BuildContext context) {
    final blogs = Provider.of<BlogProvider>(context).blogs;
    debugPrint("BlogDetailScreen: Received id: $id");

    final blog = blogs.firstWhere(
      (element) {
        debugPrint("Checking blog with deeplink: ${element['deeplink']}");
        return element['deeplink'] == id;
      },
      orElse: () {
        debugPrint("No blog found with id: $id");
        return {};
      },
    );

    if (blog.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text('Blog Detail')),
        body: Center(child: Text('Blog not found!')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(blog['title'])),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(blog['imageURL']),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(blog['content'], style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BlogProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<Map<String, dynamic>> blogs = [];

  Future<void> fetchBlogs() async {
    _isLoading = true;
    notifyListeners();
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('blog_posts').get();
      blogs = snapshot.docs.map((doc) {
        final data = doc.data();
        data['deeplink'] = doc.id;
        return data;
      }).toList();
      debugPrint("Fetched blogs: $blogs");
      notifyListeners();
    } catch (error) {
      print("Error fetching blogs: $error");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

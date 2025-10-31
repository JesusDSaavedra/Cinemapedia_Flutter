import 'package:flutter/material.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  static final GlobalKey<NavigatorState> categoriesNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'category');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CategoryView')),
      body: Center(child: Text('Categorias')),
    );
  }
}

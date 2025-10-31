import 'package:flutter/material.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  static final GlobalKey<NavigatorState> favoritesNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'favorite');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FavoriteView')),
      body: Center(child: Text('Favoritos')),
    );
  }
}

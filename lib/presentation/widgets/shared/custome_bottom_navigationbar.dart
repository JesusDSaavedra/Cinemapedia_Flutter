import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomeBottomNavigationbar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const CustomeBottomNavigationbar({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    //final colors = Theme.of(context).colorScheme;
    //final titleStyle = Theme.of(context).textTheme.titleMedium;

    return BottomNavigationBar(
      elevation: 0,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_max_outlined),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.label_outline),
          label: 'Categorías',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border_outlined),
          label: 'Favoritos',
        ),
      ],
      currentIndex: navigationShell.currentIndex,
      onTap: (int index) => navigationShell.goBranch(index),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorScreen extends StatelessWidget {
  final GoRouterState state;

  const ErrorScreen({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 80, color: Colors.red),
            SizedBox(height: 16),
            Text('Página no encontrada', style: TextStyle(fontSize: 24)),
            SizedBox(height: 8),
            Text(state.error?.toString() ?? 'Error desconocido'),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: Text('Volver al inicio'),
            ),
          ],
        ),
      ),
    );
  }
}

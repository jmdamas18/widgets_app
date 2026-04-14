import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackBar = SnackBar(
      content: const Text('Esto es un Snackbar'),
      duration: const Duration(seconds: 2),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('¿Estás seguro?'),
        content: const Text('Este es el contenido de la alerta'),
        actions: [
          TextButton(onPressed: () => context.pop(), child: const Text('Cancelar')),
          FilledButton(onPressed: () => context.pop(), child: const Text('Aceptar')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Snack Bars & Dialogs')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () => showAboutDialog(
                context: context,
                children: const [Text('lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor, nisl eget ultricies lacinia, nunc nisl aliquam nisl, eget aliquam nunc nisl eget nunc.')],
              ),
              child: const Text('Mostrar About Dialog'),
            ),
            FilledButton.tonal(onPressed: () => showCustomDialog(context), child: const Text('Mostrar Diálogo')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(label: const Text('Show Snackbar'), icon: const Icon(Icons.remove_red_eye_outlined), onPressed: () => showCustomSnackbar(context)),
    );
  }
}

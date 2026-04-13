import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const name = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buttons Screen')),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        child: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: Text('Elevated Btn')),
            ElevatedButton(onPressed: null, child: Text('Elevated Btn')),
            ElevatedButton.icon(onPressed: () {}, icon: Icon(Icons.access_alarm), label: Text('Elevated Btn Icon')),
            ElevatedButton.icon(onPressed: null, icon: Icon(Icons.access_alarm), label: Text('Elevated Btn Icon')),
            FilledButton(onPressed: () {}, child: Text('Filled Btn')),
            FilledButton(onPressed: null, child: Text('Filled Btn')),
            FilledButton.icon(onPressed: () {}, icon: Icon(Icons.save), label: Text('Filled Btn Icon')),
            FilledButton.icon(onPressed: null, icon: Icon(Icons.save), label: Text('Filled Btn Icon')),
            OutlinedButton(onPressed: () {}, child: Text('Outlined Btn')),
            OutlinedButton(onPressed: null, child: Text('Outlined Btn')),
            OutlinedButton.icon(onPressed: () {}, icon: Icon(Icons.delete), label: Text('Outlined Btn Icon')),
            OutlinedButton.icon(onPressed: null, icon: Icon(Icons.delete), label: Text('Outlined Btn Icon')),
            TextButton(onPressed: () {}, child: Text('Text Btn')),
            TextButton(onPressed: null, child: Text('Text Btn')),
            TextButton.icon(onPressed: () {}, icon: Icon(Icons.table_view), label: Text('Text Btn Icon')),
            TextButton.icon(onPressed: null, icon: Icon(Icons.table_view), label: Text('Text Btn Icon')),
            IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
            IconButton(onPressed: null, icon: Icon(Icons.settings)),

            IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite),
              style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(colors.primary), iconColor: WidgetStatePropertyAll(Colors.white)),
            ),

            // Custom Button
            CustomButton(),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: const Text('Custom Button', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}

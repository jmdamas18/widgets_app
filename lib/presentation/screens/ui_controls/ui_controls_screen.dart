import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI Controls')),
      body: _UiControlsView(),
    );
  }
}

enum Trasportation { car, plane, boat, submarine }

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  Trasportation selectedTransportation = Trasportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer Mode '),
          subtitle: const Text('Controles adicionales'),
          value: isDeveloper,
          onChanged: (value) {
            setState(() {
              isDeveloper = value;
            });
          },
        ),

        ExpansionTile(
          title: Text('Vehículo de Transporte'),
          subtitle: Text('$selectedTransportation'),
          children: [
            RadioGroup<Trasportation>(
              groupValue: selectedTransportation,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = value!;
                });
              },
              child: Column(
                children: [
                  RadioListTile(title: const Text('By Car'), subtitle: const Text('Viajar en coche'), value: Trasportation.car),
                  RadioListTile(title: const Text('By Plane'), subtitle: const Text('Viajar en avión'), value: Trasportation.plane),
                  RadioListTile(title: const Text('By Boat'), subtitle: const Text('Viajar en barco'), value: Trasportation.boat),
                  RadioListTile(title: const Text('By Submarine'), subtitle: const Text('Viajar en submarino'), value: Trasportation.submarine),
                ],
              ),
            ),
          ],
        ),

        ExpansionTile(
          title: Text('Comidas'),
          subtitle: Text('Selecciona tus comidas'),
          children: [
            CheckboxListTile(title: const Text('¿Desayuno?'), value: wantsBreakfast, onChanged: (value) => setState(() => wantsBreakfast = value!)),
            CheckboxListTile(title: const Text('¿Almuerzo?'), value: wantsLunch, onChanged: (value) => setState(() => wantsLunch = value!)),
            CheckboxListTile(title: const Text('¿Cena?'), value: wantsDinner, onChanged: (value) => setState(() => wantsDinner = value!)),
          ],
        ),
      ],
    );
  }
}

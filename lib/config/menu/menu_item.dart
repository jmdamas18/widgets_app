import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String route;
  final IconData icon;

  const MenuItem({required this.title, required this.subTitle, required this.route, required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(title: 'Botones', subTitle: 'Varios tipos de botones', route: '/buttons', icon: Icons.smart_button_outlined),
  MenuItem(title: 'Tarjetas', subTitle: 'Varios tipos de tarjetas', route: '/cards', icon: Icons.credit_card),
  MenuItem(title: 'Indicadores de Progreso', subTitle: 'Generales y controlados', route: '/progress', icon: Icons.refresh),
  MenuItem(title: 'Snack Bars y Dialogs', subTitle: 'Indicadores y diálogos', route: '/snackbars', icon: Icons.info),
  MenuItem(title: 'Animaciones', subTitle: 'Animaciones predefinidas', route: '/animated', icon: Icons.animation),
  MenuItem(title: 'UI Controls + Tiles', subTitle: 'Controles de UI', route: '/ui-controls', icon: Icons.build_circle),
];

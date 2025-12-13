import 'package:flutter/material.dart';

class Destination {
  const Destination(this.index, this.titleKey, this.icon,this.selectedIcon, this.color);

  final int index;
  final String titleKey;
  final IconData icon;
  final IconData selectedIcon;
  final MaterialColor color;
}
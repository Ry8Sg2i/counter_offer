import 'package:flutter/material.dart';

extension BuildContextE on BuildContext {
  Future<void> to(Widget view) async {
    await Navigator.of(this).push(
      MaterialPageRoute(
        builder: (context) {
          return view;
        },
      ),
    );
  }
}
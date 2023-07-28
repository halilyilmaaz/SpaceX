import 'dart:ui';

import 'package:flutter/material.dart';

class SpaceXBacground extends StatelessWidget {
  final Widget child;
  const SpaceXBacground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.black,
          width: double.infinity,
          height: double.infinity,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: const Alignment(2, 1),
              colors: [
                Colors.pink.withOpacity(0.15),
                Colors.green.withOpacity(0.09),
                Colors.deepPurple.withOpacity(0.15),
                Colors.pink.withOpacity(0.15),
              ],
              tileMode: TileMode.clamp,
            ),
          ),
          child: SafeArea(child: child),
        ),
      ],
    );
  }
}

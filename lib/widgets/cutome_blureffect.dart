import 'dart:ui';
import 'package:flutter/material.dart';
class BlurEffect extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final Widget child;

  BlurEffect({
    required this.width,
    required this.height,
    required this.borderRadius,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Stack(
        children: [
          // Background layer with gradient
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Colors.white10],
              ),
              color: Colors.white.withOpacity(1),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          // Blur effect layer
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                color: Colors.white.withOpacity(0.1),
              ),
            ),
          ),
          // Child content
          Center(child: child),
        ],
      ),
    );
  }
}

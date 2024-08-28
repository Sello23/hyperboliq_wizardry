import 'package:flutter/material.dart';

class ExceptionTile extends StatelessWidget {
  const ExceptionTile({super.key, required this.message, required this.iconShown});

  final String message;
  final IconData iconShown;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.8),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconShown,
            size: 100,
            color: Colors.white,
          ),
          const SizedBox(height: 20),
          Text(
            message,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

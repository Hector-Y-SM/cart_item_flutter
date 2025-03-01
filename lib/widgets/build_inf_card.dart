import 'package:flutter/material.dart';

class BuildInfCard extends StatelessWidget {
  final IconData? icon;
  final String text;
  final Color color;
  const BuildInfCard({super.key, required this.icon, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
        return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, color: color, size: 16),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              text,
              style: TextStyle(
                color: color,
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
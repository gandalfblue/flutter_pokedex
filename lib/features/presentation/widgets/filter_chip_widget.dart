import 'package:flutter/material.dart';

/// Chip individual de filtro activo con botón de eliminar.
class FilterChipWidget extends StatelessWidget {
  final String label;
  final Widget icon;
  final Color color;
  final Color textColor;
  final VoidCallback onRemove;

  const FilterChipWidget({
    required this.label,
    required this.icon,
    required this.color,
    required this.textColor,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 6),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
          const SizedBox(width: 4),
          GestureDetector(
            onTap: onRemove,
            child: Icon(Icons.close_rounded, size: 12, color: textColor),
          ),
        ],
      ),
    );
  }
}
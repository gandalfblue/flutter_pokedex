import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final VoidCallback? onFilterTap;
  final bool hasActiveFilter;

  const SearchBarWidget({
    super.key,
    required this.onChanged,
    this.onFilterTap,
    this.hasActiveFilter = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: Container(
        height: 46,
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(12),
          border: hasActiveFilter
              ? Border.all(color: const Color(0xFF6390F0), width: 1.5)
              : null,
        ),
        child: TextField(
          onChanged: onChanged,
          style: const TextStyle(fontSize: 14, color: Colors.black87),
          decoration: InputDecoration(
            hintText: 'Buscar Pokémon...',
            hintStyle: const TextStyle(color: Colors.black38, fontSize: 14),
            prefixIcon:
                const Icon(Icons.search, color: Colors.black38, size: 20),
            suffixIcon: GestureDetector(
              onTap: onFilterTap,
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: hasActiveFilter
                      ? const Color(0xFF6390F0)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.tune_rounded,
                  color: hasActiveFilter ? Colors.white : Colors.black54,
                  size: 20,
                ),
              ),
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 13),
          ),
        ),
      ),
    );
  }
}
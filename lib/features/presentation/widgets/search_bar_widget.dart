import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const SearchBarWidget({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: Container(
        height: 46,
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextField(
          onChanged: onChanged,
          style: const TextStyle(fontSize: 14, color: Colors.black87),
          decoration: const InputDecoration(
            hintText: 'Procurar Pokémon...',
            hintStyle: TextStyle(color: Colors.black38, fontSize: 14),
            prefixIcon: Icon(Icons.search, color: Colors.black38, size: 20),
            suffixIcon: Icon(Icons.search, color: Colors.black54, size: 20),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 13),
          ),
        ),
      ),
    );
  }
}
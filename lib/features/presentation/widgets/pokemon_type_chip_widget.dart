import 'package:flutter/material.dart';
import '../../../core/utils/pokemon_type_utils.dart';
import '../../domain/entities/pokemon_type_entity.dart';

class TypeChipWidget extends StatelessWidget {
  final PokemonTypeEntity type;

  const TypeChipWidget({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final color = PokemonTypeUtils.typeColor(type.name);
    final textColor = PokemonTypeUtils.typeTextColor(type.name);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        PokemonTypeUtils.typeName(type.name),
        style: TextStyle(
          color: textColor,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
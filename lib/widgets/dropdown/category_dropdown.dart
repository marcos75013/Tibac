import 'package:flutter/material.dart';
import 'package:petit_bac/config/theming/colors_constant.dart';

class CategoryDropdown extends StatelessWidget {
  final String? selectedCategory;
  final ValueChanged<String?> onChanged;

  const CategoryDropdown({
    super.key,
    required this.selectedCategory,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: DropdownButtonFormField<String>(
        isExpanded: true,
        value: selectedCategory,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
          border: OutlineInputBorder(),
        ),
        hint: const Text('Categories'), 
        items: <String>[
          'Animal',
          'Pays',
          'Métier',
          'Prénom',
          'Ville',
          'Objet',
          'Célébrité',
          'Aliment',
          'Sport',
          'Marque',
          'Couleur',
          'Vêtement',
          'Musique',
          'Film',
          'Série',
          'Livre',
          'Personnage de fiction',
          'Personnage historique',
          'Personnage de dessin animé',
          'Personnage de manga',
        ].map<DropdownMenuItem<String>>((String category) {
          return DropdownMenuItem<String>(
            value: category,
            child: Text(category),
          );
        }).toList(),
        onChanged: onChanged,
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 24,
        dropdownColor: ColorsConstant.backgroundBouton,
        borderRadius: BorderRadius.circular(12.0),
      ),
    );
  }
}

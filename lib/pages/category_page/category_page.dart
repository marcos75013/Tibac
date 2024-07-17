import 'package:flutter/material.dart';
import 'package:petit_bac/config/theming/colors_constant.dart';
import 'package:petit_bac/pages/choix_lettre/choix_lettre_page.dart';
import 'package:petit_bac/widgets/appBarTibac/app_bar_tibac.dart';
import 'package:petit_bac/widgets/bouton/bouton_widget.dart';
import 'package:petit_bac/widgets/card_title/card_title_widget.dart';
import 'package:petit_bac/widgets/dropdown/category_dropdown.dart';
import 'package:petit_bac/widgets/Drawer/drawer_content.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  CategoryPageState createState() => CategoryPageState();
}

class CategoryPageState extends State<CategoryPage> {
  String? selectedCategory;
  List<String> selectedCategories = [];

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Erreur'),
        content: const Text('Veuillez sélectionner au moins une catégorie.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTibac(
        logoPath: "lib/assets/pngs/petit_bac_logo.png",
        onMenuPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      drawer: const DrawerContent(),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(36.0),
            child: CardTitleWidget(
              title: 'CHOIX DE CATEGORIES',
              backgroundColor: ColorsConstant.primaryYellow,
              borderRadius: 12.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: CategoryDropdown(
                selectedCategory: selectedCategory,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCategory = newValue;
                    if (newValue != null && !selectedCategories.contains(newValue)) {
                      selectedCategories.add(newValue);
                    }
                  });
                },
              ),
            ),
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Categories de la partie',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.overline,
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 8,
                  runSpacing: 0,
                  children: selectedCategories.map((category) {
                    return Chip(
                      labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: ColorsConstant.black),
                      backgroundColor: ColorsConstant.primaryYellow,
                      label: Text(category),
                      deleteIcon: const Icon(Icons.close, color: ColorsConstant.iconCloseRed, size: 16),
                      onDeleted: () {
                        setState(() {
                          selectedCategories.remove(category);
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: BoutonWidget(
              text: "SUIVANT",
              onPressed: () {
                if (selectedCategories.isEmpty) {
                  _showErrorDialog();
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChoixLettrePage(
                        categories: selectedCategories,
                        initialScoreTotal: 0,
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

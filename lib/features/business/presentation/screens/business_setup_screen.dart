import 'package:flutter/material.dart';

import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';

class BusinessSetupScreen extends StatelessWidget {
  const BusinessSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Business setup')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: const [
            AppTextField(label: 'Nom du commerce', icon: Icons.store_outlined),
            SizedBox(height: 14),
            AppTextField(label: 'Catégorie', icon: Icons.category_outlined),
            SizedBox(height: 14),
            AppTextField(label: 'Ville', icon: Icons.location_city_outlined),
            SizedBox(height: 14),
            AppTextField(label: 'Adresse', icon: Icons.place_outlined),
            SizedBox(height: 14),
            AppTextField(label: 'Téléphone', icon: Icons.phone_outlined),
            SizedBox(height: 24),
            AppButton(
              label: 'Sauvegarder',
              icon: Icons.save_outlined,
              onPressed: null,
            ),
          ],
        ),
      ),
    );
  }
}
